#include "riscv_test.h"
#include "test_macros.h"

#if (DRAM_BASE >> 30 << 30) != DRAM_BASE
# error This test requires DRAM_BASE be SV39 superpage-aligned
#endif

#if __riscv_xlen != 64
# error This test requires RV64
#endif

RVTEST_RV64M
RVTEST_CODE_BEGIN

.align 2
.option push
.option norvc
  ######################
  # Set instruction trigger
  li a1, 0
  csrw tselect, a1

  la a1, test_point
  csrw tdata2, a1
  csrr a1, tdata2

  # type dmode maskmax                 sizehi hit select timing sizelo action chain match m 0 s u x w r
  # 0010   0___000 000_0 4x7       0_____00____0     0______0_____00    0000    0___000 0_1_0_1 1_1_0_0
  li a1, 0x200000000003005c
  csrw tdata1, a1
  csrr a1, tdata1

  li TESTNUM, 1
test_point:
  addi x0, x0, 0 // inst addr bp

  RVTEST_PASS

  TEST_PASSFAIL

  .align 2
  .global mtvec_handler
mtvec_handler:
  csrr a3, mtval
  csrr a1, mcause
  RVTEST_PASS

die:
  RVTEST_FAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
