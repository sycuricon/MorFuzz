
#include <fcntl.h>
#include <stdio.h>
#include <svdpi.h>
#include <time.h>
#include <unistd.h>

#include "cj.h"

cosim_cj_t *simulator = NULL;
config_t cfg;
char *spike_misa = "rv64gc";

char *difuzzrtl_dir = NULL;

extern "C" void cosim_init(const char *testcase, unsigned char verbose) {
  difuzzrtl_dir = getenv("DIFUZZRTL_INPUT");
 
  cfg.elffiles = std::vector<std::string>{testcase};
  cfg.isa = spike_misa;
  cfg.blind = true;
  cfg.commit_ecall = true;
  cfg.sync_state = true;
  cfg.dump_wdata = true;
  if (verbose) cfg.verbose = true;
  simulator = new cosim_cj_t(cfg);
  return;
}

extern "C" int cosim_commit(int hartid, reg_t dut_pc, uint32_t dut_insn) {
  return simulator->cosim_commit_stage(0, dut_pc, dut_insn, true);
}

extern "C" int cosim_judge(int hartid, const char *which, int dut_waddr,
                           reg_t dut_wdata) {
  if (strcmp(which, "float") == 0)
    return simulator->cosim_judge_stage(0, dut_waddr, dut_wdata, true);
  else
    return simulator->cosim_judge_stage(0, dut_waddr, dut_wdata, false);
}

extern "C" void cosim_raise_trap(int hartid, reg_t cause) {
  simulator->cosim_raise_trap(hartid, cause);
}

extern "C" reg_t cosim_get_tohost() { return simulator->get_tohost(); }

extern "C" void cosim_set_tohost(reg_t value) { simulator->set_tohost(value); }

extern "C" unsigned long int cosim_randomizer_insn(unsigned long int in,
                                                   unsigned long int pc) {
  if (simulator && in != 0) {
    return simulator->cosim_randomizer_insn(in, pc);
  } else
    return in;
}

extern "C" unsigned long int cosim_randomizer_data(unsigned int read_select) {
  reg_t addr = read_select;
  // printf("[Magic] Read Select = %u; Addr = %u \n", read_select, addr);
  if (simulator) {
    return simulator->cosim_randomizer_data(addr);
  } else {
    return 0x20220611;
  }
}

extern "C" void cosim_reinit(const char *testcase, unsigned char verbose) {
  if (simulator) {
    delete simulator;
  }

  cfg.elffiles = std::vector<std::string>{testcase};

  if (verbose) cfg.verbose = true;
  simulator = new cosim_cj_t(cfg);
  return;
}

#define MAX_ROUND 5
#define MAX_ELF 10

const char *log_file = "../../../difuzzrtl-log.txt";

/* return a non zero value to reinitialize memory */
extern "C" int coverage_collector(unsigned long int cov) {
  static unsigned int elf_current = 0;
  static unsigned long int cov_summary = 0;
  static unsigned long int inst_cnt_summary = 0;
  static int fd = 0;
  static time_t start_time = 0;

  if (fd == 0) {
    fd = open(log_file, O_CREAT | O_SYNC | O_TRUNC | O_WRONLY, 0666);
  }
  if (start_time == 0) {
    start_time = time(NULL);
  }
  int delta_cov = cov - cov_summary;
  unsigned long inst_cnt = simulator->get_instruction_count();
  time_t current_time = time(NULL);
  unsigned long passed_time = (unsigned long)difftime(current_time, start_time);
  char current_log[1024];
  sprintf(current_log,
          "[CJ] (%d) coverage summary %d (+%d),\tinstruction count %ld "
          "(+%ld),\tpassed time %d hours, %d minutes, %d seconds\n",
          elf_current, cov, delta_cov, inst_cnt_summary + inst_cnt, inst_cnt,
          passed_time / 3600, (passed_time % 3600) / 60, passed_time % 60);
  printf(current_log);
  write(fd, current_log, strlen(current_log));

  reg_t tohost = simulator->get_tohost();
  simulator->set_tohost(0);
  cov_summary = cov;
  inst_cnt_summary += inst_cnt;

  remove("./testcase.elf");
  remove("./testcase.hex");
  char path_name[1024];

  sprintf(path_name, "%s/input_%d.elf", difuzzrtl_dir, elf_current);
  printf("%s\n", path_name);
  if (access(path_name, 0) == -1) {
    printf("Finish all %d testcase, exit...  (tohost: %d)\n", elf_current,
           tohost);
    exit(0);
  }
  printf("Redirect to %s\n", path_name);
  symlink(path_name, "./testcase.elf");
  sprintf(path_name, "%s/input_%d.hex", difuzzrtl_dir, elf_current);
  printf("Redirect to %s\n", path_name);
  symlink(path_name, "./testcase.hex");
  elf_current++;

  return 1;
}
