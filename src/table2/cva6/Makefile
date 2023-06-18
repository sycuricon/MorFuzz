# Starship Project
# Copyright (C) 2020-2022 by phantom
# Email: phantom@zju.edu.cn
# This file is under MIT License, see https://www.phvntom.tech/LICENSE.txt

TOP		:= $(CURDIR)
BUILD	:= $(TOP)/build

ifndef RISCV
$(error $$RISCV is undefined, please set $$RISCV to your riscv-toolchain)
endif

ifndef MORFUZZ_PRERELEASE
$(error $$MORFUZZ_PRERELEASE is undefined, please set $$MORFUZZ_PRERELEASE first)
endif

ifndef TESTCASE_ELF
$(error $$TESTCASE_ELF is undefined, please specify a testcase)
endif

GCC_VERSION	:= $(word 1, $(subst ., ,$(shell gcc -dumpversion)))
ifeq ($(shell echo $(GCC_VERSION)\>=9 | bc ),0)
SCL_PREFIX := source scl_source enable devtoolset-10 &&
endif

all: vcs-debug
.SUFFIXES:

export LD_LIBRARY_PATH=$(MORFUZZ_PRERELEASE)/cj/lib

STARSHIP_TH 	?= TestHarness
STARSHIP_TOP	?= StarshipASICTop

TB_DIR		:= $(TOP)/testbench
VCS_OUTPUT	:= $(BUILD)/vcs
VERDI_OUTPUT:= $(BUILD)/verdi
VCS_BUILD	:= $(VCS_OUTPUT)/build
VCS_LOG		:= $(VCS_OUTPUT)/log
VCS_WAVE	:= $(VCS_OUTPUT)/wave

SPIKE_DIR		:= $(MORFUZZ_PRERELEASE)/cj
SPIKE_SRC		:= $(shell find $(SPIKE_DIR) -name "*.cc" -o -name "*.h" -o -name "*.c")
SPIKE_LIB		:= $(addprefix $(SPIKE_DIR)/lib/,libcosim.a libriscv.a libdisasm.a libsoftfloat.a libfesvr.a libfdt.a)
SPIKE_INCLUDE	:= $(addprefix $(SPIKE_DIR)/include/,cosim fesvr riscv softfloat)


VCS_TB		?= Testbench
VCS_SIMV	:= $(VCS_BUILD)/simv
VCS_INCLUDE	:= $(ROCKET_BUILD)+$(TB_DIR)
VCS_CFLAGS	:= -std=c++17 $(addprefix -I,$(SPIKE_INCLUDE)) -I$(ROCKET_BUILD)
VCS_TB_VLOG ?= $(TB_DIR)/$(VCS_TB).v

TESTCASE_HEX	:= $(TESTCASE_ELF).hex

VERILOG_SRC	:= $(shell find $(TOP)/vsrc -name "*.v" -o -name "*.vh" -o -name "*.sv")
VCS_SRC_C	:= $(SPIKE_LIB) $(TB_DIR)/spike_difftest.cc $(TB_DIR)/timer.cc
VCS_SRC_V	:= $(VCS_TB_VLOG) $(TB_DIR)/spike_difftest.v

TB_DEFINE	:= +define+MODEL=$(STARSHIP_TH)					\
			   +define+TOP_DIR=\"$(VCS_OUTPUT)\"			\
			   +define+INITIALIZE_MEMORY					\
			   +define+CLOCK_PERIOD=1.0	   					\
			   +define+DEBUG_FSDB

CHISEL_DEFINE := +define+PRINTF_COND=$(VCS_TB).printf_cond	\
			   	 +define+STOP_COND=!$(VCS_TB).reset			\
				 +define+RANDOMIZE							\
				 +define+RANDOMIZE_MEM_INIT					\
				 +define+RANDOMIZE_REG_INIT					\
				 +define+RANDOMIZE_GARBAGE_ASSIGN			\
				 +define+RANDOMIZE_INVALID_ASSIGN			\
				 +define+RANDOMIZE_DELAY=0.1

VCS_OPTION	:= -quiet -notice -line +rad -full64 +nospecify +notimingcheck -deraceclockdata 		\
			   -sverilog +systemverilogext+.sva+.pkg+.sv+.SV+.vh+.svh+.svi+ -assert svaext 			\
			   +v2k -debug_acc+all -timescale=1ns/10ps +incdir+$(VCS_INCLUDE) 						\
			   -j$(shell nproc) -CFLAGS "$(VCS_CFLAGS)" 											\
			   $(CHISEL_DEFINE) $(TB_DEFINE)
VSIM_OPTION	:= +uart_tx=1 +testcase=$(TESTCASE_ELF) +fuzzing

vcs-debug: VSIM_OPTION += +verbose +dump

$(VCS_SIMV): $(VERILOG_SRC) $(VCS_SRC_V) $(VCS_SRC_C) $(SPIKE_LIB)
	mkdir -p $(VCS_BUILD) $(VCS_LOG) $(VCS_WAVE)
	cd $(VCS_BUILD); $(SCL_PREFIX) vcs $(VCS_OPTION) -l $(VCS_LOG)/vcs.log -top $(VCS_TB) \
		-f $(TOP)/vsrc/CVA6List.f $(VERILOG_SRC) $(VCS_SRC_V) $(VCS_SRC_C) -o $@

$(TESTCASE_HEX): $(TESTCASE_ELF)
	riscv64-unknown-elf-objcopy --gap-fill 0			\
		--set-section-flags .bss=alloc,load,contents	\
		--set-section-flags .sbss=alloc,load,contents	\
		--set-section-flags .tbss=alloc,load,contents	\
		-O binary $< .tmp.bin
	od -v -An -tx8 .tmp.bin > $@
	rm .tmp.bin

vcs: $(VCS_SIMV) $(TESTCASE_HEX)
	mkdir -p $(VCS_BUILD) $(VCS_LOG) $(VCS_WAVE)
	cd $(VCS_BUILD); \
	$(VCS_SIMV) -quiet +ntb_random_seed=10 $(VSIM_OPTION)

vcs-debug: vcs

verdi: $(VCS_WAVE)/*.fsdb
	mkdir -p $(VERDI_OUTPUT)
	touch $(VERDI_OUTPUT)/signal.rc
	cd $(VERDI_OUTPUT); verdi -$(VCS_OPTION) -q -ssy -ssv -ssz -autoalias -f $(TOP)/vsrc/CVA6List.f \
		-ssf $(VCS_WAVE)/starship.fsdb -top $(VCS_TB) $(VERILOG_SRC) $(VCS_SRC_V) &

clean:
	rm -rf $(BUILD)
