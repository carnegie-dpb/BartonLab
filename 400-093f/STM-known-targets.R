## known STM targets, use AT name since variety of symbols in lit.
STM.target.names = c(
    "AT3G15170",
    "AT4G01540",
    "AT5G53950"
    )

## initialize all false
STM.targets = (rownames(fits)=="FOOBAR")

## create array of target booleans
for (target.name in STM.target.names) {
    STM.targets = STM.targets | (rownames(fits)==target.name)
}

rm(target.name)


