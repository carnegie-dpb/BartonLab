## load the known targets for this GR-TF
if (CONDITION=="GR-REV") {
    fits = fits.REV
    source("REV-known-targets.R")
    known.targets = REV.targets
    fits["AT2G36307",]$symbol = "ZPR4"
} else if (CONDITION=="GR-STM") {
    fits = fits.STM
    source("STM-known-targets.R")
    known.targets = STM.targets
    fits["AT3G15170",]$symbol = "NAC054/CUC1"
    fits["AT5G53950",]$symbol = "NAC098/CUC2"
    fits["AT4G01540",]$symbol = "NAC68/NTM1"
} else if (CONDITION=="GR-AS2") {
    fits = fits.AS2
    known.targets = c()
} else if (CONDITION=="GR-KAN") {
    fits = fits.KAN
    source("KAN-known-targets.R")
    known.targets = KAN.targets
}

##
## Make a nice plot of etap.hat vs gammap
##

## full scale
plot(fits$gammap, fits$etap.hat, main=CONDITION, xlab="mRNA loss rate (per hour)", ylab="norm. primary transcription rate (per hour)")
text(fits$gammap, fits$etap.hat, fits$symbol, cex=0.5, pos=4)
text(fits$gammap, fits$etap.hat, fits$group, cex=0.5, pos=2)
text(fits$gammap, fits$etap.hat, round(fits$meandata,2), cex=0.5, pos=1)
if (length(known.targets)>0) {
    points(fits$gammap[known.targets], fits$etap.hat[known.targets], pch=19, col="red")
    text(fits$gammap[known.targets], fits$etap.hat[known.targets], fits$symbol[known.targets], cex=0.5, pos=4, col="red")
    text(fits$gammap[known.targets], fits$etap.hat[known.targets], fits$group[known.targets], cex=0.5, pos=2, col="red")
    text(fits$gammap[known.targets], fits$etap.hat[known.targets], round(fits$meandata[known.targets],2), cex=0.5, pos=1, col="red")
}

## ## zoom
## plot(fits$gammap, fits$etap.hat, ylim=c(-0.1,0.4))
## text(fits$gammap, fits$etap.hat, fits$symbol, cex=0.5, pos=4)
## text(fits$gammap, fits$etap.hat, fits$group, cex=0.5, pos=2)
## points(fits$gammap[known.targets], fits$etap.hat[known.targets], pch=19, col="red")
## text(fits$gammap[known.targets], fits$etap.hat[known.targets], fits$symbol[known.targets], cex=0.5, pos=4, col="red")
## text(fits$gammap[known.targets], fits$etap.hat[known.targets], fits$group[known.targets], cex=0.5, pos=2, col="red")
