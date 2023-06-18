#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN


  # Flipping the MSB of the address
  la t2, tdat1
  li t0, 1 << (__riscv_xlen - 1)
  xor t0, t0, t2

  # A load to an illegal address should throw page fault
  li TESTNUM, 2
  lb t2, (t0)

  TEST_PASSFAIL


RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

tdat:
tdat1:  .dword 0x00ff00ff00ff00ff

RVTEST_DATA_END
