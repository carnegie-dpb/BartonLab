source("add.fit.params.R")

## set CONDITION before running this
if (CONDITION=="GR-REV") {
    fits = read.table("~/modeling/rnaseq.rev.fits.txt")
} else if (CONDITION=="GR-STM") {
    fits = read.table("~/modeling/rnaseq.stm.fits.txt")
} else if (CONDITION=="GR-AS2") {
    fits = read.table("~/modeling/rnaseq.as2.fits.txt")
} else if (CONDITION=="GR-KAN") {
    fits = read.table("~/modeling/rnaseq.kan.fits.txt")
}

SCHEMA = "gse70796"
FIT_TERMS = "etap.gammap"

R2_MIN = 0.6
R2_SLACK = 0.1

## new columns
fits$group = fits$R2.group
fits$p = fits$p.120
fits$q = fits$q.120
fits$logFC = fits$logFC.120
fits$R2 = fits$R2.L

## select the best fit, but use the L fit if they're close (within R2_SLACK)
for (i in 1:length(rownames(fits))) {
    if (fits$R2.L[i]>R2_MIN || fits$R2.M[i]>R2_MIN || fits$R2.E[i]>R2_MIN) {
        ## at least one significant fit
        if (fits$R2.L[i]>(fits$R2.M[i]-R2_SLACK) && fits$R2.L[i]>(fits$R2.E[i]-R2_SLACK)) {
            ## L (or close enough)
            fits$group[i] = "L"
            fits$p[i] = fits$p.120[i]
            fits$q[i] = fits$q.120[i]
            fits$logFC[i] = fits$logFC.120[i]
            fits$R2[i] = fits$R2.L[i]
        } else if (fits$R2.M[i]>fits$R2.E[i]) {
            ## M
            fits$group[i] = "M"
            fits$p[i] = fits$p.60[i]
            fits$q[i] = fits$q.60[i]
            fits$logFC[i] = fits$logFC.60[i]
            fits$R2[i] = fits$R2.M[i]
        } else {
            ## E
            fits$p[i] = fits$p.30[i]
            fits$q[i] = fits$q.30[i]
            fits$logFC[i] = fits$logFC.30[i]
            fits$R2[i] = fits$R2.E[i]
        }
    } else {
        ## flag as an insignificant fit
        fits$R2[i] = 0
    }
}

## clear out old columns
fits$R2.group = NULL
fits$logFC.group = NULL

fits$p.30 = NULL
fits$p.60 = NULL
fits$p.120 = NULL

fits$q.30 = NULL
fits$q.60 = NULL
fits$q.120 = NULL

fits$logFC.30 = NULL
fits$logFC.60 = NULL
fits$logFC.120 = NULL

fits$R2.E = NULL
fits$R2.M = NULL
fits$R2.L = NULL

## toss genes with low R2
fits = fits[fits$R2>0.60,]

## toss genes with high p
fits = fits[fits$p<0.05,]

## toss genes that aren't particularly DE
fits = fits[abs(fits$logFC)>1,]

######################################################
## now add in the fit parameters by rerunning the fits
######################################################
fits = add.fit.params(fits)

## toss genes with low mean expression
fits = fits[fits$meandata>1,]

## toss genes with strongly negative gammap, those are non-physical
fits = fits[fits$gammap>-1,]

## toss genes with gammap>4.95, those are artificial gammap values set near 5
fits = fits[fits$gammap<4.95,]

## clamp etap.hat at 2 since anything higher is likely just from an inaccurately small rho0 value
fits$etap.hat[fits$etap.hat>2] = 2
