#!/bin/sh

if [[ -z "${ARTIFACT_ROOT}" ]]; then
  echo "Set ARTIFACT_ROOT first"
  exit 1
fi

export MORFUZZ_PRERELEASE=$ARTIFACT_ROOT/morfuzz_bin 
export DEPENDENCY=$ARTIFACT_ROOT/dep

export RISCV_GCC=$(which riscv64-unknown-elf-gcc)
if [[ -z "${RISCV_GCC}" ]]; then
  echo "Not found riscv64-unknown-elf-gcc, install riscv-toolchain and place it in your PATH"
  exit 1
fi

export RISCV_OBJCOPY=$(which riscv64-unknown-elf-objcopy)
if [[ -z "${RISCV_OBJCOPY}" ]]; then
  echo "Not found riscv64-unknown-elf-objcopy, install riscv-toolchain and place it in your PATH"
  exit 1
fi

TEST_VCS=$(which vcs)
if [[ -z "${TEST_VCS}" ]]; then
  echo "Not found vcs, install vcs and place it in your PATH"
  exit 1
fi
unset TEST_VCS
