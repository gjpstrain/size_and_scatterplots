# Add the rocker/verse Docker image for R 4.3.1

FROM rocker/verse:4.3.1

# Add our files and folders to container

ADD data/ /home/rstudio/data/
ADD size_and_scatterplots.Rmd /home/rstudio/
ADD size_and_scatterplots/ /home/rstudio/size_and_scatterplots/
ADD size_and_scatterplots_files/ /home/rstudio/size_and_scatterplots_files/
ADD item_preparation/ /home/rstudio/item_preparation/
ADD vgtc.cls /home/rstudio/
ADD size-and-scatterplots.bib /home/rstudio/
ADD template.tex /home/rstudio/
ADD bib_styles/ /home/rstudio/bib_styles/
ADD anonymisation.R /home/rstudio/
ADD data_processing_for_payment.R /home/rstudio/

# Add appropriate versions of required R packages to container

RUN R -e "install.packages('devtools')"

RUN R -e "require(devtools)"

RUN R -e "install.packages('remotes')"

RUN R -e "devtools::install_version('rticles', version = '0.25', dependencies = T)"
RUN R -e "devtools::install_version('tinytex', version = '0.46', dependencies = T)"
RUN R -e "devtools::install_version('MASS', version = '7.3-60', dependencies = T)"
RUN R -e "devtools::install_version('buildmer', version = '2.9', dependencies = T)"
RUN R -e "devtools::install_version('emmeans', version = '1.8.8', dependencies = T)"
RUN R -e "devtools::install_version('scales', version = '1.2.1', dependencies = T)"
RUN R -e "devtools::install_version('lme4', version = '1.1-34', dependencies = T)"
RUN R -e "devtools::install_version('afex', version = '1.3-0', dependencies = T)"
RUN R -e "devtools::install_version('bookdown', version = '0.35', dependencies = T)"
RUN R -e "devtools::install_version('qwraps2', version = '0.5.2', dependencies = T)"
RUN R -e "devtools::install_version('kableExtra', version = '1.3.4', dependencies = T)"
RUN R -e "devtools::install_version('lmerTest', version = '3.1-3', dependencies = T)"
RUN R -e "devtools::install_version('EMAtools', version = '0.1.4', dependencies = T)"
RUN R -e "devtools::install_version('ggdist', version = '3.3.0', dependencies = T)"
RUN R -e "devtools::install_version('ggpubr', version = '0.6.0', dependencies = T)"
RUN R -e "devtools::install_version('conflicted', version = '1.2.0', dependencies = T)"
RUN R -e "devtools::install_version('sjmisc', version = '2.8.9', dependencies = T)"
RUN R -e "install.packages('papaja', version = '0.1.3', dependencies = T)"
