source("~/R/getSamples.R")
source("~/R/getExpressionDF.R")
source("~/R/anova.twoway.R")

##
## Crank out all the ANOVA combinations for the various control/treatment pairs
##

samples = getSamples(schema="grtiny", host="localhost")
expr = getExpressionDF(schema="grtiny", host="localhost", scale=FALSE)

## ALL conditions:
## Col-0-WT x GR-AS2 x GR-KAN x GR-REV x GR_STM x GR-TINY

## ## ALL

## conditions = c("Col-0-WT", "GR-AS2", "GR-KAN", "GR-REV", "GR_STM", "GR-TINY")
## anova.ALL = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
## write.table(file="anova.ALL.tsv", anova.ALL, quote=FALSE, sep="\t")

## Col x GR-x

conditions = c("Col-0-WT", "GR-AS2")
anova.col.as2 = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.ColxGR-AS2.tsv", anova.col.as2, quote=FALSE, sep="\t")

conditions = c("Col-0-WT", "GR-KAN")
anova.col.kan = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.ColxGR-KAN.tsv", anova.col.kan, quote=FALSE, sep="\t")

conditions = c("Col-0-WT", "GR-REV")
anova.col.rev = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.ColxGR-REV.tsv", anova.col.rev, quote=FALSE, sep="\t")

conditions = c("Col-0-WT", "GR-STM")
anova.col.stm = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.ColxGR-STM.tsv", anova.col.stm, quote=FALSE, sep="\t")

conditions = c("Col-0-WT", "GR-TINY")
anova.col.tiny = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.ColxGR-TINY.tsv", anova.col.tiny, quote=FALSE, sep="\t")

## GR-AS2 x GR-x

conditions = c("GR-AS2", "GR-KAN")
anova.as2.kan = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.GR-AS2xGR-KAN.tsv", anova.as2.kan, quote=FALSE, sep="\t")

conditions = c("GR-AS2", "GR-REV")
anova.as2.rev = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.GR-AS2xGR-REV.tsv", anova.as2.rev, quote=FALSE, sep="\t")

 conditions = c("GR-AS2", "GR-STM")
anova.as2.stm = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.GR-AS2xGR-STM.tsv", anova.as2.stm, quote=FALSE, sep="\t")

conditions = c("GR-AS2", "GR-TINY")
anova.as2.tiny = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.GR-AS2xGR-TINY.tsv", anova.as2.tiny, quote=FALSE, sep="\t")

## GR-KAN x GR-x

conditions = c("GR-KAN", "GR-REV")
anova.kan.rev = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.GR-KANxGR-REV.tsv", anova.kan.rev, quote=FALSE, sep="\t")

conditions = c("GR-KAN", "GR-STM")
anova.kan.stm = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.GR-KANxGR-STM.tsv", anova.kan.stm, quote=FALSE, sep="\t")

conditions = c("GR-KAN", "GR-TINY")
anova.kan.tiny = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.GR-KANxGR-TINY.tsv", anova.kan.tiny, quote=FALSE, sep="\t")

## GR-REV x GR-x

conditions = c("GR-REV", "GR-STM")
anova.rev.stm = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.GR-REVxGR-STM.tsv", anova.rev.stm, quote=FALSE, sep="\t")

conditions = c("GR-REV", "GR-TINY")
anova.rev.tiny = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.GR-REVxGR-TINY.tsv", anova.rev.tiny, quote=FALSE, sep="\t")

## GR-STM x GR-x

conditions = c("GR-STM", "GR-TINY")
anova.stm.tiny = anova.twoway(expr, samples, conditions, takeLog2=TRUE, scale=TRUE)
write.table(file="anova.GR-STMxGR-TINY.tsv", anova.stm.tiny, quote=FALSE, sep="\t")
