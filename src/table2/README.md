# Experiment E1

The assembly programs and binaries under the `bugs` directory are test cases to trigger the bug discovered by MorFuzz.
You can get more information on each bug from Table 2 and Section 5.2 in the paper.
b2 rely on b3 to set up the environment (i.e., the vsstatus register), therefore they are combined into one test case.
b4 and b13 are the same bug, they share one test case, and so do b5 and b14.

The code and scripts under the `boom`, `cva6`, and `rocket` directories are used by the RTL simulator to generate a host executable binary to simulate the hardware design, i.e., the processor.
The above three directories are the hardware designs of BOOM, CVA6, and Rocket, respectively.
Each of them shares the same structure, which is described as follows:

- the `vsrc` directory contains the source code of the hardware design
- the `testbench` directory contains the testbench of the hardware design

b1 to b3 execute on Rocket with co-simulation, b4 to b7 execute on BOOM with co-simulation, and b7 to b14 execute on CVA6 with co-simulation.
b18 and b19 directly execute on the unmodified spike without co-simulation.

## Execution

1. Go to the root directory of this repository, and run the following command to execute the experiment:

```bash
export ARTIFACT_ROOT=<path to the root directory of this repository>
source $ARTIFACT_ROOT/scripts/env.sh
```

2. If there is no error, run the following command to execute the experiment:

```bash
./scripts/tab2.sh
```

This script will execute all test cases sequentially, and you need to press enter after each test case is executed to continue.

## Result

### B1: Treat aes64ksli with rcon greater than 0xA as valid

Our co-simulation will check the status of the processor after each instruction with the golden model (i.e., spike).
If the status of the processor is different from the golden model, you will see messages like the following:

```bash
0 0x0008000017c (0x31ff9493) x 9 0x6330636363306363
core   0: 0x000000008000017c (0x31ff9493) aes64ks1i s1, t6, 15
core   0: exception trap_illegal_instruction, epc 0x000000008000017c
core   0:           tval 0x0000000031ff9493
core   0: >>>>  trap_vector
core   0: 0x0000000080000004 (0x34202f73) csrr    t5, mcause
core   0: 3 0x0000000080000004 (0x34202f73) x30 0x0000000000000002
[error] PC SIM 0000000080000004, DUT 000000008000017c
[error] INSN SIM 34202f73, DUT 31ff9493
```

The line starting with `core 0:` is the execution log from spike, and the line without a prefix is the execution log from Rocket.

During execute instruction `aes64ks1i s1, t6, 15` at address `0x8000017c`, the golden model, spike, raises an illegal instruction exception and traps to the exception handler at address `0x80000004`.
While the processor under test, Rocket, does not raise an exception and executes the illegal instruction normally, therefore its pc is `0x8000017c`.
MorFuzz catches this mismatched pc:

```bash
[error] PC SIM 0000000080000004, DUT 000000008000017c
```

### B2 & B3: ROCC instruction is treated as illegal instruction under certain conditions

You will get the following message if the bug is triggered:

```bash
3 0x00080000004 (0x34302f73) x30 0x000000000000700b
core   0: 0x00000000800001c4 (0x0000700b) unknown
core   0: 1 0x00000000800001c4 (0x0000700b)
[error] PC SIM 00000000800001c4, DUT 0000000080000004
[error] INSN SIM 0000700b, DUT 34302f73
```

The ROCC instruction `0x34302f73` at `0x800001c4` is the custom instruction extension.
Although spike disassembles it as `unknown`, it is a valid instruction, from the spike's execution log, we can see that spike executes it normally without throwing an exception.
However, Rocket treats it as an illegal instruction and traps to the trap handler at address `0x80000004`.

MorFuzz catches this mismatched pc:

```bash
[error] PC SIM 00000000800001c4, DUT 0000000080000004
```

### B4: Incorrect exception type when a PMA violation

You will get the following message if the bug is triggered:

```bash
3 0x0000000080000004 (0x34202f73) x30 0x000000000000000f
core   0: 0x000000008000024c (0x00b52023) sw      a1, 0(a0)
core   0: exception trap_store_access_fault, epc 0x000000008000024c
core   0:           tval 0x0000000040201010
core   0: >>>>  trap_vector
core   0: 0x0000000080000004 (0x34202f73) csrr    t5, mcause
core   0: 3 0x0000000080000004 (0x34202f73) x30 0x0000000000000007
[error] 0000000080000004@34202f73 CSR UNMATCH SIM 0000000000000007, DUT 000000000000000f
```

Both spike and BOOM raise an exception when executing the instruction `sw a1, 0(a0)` at address `0x8000024c`.
However, the exception type is different, spike raises a store access fault exception (0x7), while BOOM raises a store page fault exception (0xf).

MorFuzz catches this mismatched behavior during checking the value read from the `mcause` control-and-status register (CSR):

```bash
[error] 0000000080000004@34202f73 CSR UNMATCH SIM 0000000000000007, DUT 000000000000000f
```

### B5: Incorrect exception type when a PMP violation

You will get the following message if the bug is triggered:

```bash
3 0x0000000080000004 (0x34202f73) x30 0x000000000000000f
core   0: 0x0000000080000368 (0x00b52023) sw      a1, 0(a0)
core   0: exception trap_store_access_fault, epc 0x0000000080000368
core   0:           tval 0x0000000040201010
core   0: >>>>  trap_vector
core   0: 0x0000000080000004 (0x34202f73) csrr    t5, mcause
core   0: 3 0x0000000080000004 (0x34202f73) x30 0x0000000000000007
[error] 0000000080000004@34202f73 CSR UNMATCH SIM 0000000000000007, DUT 000000000000000f
```

Both spike and BOOM raise an exception when executing the instruction `sw a1, 0(a0)` at address `0x80000368`.
However, the exception type is different, spike raises a store access fault exception (0x7), while BOOM incorrectly raises a store page fault exception (0xf).

MorFuzz catches this mismatched behavior during checking the value read from the `mcause` CSR:

```bash
[error] 0000000080000004@34202f73 CSR UNMATCH SIM 0000000000000007, DUT 000000000000000f
```

### B6: Floating-point instruction with invalid rm field does not raise exception

You will get the following message if the bug is triggered:

```bash
0 0x0000000080000184 (0x02005053) f 0 0x0000000000000000
core   0: 0x0000000080000184 (0x02005053) fadd.d  ft0, ft0, ft0
core   0: exception trap_illegal_instruction, epc 0x0000000080000184
core   0:           tval 0x0000000002005053
core   0: >>>>  trap_vector
core   0: 0x0000000080000004 (0x34202f73) csrr    t5, mcause
core   0: 3 0x0000000080000004 (0x34202f73) x30 0x0000000000000002
[error] PC SIM 0000000080000004, DUT 0000000080000184
[error] INSN SIM 34202f73, DUT 02005053
```

During execute instruction `0x02005053` at address `0x80000184`, spike raises an illegal instruction exception and traps to the trap handler at address `0x80000004`.
While BOOM does not raise an exception and execute the illegal instruction normally, therefore its pc is `0x80000184`.

MorFuzz catches this mismatched pc:

```bash
[error] PC SIM 0000000080000004, DUT 0000000080000184
```

### B7: Floating-point instruction with invalid frm does not raise exception

You will get the following message if the bug is triggered:

```bash
0 0x000000008000018c (0x02007053) f 0 0x0000000000000000
core   0: 0x000000008000018c (0x02007053) fadd.d  ft0, ft0, ft0
core   0: exception trap_illegal_instruction, epc 0x000000008000018c
core   0:           tval 0x0000000002007053
core   0: >>>>  trap_vector
core   0: 0x0000000080000004 (0x34202f73) csrr    t5, mcause
core   0: 3 0x0000000080000004 (0x34202f73) x30 0x0000000000000002
[error] PC SIM 0000000080000004, DUT 000000008000018c
[error] INSN SIM 34202f73, DUT 02007053
```

During executing instruction `0x02007053` at address `0x8000018c`, spike raises an illegal instruction exception and traps to the trap handler at address `0x80000004`.
While BOOM does not raise an exception and execute the illegal instruction normally, therefore its pc is `0x8000018c`.

MorFuzz catches this mismatched pc:

```bash
[error] PC SIM 0000000080000004, DUT 000000008000018c
```

### B8: Crafted or incorrectly formatted sfence.vma instructions are executed

You will get the following message if the bug is triggered:

```bash
core   0: 0x0000000080000190 (0x120000f3) unknown
core   0: exception trap_illegal_instruction, epc 0x0000000080000190
core   0:           tval 0x00000000120000f3
core   0: >>>>  trap_vector
core   0: 0x0000000080000004 (0x34202f73) csrr    t5, mcause
core   0: 3 0x0000000080000004 (0x34202f73) x30 0x0000000000000002
[error] PC SIM 0000000080000004, DUT 0000000080000190
[error] INSN SIM 34202f73, DUT 120000f3
...
    699ns      684 M 0000000080000190 0 120000f3 sfence.vma
```

The line with `ns` prefix is the execution log from CVA6.
During executing an illegal `sfence.vma` instruction at address `0x80000190`, CVA6 treats it as a valid instruction and executes it normally.
Spike raises an illegal instruction exception and traps to the trap handler at address `0x80000004`.

MorFuzz catches this mismatched pc:

```bash
[error] PC SIM 0000000080000004, DUT 0000000080000190
```

### B9: Crafted or incorrectly formatted dret instructions are executed

You will get the following message if the bug is triggered:

```bash
core   0: 0x000000008000019c (0x7b200273) unknown
core   0: exception trap_illegal_instruction, epc 0x000000008000019c
core   0:           tval 0x000000007b200273
core   0: 0x0000000000000808 (0x0000652c) c.ld    a1, 72(a0)
core   0: 3 0x0000000000000808 (0x652c) x11 0x0000000000000000 mem 0x0000000000000048
[error] PC SIM 0000000000000808, DUT 000000008000019c
[error] INSN SIM 0000652c, DUT 7b200273
...
     822ns      807 D 000000008000019c 0 7b200273 INVALID
```

During executing an illegal `dret` instruction at address `0x8000019c`, CVA6 treats it as a valid instruction and executes it normally, although it is decoded as `INVALID`.
Spike raises an illegal instruction exception and traps to the trap handler at address `0x80000004`.

MorFuzz catches this mismatched pc:

```bash
[error] PC SIM 0000000000000808, DUT 000000008000019c
```

### B10: Non-standard fence instructions are treated as illegal

You will get the following message if the bug is triggered:

```bash
Exception @     68600, PC: 0000000080000194, Cause: Illegal Instruction,
                                tval: 000000000000120f
core   0: 0x0000000080000194 (0x0000120f) fence.i
core   0: 1 0x0000000080000194 (0x0000120f)
[error] PC SIM 0000000080000194, DUT 0000000080000004
[error] INSN SIM 0000120f, DUT 34202f73
...
     702ns      687 M 0000000080000004 0 34202f73 csrr           t5, mcause            t5  :0000000000000002
```

During execute a valid but non-standard `fence.i` instruction at address `0x80000194`, CVA6 raises an illegal instruction exception and traps to the trap handler at address `0x80000004`.
Spike executes the instruction normally, therefore its pc is `0x80000194`.

MorFuzz catches this mismatched pc:

```bash
[error] PC SIM 0000000080000194, DUT 0000000080000004
```

### B11: The mstatus.sd field does not update immediately

You will get the following message if the bug is triggered:

```bash
core   0: 0x0000000080000154 (0x300022f3) csrr    t0, mstatus
core   0: 3 0x0000000080000154 (0x300022f3) x5  0x8000000a00006080
[error] 0000000080000154@300022f3 CSR UNMATCH SIM 8000000a00006080, DUT 0000000a00006080
...
     652ns      637 M 0000000080000154 0 300022f3 csrr           t0, mstatus           t0  :0000000a00006080
```

The SD field (the most significant bit) of `mstatus` CSR is set to 1 if the program taints the floating-point registers.

MorFuzz catches this mismatched behavior during checking the value read from the `mstatus` CSR:

```bash
[error] 0000000080000154@300022f3 CSR UNMATCH SIM 8000000a00006080, DUT 0000000a00006080
```

### B12: The value of mtval/stval after ecall/ebreak is incorrect

You will get the following message if the bug is triggered:

```bash
core   0: 0x0000000080000190 (0x343022f3) csrr    t0, mtval
core   0: 3 0x0000000080000190 (0x343022f3) x5  0x0000000000000000
[error] 0000000080000190@343022f3 CSR UNMATCH SIM 0000000000000000, DUT 0000000000100073
...
     786ns      771 D 0000000080000190 0 343022f3 csrr           t0, mtval             t0  :0000000000100073
```

When an exception happens, CVA6 incorrectly sets the `mtval` CSR to the value of the instruction for all kinds of exceptions.

MorFuzz catches this mismatched behavior during checking the value read from the `mtval` CSR:

```bash
[error] 0000000080000190@343022f3 CSR UNMATCH SIM 0000000000000000, DUT 0000000000100073
```

### B13: Incorrect exception type when a PMA violation

You will get the following message if the bug is triggered:

```bash
Exception @     93100, PC: 000000008000024c, Cause: Store Page Fault,
                                tval: 0000000040201010
core   0: 0x000000008000024c (0x00b52023) sw      a1, 0(a0)
core   0: exception trap_store_access_fault, epc 0x000000008000024c
core   0:           tval 0x0000000040201010
core   0: >>>>  trap_vector
core   0: 0x0000000080000004 (0x34202f73) csrr    t5, mcause
core   0: 3 0x0000000080000004 (0x34202f73) x30 0x0000000000000007
[error] 0000000080000004@34202f73 CSR UNMATCH SIM 0000000000000007, DUT 000000000000000f
...
     945ns      930 M 0000000080000004 0 34202f73 csrr           t5, mcause            t5  :000000000000000f
```

Same as B4, but the bug is triggered on CVA6.

### B14: Incorrect exception type when a PMP violation

You will get the following message if the bug is triggered:

```bash
Exception @    121500, PC: 0000000080000368, Cause: Load Access Fault,
                                tval: 0000000080102008
core   0: 0x0000000080000368 (0x00b52023) sw      a1, 0(a0)
core   0: exception trap_store_access_fault, epc 0x0000000080000368
core   0:           tval 0x0000000040201010
core   0: >>>>  trap_vector
core   0: 0x0000000080000004 (0x34202f73) csrr    t5, mcause
core   0: 3 0x0000000080000004 (0x34202f73) x30 0x0000000000000007
[error] 0000000080000004@34202f73 CSR UNMATCH SIM 0000000000000007, DUT 0000000000000005
...
    1229ns     1214 M 0000000080000004 0 34202f73 csrr           t5, mcause            t5  :0000000000000005
```

Similar to B5, but the bug is triggered on CVA6.

### B15: Incorrect exception type when accessing an illegal virtual address

You will get the following message if the bug is triggered:

```bash
Exception @   1466500, PC: 0000000000002980, Cause: Load Access Fault,
                                tval: 8000000000003000
core   0: 0x0000000000002980 (0x00028383) lb      t2, 0(t0)
core   0: exception trap_load_page_fault, epc 0x0000000000002980
core   0:           tval 0x8000000000003000
core   0: 0xffffffffffe00144 (0x14011173) csrrw   sp, sscratch, sp
core   0: 1 0xffffffffffe00144 (0x14011173) x2  0xffffffffffe09ee0 c320_sscratch 0x0000000000000000
[error] PC SIM ffffffffffe00144, DUT 0000000080000008
[error] INSN SIM 14011173, DUT 2c40206f
```

Both spike and CVA6 raise an exception when executing the instruction `lb t2, 0(t0)` at address `0x2980`.
However, the exception type is different, spike raises a load access fault exception (0x5), while CVA6 raises a load page fault exception (0x8).
Since the execution environment delegate the load page fault exception to Supervisor mode, spike traps to `0xffe00144` (i.e., the value of the `stvec` CSR).
The load access fault exception is not delegated and is still handled in Machine mode, CVA6 traps to `0x80000008` (i.e., the value of the `mtvec` CSR).

MorFuzz catches this mismatched pc:

```bash
[error] PC SIM ffffffffffe00144, DUT 0000000080000008
```

### B16: Improper physical PC truncate

You will get the following message if the bug is triggered:

```bash
core   0: exception trap_instruction_access_fault, epc 0x80000000800001dc
core   0:           tval 0x80000000800001dc
core   0: >>>>  trap_vector
core   0: 0x0000000080000004 (0x34302f73) csrr    t5, mtval
core   0: 3 0x0000000080000004 (0x34302f73) x30 0x80000000800001dc
[error] PC SIM 0000000080000004, DUT 80000000800001dc
[error] INSN SIM 34302f73, DUT 0ff0000f
...
     732ns      717 M 80000000800001dc 0 0ff0000f fence
```

CVA6 ignores the most significant 8 bits of the pc, therefore an illegal address `0x80000000800001dc` becomes a valid address `0x00000000800001dc` after the truncation.
Spike properly raises an instruction access fault exception and traps to the trap handler at address `0x80000004`.

MorFuzz catches this mismatched pc:

```bash
[error] PC SIM 0000000080000004, DUT 80000000800001dc
```

### B17: Incorrect lr exception type

You will get the following message if the bug is triggered:

```bash
core   0: 0x000000008000009c (0x342025f3) csrr    a1, mcause
core   0: 3 0x000000008000009c (0x342025f3) x11 0x000000000000000d
[error] 000000008000009c@342025f3 CSR UNMATCH SIM 000000000000000d, DUT 000000000000000f
...
    3235ns     3220 M 000000008000009c 0 342025f3 csrr           a1, mcause            a1  :000000000000000f
```

The specification requires the exception type of the faulting `lr` instruction to be a load page fault (0xd), while CVA6 raises a store page fault (0xf).

MorFuzz catches this mismatched behavior during checking the value read from the `mcause` CSR:

```bash
[error] 000000008000009c@342025f3 CSR UNMATCH SIM 000000000000000d, DUT 000000000000000f
```

### B18: The component mcontrol.action contains the incorrect mask

In the process of verifying the processors, we also found some bugs in spike.
We reported these bugs to the community and merged the upstream patches, so it was not able to use MorFuzz to trigger them.
Therefore subsequent spike bugs will be executed directly on older versions of spike without co-simulation.

You will get the following message if the bug is triggered:

```bash
core   0: 0x000000008000016c (0x7a159073) csrw    tdata1, a1
core   0: 0x0000000080000170 (0x7a1025f3) csrr    a1, tdata1
core   0: 0x0000000080000174 (0x00100193) li      gp, 1
```

Comparing the program in `src/table2/bugs/b18/testcase.dump`, you will find that there are still many instructions after `0x80000174`, but spike suddenly stops executing at this address.

MorFuzz detected this bug based on pc differences (i.e., co-simulation with Rocket), please refer to the [link](https://github.com/riscv-software-src/riscv-isa-sim/issues/1032) for details.

### B19: Incorrect exception priority when accessing memory

You will get the following message if the bug is triggered:

```bash
core   0: 0x00000000800001c0 (0x00062603) lw      a2, 0(a2)
core   0: exception trap_load_address_misaligned, epc 0x00000000800001c0
core   0:           tval 0x0000000100004001
```

Spike raises a load address misaligned exception at `0x800001c0`, however it should raise a breakpoint exception.

MorFuzz detected this bug by comparing the value read from the `mcause` CSR (i.e., co-simulation with Rocket), please refer to the [link](https://github.com/riscv-software-src/riscv-isa-sim/issues/971) for details.
