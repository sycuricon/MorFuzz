# See LICENSE for license details.

#*****************************************************************************
# simple.S
#-----------------------------------------------------------------------------
#
# This is the most basic self checking test. If your simulator does not
# pass thiss then there is little chance that it will pass any of the
# more complicated self checking tests.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

.align 2
.option push
.option norvc



csrr      a0, mstatus
li        a0, 0x01 << 13  # FS = Initial
csrs      mstatus, a0
csrr t0, mstatus

fld fs1, float1, a0
csrr t0, mstatus


RVTEST_PASS

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA
tdata1: .dword 0x41e2e80040000000
float1: .dword 0x3fe0000000000000  # 0.5
float2: .dword 0x3ff8000000000000  # 1.5
float3: .dword 0x0000000000000000  # 0
float4: .dword 0x7ff8000000000000
float5: .dword 0x7ff0000000000001
d3:             .dword 0xafed9959475b70be, 0x2bed4e8b7e4f98d5
RVTEST_DATA_END

