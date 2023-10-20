# MorFuzz: Fuzzing Processor via Runtime Instruction Morphing enhanced Synchronizable Co-simulation

MorFuzz is a generic RISC-V processor fuzzing framework that can efficiently detect software triggerable functional bugs.
Different from existing works, MorFuzz uses a novel dynamic mutation technique, named Instruction Morphing, to generate diverse and meaningful instruction streams on the fly.
MorFuzz was evaluated on three famous RISC-V processors (i.e., BOOM, CVA6, and Rocket) and found 17 previously unknown bugs.
For more details, please see our [Usenix Security 2023 paper](https://www.usenix.org/conference/usenixsecurity23/presentation/xu-jinyan).

This repository only contains libraries and scripts for artifact evaluation.
You can get the source code of the [starship soc](https://github.com/sycuricon/starship), the [co-simulation framework](https://github.com/sycuricon/riscv-isa-cosim), and the [stimulus template generator](https://github.com/sycuricon/razzle) from their respective repositories.

## Set-up

> MorFuzz uses Synopsys VCS for RTL simulation, therefore you need to obtain a license to run the scripts in this repository.
>
> MorFuzz can theoretically work with different RTL simulators.
> We will later port MorFuzz to Verilator.

MorFuzz is evaluated on CentOS 7.9.2009 with the following dependencies:

```bash
sudo yum -y groupinstall "Development Tools"
sudo yum -y install redhat-lsb libXScrnSaver centos-release-scl dtc
sudo yum -y install devtoolset-10
```

Besides, you also need to install dependencies from [riscv-dv](https://github.com/chipsalliance/riscv-dv) and [riscv-torture](https://github.com/ucb-bar/riscv-torture).

Second, clone the repository and execute the setup script.

```bash
git clone https://github.com/sycuricon/MorFuzz.git
cd MorFuzz
git submodule update --init --recursive
export ARTIFACT_ROOT=$(pwd)
./scripts/setup.sh
```

Next, download the MorFuzz pre-built binaries `morfuzz_bin.zip` from [link](https://zenodo.org/record/8055696) and unzip it.
You also need to place the decompressed `morfuzz_bin` directory under the root directory of the MorFuzz repository.

And if you want to run DifuzzRTL related experiments, you also need to download input sets `difuzzrtl_[0-4].zip` from [link](https://zenodo.org/record/8055696).

The final directory hierarchy of the project is as follows:

```
MorFuzz
├── dep
├── morfuzz_bin
│   ├── cj
│   └── razzle
├── patch
├── scripts
└── src
```



## Execution

Before running MorFuzz, you need to set up the environment variables:

```bash
export ARTIFACT_ROOT=#absolute path to MorFuzz#
export DIFUZZRTL_INPUT=<absolute path to one decompressed difuzzrtl input set>
source $ARTIFACT_ROOT/scripts/env.sh
```

There are four experiments under `src` directory, and each experiment has its own `README.md` file to describe how to run it.
Generally, you can run the experiment by executing the corresponding script under `scripts` directory at the root of this repository.
To test the basic functionality of MorFuzz, you can run the following command:

```bash
./scripts/basic.sh
```

And if the test passes, you can find the `*** PASSED ***` message.


### Attribution

```
@inproceedings{xu2023morfuzz,
  title={$\{$MorFuzz$\}$: Fuzzing Processor via Runtime Instruction Morphing enhanced Synchronizable Co-simulation},
  author={Xu, Jinyan and Liu, Yiyuan and He, Sirui and Lin, Haoran and Zhou, Yajin and Wang, Cong},
  booktitle={32nd USENIX Security Symposium (USENIX Security 23)},
  pages={1307--1324},
  year={2023}
}

```
