## known REV targets, use AT name since variety of symbols in lit; from Reinhardt, et al.
REV.target.names = c(
    "AT4G32980",
    "AT4G17460",
    "AT5G47370",
    "AT3G60390",
    "AT4G16780",
    "AT5G06710",
    "AT4G37790",
    "AT4G26950",
    "AT2G40330",
    "AT2G44910",
    "AT1G13110",
    "AT1G70560",
    "AT2G41940",
    "AT4G18700",
    "AT5G05690",
    "AT3G47620",
    "AT1G26770",
    "AT3G54990",
    "AT1G32240",
    "AT5G43810",
    "AT4G10770",
    "AT2G02070",
    "AT2G02080",
    "AT3G13810",
    "AT3G23630",
    "AT2G45450",
    "AT3G60890",
    "AT3G52770",
    "AT2G36307"
    )

## initialize all false
REV.targets = (rownames(fits)=="FOOBAR")

## create array of target booleans
for (target.name in REV.target.names) {
    REV.targets = REV.targets | (rownames(fits)==target.name)
}

rm(target.name)


