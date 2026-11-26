# Heart Disease Analysis

This report checks missing values, summarizes patient characteristics by heart disease status, and compares maximum heart rate between patients with and without heart disease.

## Generate the report

Run the following commands in the Terminal from the project directory:

```bash
make install
make
```

`make install` restores the R package environment recorded in `renv.lock`.
`make` generates `Final.html`.

## Table and figure code

- `R/make_table.R` creates the missing-value table and the patient-characteristics table.
- `R/make_figure.R` creates the maximum-heart-rate boxplot.