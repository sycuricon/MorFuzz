#!/bin/sh

if [[ -z "${ARTIFACT_ROOT}" ]]; then
  echo "Set ARTIFACT_ROOT first"
  exit 1
fi

if [[ -z "${DIFUZZRTL_INPUT}" ]]; then
  echo "Set DIFUZZRTL_INPUT first"
  exit 1
fi

pushd . > /dev/null

cd $ARTIFACT_ROOT/src/figure8/morfuzz/; timeout 1d make&
cd $ARTIFACT_ROOT/src/figure8/dv/; timeout 1d make&
cd $ARTIFACT_ROOT/src/figure8/torture/; timeout 1d make&
cd $ARTIFACT_ROOT/src/figure8/difuzzrtl/; timeout 1d make&

wait

cd $ARTIFACT_ROOT

python3 scripts/src/curve.py fig8                        \
  Morfuzz    src/figure8/morfuzz/morfuzz-log.txt         \
  DifuzzRTL  src/figure8/difuzzrtl/difuzzrtl-log.txt     \
  riscv-dv   src/figure8/dv/dv-log.txt                   \
  riscv-torture src/figure8/torture/torture-log.txt

popd > /dev/null
