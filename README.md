# Adjusting Point Size to Facilitate More Accurate Correlation Perception in Scatterplots

Files, data, and scripts required to fully recreate our study investigating how manipulating point size in scatterplots can influence viewers' performance in a correlation estimation task.

## Data

Raw data (.csv format) is located in the `data` folder. The R script `data_processing_for_payment.R` takes raw data straight from pavlovia.org, and writes a .csv file with a list of passed and failed participants to the `data` folder.

Once participants have been paid or excluded, use the `anonymisation.R` script to remove identifiable prolific IDs.

NB: Aside from anonymisation, data are provided *as-is*. The **wrangle** function *must* be run to make the dataset usable.

### Analysis Within a Fully-Reproducible Computational Environment

Resources are provided for the full reproduction of the computational environment (R, Rstudio, and package versions) that was used for data wrangling, visualization, statistical modelling, and reporting.

To begin, clone this repository to your local machine. With Docker running in the background, use a terminal (or cmd on Windows) to navigate to the cloned repository and type the following Docker command:

```docker build -t size_and_scatterplots .```

Then, type:

```docker run --rm -p 8787:8787 -e PASSWORD=password size_and_scatterplots```

Once the container is running, open a web browser and type `localhost:8787` in the address bar. Enter the username `rstudio` and the password `password`. This will generate a fully functioning Rstudio session running from the docker container.

### Re-creating the manuscript

Opening `size_and_scatterplots.Rmd` and using the 'Knit' button (or shift+k) will allow you to re-create a .pdf of the manuscript.

IMPORTANT: Models have been cached to increase performance. The cache will not be recognised automatically when using RStudio within the Docker container. eval_models must be set to FALSE in line 79 in order to use the cached models. This will prevent knitr from executing the code for each model, but will 'lazyload' all cached models so they can be used in manuscript generation. Setting eval_models to TRUE in line 79 will result in all models being re-generated.

The manuscript was written by adapting the IEEE VGTC latex template available online.

Files used in generating manuscript:

 - `size_and_scatterplots.Rmd`: Full R markdown script including text and all code
 - `size_and_scatterplots/latex`: folder containing cached models
 - `data`: folder containing collected, anonymized data
 - `size-and-scatterplots.bib` for referencing
 - `vgtc.cls`: LaTeX class file required for building manuscript
 - `template.tex`: the customized VGTC template used for the manuscript

Knitting the manuscript may take some time depending on the performance of your computer.

### Other Files

 - `item_preparation`: folder containing scripts to generate all experimental items, practice items, and visual masks.

## Experiment Code and Materials

 - Experiment: https://gitlab.pavlovia.org/Strain/exp_size_only
 
## Pre-Registration

Pre-registrations for hypotheses with the OSF can be found here: https://osf.io/k4gd8
