# Experiment E2

The four folders in this directory each generated one of the four curves in Figure 8.

## Execution

1. Go to the root directory of this repository, and run the following command to execute the experiment:

```bash
export ARTIFACT_ROOT=<absolute path to the root directory of this repository>
export DIFUZZRTL_INPUT=<absolute path to one decompressed difuzzrtl input set>
source $ARTIFACT_ROOT/scripts/env.sh
```

2. If there is no error, run the following command to execute the experiment:

```bash
./scripts/fig8.sh
```

## Result

If the `fig8.sh` script is executed without errors, Figure 8 will be generated and saved in `scripts/output/fig8.pdf`.

## Regeneration

You can directly generate the figure by executing the above script.
If you want to regenerate a certain curve, enter the corresponding subfolder and execute `timeout 1d make`.

After `make`, execute the following command to generate Figure 8.

```bash
cd $ARTIFACT_ROOT

python3 scripts/src/curve.py fig8                        \
  Morfuzz    src/figure8/morfuzz/morfuzz-log.txt         \
  DifuzzRTL  src/figure8/difuzzrtl/difuzzrtl-log.txt     \
  riscv-dv   src/figure8/dv/dv-log.txt                   \
  riscv-torture src/figure8/torture/torture-log.txt
```
