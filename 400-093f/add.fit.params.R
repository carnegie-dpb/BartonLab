source("~/R/getExpression.R")
source("~/modeling/transmodel.fit.R")
##
## add the fit parameters to a data frame which has gene ID as rowname
##
add.fit.params = function(fits) {

    ## transmodel.fit output
    ## $minimum
    ## $estimate
    ## $gradient
    ## $code
    ## $iterations
    ## $R2

    for (i in 1:length(rownames(fits))) {
        gene = rownames(fits)[i]
        group = fits$group[i]
        if (group=="E") {
            turnOff = 0.5
        } else if (group=="M") {
            turnOff = 1.0
        } else {
            turnOff = 0.0
        }
        res = transmodel.fit(schema=SCHEMA, condition=CONDITION, fitTerms=FIT_TERMS, turnOff=turnOff, doPlot=FALSE, gene=gene)
        print(paste(gene,group,turnOff,res$rhop0,res$etap,res$gammap))
        ## FUDGE if gammap<0
        ## if (res$gammap<0) {
        ##     print("Refitting with gammap=0:")
        ##     res = transmodel.fit(schema=SCHEMA, condition=CONDITION, turnOff=turnOff, doPlot=FALSE, gene=gene, fitTerms="etap", gammap=1e-5)
        ##     print(paste(gene,group,turnOff,res$rhop0,res$etap,res$gammap))
        ## }
        ## Store the fit parameters
        fits$rhop0[i] = res$rhop0
        fits$etap[i] = res$etap
        fits$gammap[i] = res$gammap
        ## HACK: fudge etap.hat so we don't get huge numbers from small/insignificant rhop0 values
        ## fits$etap.hat[i] = res$etap/max(res$rhop0,1)
        ## NORMAL: etap.hat
        fits$etap.hat[i] = res$etap/res$rhop0
        fits$meandata[i] = mean(getExpression(schema=SCHEMA, condition=CONDITION, gene=gene))
    }

    return(fits)
}
    
