FROM docker.io/rocker/r-ver:4.4@sha256:429c1a585ab3cd6b120fe870fc9ce4dc83f21793bf04d7fa2657346fffde28d1

# options(warn=2) will make the build error out if package doesn't install
RUN Rscript -e "options(warn = 2); install.packages('pak')"
# Using {pak} to install R packages: it resolves Ubuntu system dependencies AND
# the R dependency tree!
RUN Rscript -e "options( \ 
    warn = 2, \
    repos = c(CRAN = 'https://p3m.dev/cran/__linux__/jammy/2024-07-06') \
    ); \ 
    pak::pak( \ 
    c( \ 
    'httr2', \
    'lambdr' \
    ) \
    )"

# Lambda setup
RUN mkdir /R
COPY R/ /R
RUN chmod 755 -R /R

ENTRYPOINT Rscript R/runtime.R
CMD ["handler"]