
#include <svdpi.h>
#include <time.h>
#include <stdio.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include "cj.h"

config_t cfg;
char* spike_misa = "rv64gch_zk_xrocc";
cosim_cj_t* simulator = NULL;

extern "C" void cosim_init (const char *testcase, unsigned char verbose) {
  cfg.elffiles = std::vector<std::string> {testcase};
  cfg.isa = spike_misa;
  cfg.blind = false;
  cfg.commit_ecall = true;
  cfg.sync_state = false;
  if (verbose)
    cfg.verbose = true;
  simulator = new cosim_cj_t(cfg);
  return;
}

extern "C" int cosim_commit (int hartid, reg_t dut_pc, uint32_t dut_insn) {
  return simulator->cosim_commit_stage(0, dut_pc, dut_insn, true);
}

extern "C" int cosim_judge (int hartid, const char * which, int dut_waddr, reg_t dut_wdata) {
  if (strcmp(which, "float") == 0)
    return simulator->cosim_judge_stage(0, dut_waddr, dut_wdata, true);
  else
    return simulator->cosim_judge_stage(0, dut_waddr, dut_wdata, false);
}

extern "C" void cosim_raise_trap (int hartid, reg_t cause) {
  simulator->cosim_raise_trap(hartid, cause);
}

extern "C" reg_t cosim_get_tohost () {
  return simulator->get_tohost();
}

extern "C" void cosim_set_tohost (reg_t value) {
  simulator->set_tohost(value);
}

extern "C" unsigned long int cosim_randomizer_insn (unsigned long int in, unsigned long int pc) {
  if (simulator && in != 0) {
    return simulator->cosim_randomizer_insn(in, pc);
  }
  else
    return in;
}

extern "C" unsigned long int cosim_randomizer_data (unsigned int read_select) {
  reg_t addr = read_select;
  if (simulator) {
    return simulator->cosim_randomizer_data(addr);
  }
  else {
    return 0x20220611;
  }
}

extern "C" void cosim_reinit (const char *testcase, unsigned char verbose) {
  if (simulator) {
    delete simulator;
  }

  cfg.elffiles = std::vector<std::string> {testcase};

  if (verbose)
    cfg.verbose = true;
  simulator = new cosim_cj_t(cfg);
  return;
}

/* return a non zero value to reinitialize memory */
extern "C" int coverage_collector(unsigned long int cov) {  
  return 1;
}
