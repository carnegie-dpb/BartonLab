gammap = 200:2000 / 100

nu = array(dim=length(gammap))

for (i in 1:length(gammap)) {
    if (gammap[i]!=10) {
        fit = transmodel.fit(schema="grtiny",condition="GR-TINY", fitTerms="nu.etap", gammap=gammap[i], gene="RAS1")
        nu[i] = fit$estimate[1]
        print(paste(gammap[i],nu[i]))
    }
}
