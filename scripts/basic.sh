#!/bin/sh

if [[ -z "${ARTIFACT_ROOT}" ]]; then
  echo "Set ARTIFACT_ROOT first"
  exit 1
fi

pushd . > /dev/null
cd $ARTIFACT_ROOT

function done_wait_continue(){
  echo -e "\033[1;32m[>] $1 done, press enter to next test...\033[0m"
  read
}

cd $ARTIFACT_ROOT/src/table2/rocket
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/basic/testcase; done_wait_continue "Rocket basic test"

cd $ARTIFACT_ROOT/src/table2/boom
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/basic/testcase; done_wait_continue "BOOM basic test"

cd $ARTIFACT_ROOT/src/table2/cva6
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/basic/testcase; done_wait_continue "CVA6 basic test"

cd $ARTIFACT_ROOT/dep/riscv-isa-sim/build
$ARTIFACT_ROOT/dep/riscv-isa-sim/build/spike -l $ARTIFACT_ROOT/src/table2/bugs/basic/testcase && echo "*** PASSED ***"; done_wait_continue "Spike basic test"

popd > /dev/null
