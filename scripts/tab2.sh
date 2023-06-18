#!/bin/sh

if [[ -z "${ARTIFACT_ROOT}" ]]; then
  echo "Set ARTIFACT_ROOT first"
  exit 1
fi

pushd . > /dev/null
cd $ARTIFACT_ROOT

function done_wait_continue(){
  echo -e "\033[1;32m[>] $1 done, press enter to next bug...\033[0m"
  read
}

cd $ARTIFACT_ROOT/src/table2/rocket
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b1/testcase; done_wait_continue b1
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b2/testcase; done_wait_continue b2

cd $ARTIFACT_ROOT/src/table2/boom
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b4/testcase; done_wait_continue b4
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b5/testcase; done_wait_continue b5
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b6/testcase; done_wait_continue b6
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b7/testcase; done_wait_continue b7

cd $ARTIFACT_ROOT/src/table2/cva6
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b8/testcase; done_wait_continue b8
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b9/testcase; done_wait_continue b9
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b10/testcase; done_wait_continue b10
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b11/testcase; done_wait_continue b11
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b12/testcase; done_wait_continue b12
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b4/testcase; done_wait_continue b13
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b5/testcase; done_wait_continue b14
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b15/testcase; done_wait_continue b15
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b16/testcase; done_wait_continue b16
make TESTCASE_ELF=$ARTIFACT_ROOT/src/table2/bugs/b17/testcase; done_wait_continue b17

cd $ARTIFACT_ROOT/dep/riscv-isa-sim/build
$ARTIFACT_ROOT/dep/riscv-isa-sim/build/spike -l $ARTIFACT_ROOT/src/table2/bugs/b18/testcase; done_wait_continue b18
cat << EOF > b19.cmd
  r 89
  quit
EOF
$ARTIFACT_ROOT/dep/riscv-isa-sim/build/spike -d --debug-cmd=b19.cmd $ARTIFACT_ROOT/src/table2/bugs/b19/testcase; done_wait_continue b19

popd > /dev/null
