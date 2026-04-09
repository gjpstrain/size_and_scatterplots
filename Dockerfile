FROM rocker/verse:4.3.1

WORKDIR /home/rstudio

# Copy renv.lock
COPY --chown=rstudio:rstudio renv.lock ./renv.lock

# Install renv and restore packages
RUN R -e "install.packages('renv')"
RUN R -e "renv::restore(prompt = FALSE)"

# Copy project files. Ownership given to rstudio user to allow editing and generation of new models/visualisations.

COPY --chown=rstudio:rstudio data/ ./data/
COPY size_and_scatterplots.Rmd ./
COPY --chown=rstudio:rstudio size_and_scatterplots/ ./size_and_scatterplots/
COPY item_preparation/ ./item_preparation/
COPY vgtc.cls ./
COPY size-and-scatterplots.bib ./
COPY template.tex ./
COPY bib_styles/ ./bib_styles/
COPY anonymisation.R ./
COPY data_processing_for_payment.R ./