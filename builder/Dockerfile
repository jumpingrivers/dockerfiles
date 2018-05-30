FROM rocker/verse

## TODO: Document and clean up

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
      whois ccache \
      libssl-dev libcurl4-openssl-dev \
      libssh2-1-dev libxml2-dev libcairo2-dev \
      fonts-linuxlibertine \
      latexmk \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/downloaded_packages/

RUN useradd trainer -m \
 && usermod -aG sudo trainer

RUN mkdir rpackages \
 && chown trainer: rpackages \
 && chmod u+w rpackages \
 && chmod a+r rpackages \
 && echo "R_LIBS=/rpackages/" >> /usr/local/lib/R/etc/Renviron.site

## TODO: move?
RUN tlmgr install \
      tufte-latex \
      hardwrap \
      titlesec \
      ms \
      textcase \
      setspace \
      xcolor \
      fancyhdr \
      units \
      ulem \
      morefloats \
      microtype \
      xltxtra \
      realscripts

USER trainer
RUN echo "options(Ncpus = max(1, parallel::detectCores() - 1))" >> /home/trainer/.Rprofile \
    && install2.r -l /rpackages/ --error drat plotly DT hrbrthemes \
    && echo "options(repos = c('CRAN' = 'https://cran.rstudio.com/',  \
                    'jr-packages' = 'https://jr-packages.github.io/drat/'))" >> /home/trainer/.Rprofile

## TODO: automate
RUN install2.r --deps TRUE --error -l /rpackages/ \
               jrIntroduction jrModelling jrProgramming \
               jrGgplot2 jrAutomate jrEfficient \
               jrTidyverse jrAdvanced jrBig \
               jrPredictive jrPackage

USER trainer

ENTRYPOINT []
