source("~/modeling/transmodel.fit.R")

##
## plot the fits for a list of genes
##
plot.fits = function(schema="gse70796", condition="GR-REV", fitTerms="etap.gammap", turnOff=0, genes) {

    t = 0:200/100
    first = TRUE
    
    for (gene in genes) {

        res = transmodel.fit(schema=schema, condition=condition, fitTerms=fitTerms, turnOff=turnOff, doPlot=FALSE, gene=gene)
        expr = rhop(t, res$rhoc0, res$rhon0, res$nu, res$rhop0, res$etap, res$gammap, turnOff=turnOff)
        if (first) {
            plot(t, expr, log="y", type="l", ylim=c(1,max(expr)), xlab="time (h)", ylab="expression", main=paste(schema,condition,fitTerms))
        } else {
            lines(t, expr)
        }
        text(t[1], expr[1], gene, cex=0.75, pos=4)

        first = FALSE

    }

}
