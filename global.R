## Introductory work so that both ui.R and server.R
## have access to data. 
require(RCurl)
x <- getURL("https://github.com/Berran1/DDPDrugData/prodData.csv")
prodDnga <- read.csv(text = x)
