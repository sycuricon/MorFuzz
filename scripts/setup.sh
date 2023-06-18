#!/bin/sh

if [[ -z "${ARTIFACT_ROOT}" ]]; then
  echo "Set ARTIFACT_ROOT first"
  exit 1
fi

pushd . > /dev/null

cd $ARTIFACT_ROOT

# spike
mkdir -p $ARTIFACT_ROOT/dep/riscv-isa-sim/build
cd $ARTIFACT_ROOT/dep/riscv-isa-sim/build
../configure; make -j$(nproc)

# riscv-dv
cd $ARTIFACT_ROOT/dep/riscv-dv
git apply -R $ARTIFACT_ROOT/patch/riscv-dv.patch
git apply --whitespace=fix -- $ARTIFACT_ROOT/patch/riscv-dv.patch

# riscv-torture
cd $ARTIFACT_ROOT/dep/riscv-torture
git apply -R $ARTIFACT_ROOT/patch/riscv-torture.patch
git apply --whitespace=fix -- $ARTIFACT_ROOT/patch/riscv-torture.patch
cd $ARTIFACT_ROOT/dep/riscv-torture/env
git apply -R $ARTIFACT_ROOT/patch/riscv-torture_env.patch
git apply --whitespace=fix -- $ARTIFACT_ROOT/patch/riscv-torture_env.patch

pip3 install -r $ARTIFACT_ROOT/scripts/src/requirements.txt

popd > /dev/null
