#include "riscv_test.h"


RVTEST_RV64UF

RVTEST_CODE_BEGIN

    li t6, 0x1fff0000
    lr.d a4, (t6)
    amoxor.d s5, a6, (t6)
    sc.d s1, a2, (t6)


RVTEST_PASS



RVTEST_CODE_END



RVTEST_DATA_BEGIN



RVTEST_DATA_END


