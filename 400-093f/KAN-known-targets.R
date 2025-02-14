## known KAN targets, use AT name since variety of symbols in lit; from Reinhardt, et al.
KAN.target.names = c(
    "AT2G40330",
    "AT2G41940",
    "AT2G44550",
    "AT3G13040",
    "AT4G18700",
    "AT4G26950",
    "AT1G06180",
    "AT1G79160",
    "AT4G17460",
    "AT5G47370",
    "AT2G44910",
    "AT4G37790"
)

## initialize all false
KAN.targets = (rownames(fits)=="FOOBAR")

## create array of target booleans
for (target.name in KAN.target.names) {
    KAN.targets = KAN.targets | (rownames(fits)==target.name)
}

rm(target.name)


