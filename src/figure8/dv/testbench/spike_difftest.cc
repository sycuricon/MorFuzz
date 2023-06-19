
#include <fcntl.h>
#include <stdio.h>
#include <svdpi.h>
#include <time.h>
#include <unistd.h>

#include "cj.h"

cosim_cj_t *simulator = NULL;
config_t cfg;
char *spike_misa = "rv64gc";

char *morfuzz_prerelease = NULL;
char dv_dir[1024] = "";

extern "C" void cosim_init(const char *testcase, unsigned char verbose) {
  morfuzz_prerelease = getenv("MORFUZZ_PRERELEASE");
  strcpy(dv_dir, getenv("DEPENDENCY"));
  strcat(dv_dir, "/riscv-dv");

  cfg.elffiles = std::vector<std::string>{testcase};
  cfg.isa = spike_misa;
  cfg.blind = true;
  cfg.commit_ecall = true;
  cfg.sync_state = true;
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

const char *log_file = "../../../dv-log.txt";

static char dv_test_list[][100] = {"riscv_arithmetic_basic_test",
                                   "riscv_rand_instr_test",
                                   "riscv_jump_stress_test",
                                   "riscv_loop_test",
                                   "riscv_rand_jump_test",
                                   "riscv_mmu_stress_test",
                                   "riscv_no_fence_test",
                                   "riscv_illegal_instr_test",
                                   "riscv_ebreak_test",
                                   "riscv_ebreak_debug_mode_test",
                                   "riscv_full_interrupt_test",
                                   "riscv_unaligned_load_store_test",
                                   "riscv_non_compressed_instr_test",
                                   "riscv_hint_instr_test",
                                   "riscv_pmp_test",
                                   "riscv_machine_mode_rand_test",
                                   "riscv_privileged_mode_rand_test",
                                   "riscv_invalid_csr_test",
                                   "riscv_sfence_exception_test",
                                   "riscv_amo_test",
                                   "riscv_floating_point_arithmetic_test",
                                   "riscv_floating_point_rand_test",
                                   "riscv_floating_point_mmu_stress_test"};

/* return a non zero value to reinitialize memory */
extern "C" int coverage_collector(unsigned long int cov) {
  static unsigned int elf_current = 0;
  static unsigned long int cov_summary = 0;
  static unsigned long int inst_cnt_summary = 0;
  static int fd = 0;
  static time_t start_time = 0;
  static int test_index = 0;

  if (fd == 0) {
    fd = open(log_file, O_CREAT | O_SYNC | O_TRUNC | O_WRONLY, 0666);
  }
  if (start_time == 0) {
    start_time = time(NULL);
    srand(start_time);
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
  char gen_cmd[1024], compile_cmd[1024], testcase[1024], testcase_bin[1024],
      gen_hex[1024], testcase_hex[1024];
  uint64_t seed = rand();
  sprintf(gen_cmd,
          "python3 run.py --target rv64gc --test=%s --seed %d "
          "--output testcase_fig8 "
          "--steps gen",
          dv_test_list[test_index], seed);
  sprintf(compile_cmd,
          "python3 run.py --target rv64gc --test=%s --seed %d "
          "--output testcase_fig8 "
          "--steps gcc_compile",
          dv_test_list[test_index], seed);
  sprintf(testcase, "testcase_fig8/asm_test/%s_0.o", dv_test_list[test_index]);
  sprintf(testcase_bin, "testcase_fig8/asm_test/%s_0.bin",
          dv_test_list[test_index]);
  sprintf(testcase_hex, "testcase_fig8/asm_test/%s_0.hex",
          dv_test_list[test_index]);
  sprintf(gen_hex, "od -v -An -tx8 %s > %s", testcase_bin, testcase_hex);
  test_index = (test_index + 1) % 23;

  char cwd[1024];
  getcwd(cwd, 1024);
  chdir(dv_dir);
  printf("[RISCV-DV Generate] %s\n", gen_cmd);
  system(gen_cmd);
  printf("[RISCV-DV Compile] %s\n", compile_cmd);
  system(compile_cmd);
  system(gen_hex);
  chdir(cwd);

  char elf_full_name[1024], hex_full_name[1024];
  sprintf(elf_full_name, "%s/%s", dv_dir, testcase);
  sprintf(hex_full_name, "%s/%s", dv_dir, testcase_hex);

  printf("Redirect to %s\n", elf_full_name);
  symlink(elf_full_name, "./testcase.elf");
  printf("Redirect to %s\n", hex_full_name);
  symlink(hex_full_name, "./testcase.hex");
  elf_current++;

  return 1;
}
