##
## Run through the full RMA normalization / limma differential expression workflow
##

library(affy)
library(limma)

abatch = ReadAffy()

rma = rma(abatch)

source("calc-fits.R")

source("calc-res.R")
