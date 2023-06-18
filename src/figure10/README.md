# Experiment E4

The three folders in this directory each generated one of the three curves in Figure 10.

The `morfuzz-minus` folder corresponds to the $\text{Morfuzz}-$ curve, while the `morfuzz-star` folder corresponds to the $\text{Morfuzz}*$ curve.

## Execution

1. Go to the root directory of this repository, and run the following command to execute the experiment:

```bash
export ARTIFACT_ROOT=<path to the root directory of this repository>
source $ARTIFACT_ROOT/scripts/env.sh
```

2. If there is no error, run the following command to execute the experiment:

```bash
./scripts/fig10.sh
```

## Result

If the `fig10.sh` script is executed without errors, the figure 10 will be generated and saved in `scripts/output/fig10.pdf`.

## Regeneration

You can directly generate the figure by executing the above script. If you want to regenerate a certain curve, enter the corresponding subfolder and execute `timeout 1d make`.

After `make`, execute the following command to generate Figure 10.

```bash
cd $ARTIFACT_ROOT

python3 scripts/src/curve.py fig10  \
  Morfuzz    src/figure10/morfuzz/morfuzz-log.txt      \
  "Morfuzz-" src/figure10/morfuzz-minus/morfuzz-log.txt  \
  "Morfuzz*" src/figure10/morfuzz-star/morfuzz-log.txt
```
