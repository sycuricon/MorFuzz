#!/bin/sh

if [[ -z "${ARTIFACT_ROOT}" ]]; then
  echo "Set ARTIFACT_ROOT first"
  exit 1
fi

pushd . > /dev/null

cd $ARTIFACT_ROOT/src/figure10/morfuzz/; timeout 1d make&
cd $ARTIFACT_ROOT/src/figure10/morfuzz-minus/; timeout 1d make&
cd $ARTIFACT_ROOT/src/figure10/morfuzz-star/; timeout 1d make&

wait

cd $ARTIFACT_ROOT

python3 scripts/src/curve.py fig10  \
  Morfuzz    src/figure10/morfuzz/morfuzz-log.txt      \
  "Morfuzz-" src/figure10/morfuzz-minus/morfuzz-log.txt  \
  "Morfuzz*" src/figure10/morfuzz-star/morfuzz-log.txt

echo "Generate scripts/output/fig10.pdf successfully!"
popd > /dev/null
