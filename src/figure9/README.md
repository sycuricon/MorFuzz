# Experiment E3

The three folders in this directory each generated one of the three heatmaps in Figure 9.

## Execution

1. Go to the root directory of this repository, and run the following command to execute the experiment:

```bash
export ARTIFACT_ROOT=<absolute path to the root directory of this repository>
export DIFUZZRTL_INPUT=<absolute path to one decompressed difuzzrtl input set>
source $ARTIFACT_ROOT/scripts/env.sh
```

2. If there is no error, run the following command to execute the experiment:

```bash
./scripts/fig9.sh
```

## Result

If the `fig9.sh` script is executed without errors, three heatmaps named `heatmap_<name>.pdf` will be generated in the `scripts/ouput` directory.

## Regeneration

You can directly generate the figure by executing the above script. If you want to regenerate a certain heatmap, enter the corresponding subfolder and execute `timeout 1d make`.

After `make`, execute the following command to generate Figure 9.

```bash
cd $ARTIFACT_ROOT

python3 scripts/src/heatmap.py Morfuzz src/figure9/morfuzz/build/vcs/build/wdata.txt  # for Morfuzz
python3 scripts/src/heatmap.py DifuzzRTL src/figure9/difuzzrtl/build/vcs/build/wdata.txt  # for DifuzzRTL
python3 scripts/src/heatmap.py dv src/figure9/dv/build/vcs/build/wdata.txt # for riscv-dv
```
