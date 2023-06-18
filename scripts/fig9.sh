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

cd $ARTIFACT_ROOT/src/figure9/morfuzz/; timeout 1d make&
cd $ARTIFACT_ROOT/src/figure9/dv/; timeout 1d make&
cd $ARTIFACT_ROOT/src/figure9/difuzzrtl/; timeout 1d make&

wait

cd $ARTIFACT_ROOT

python3 scripts/src/heatmap.py Morfuzz src/figure9/morfuzz/build/vcs/build/wdata.txt
python3 scripts/src/heatmap.py DifuzzRTL src/figure9/difuzzrtl/build/vcs/build/wdata.txt
python3 scripts/src/heatmap.py dv src/figure9/dv/build/vcs/build/wdata.txt

popd > /dev/null
