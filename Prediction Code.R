library(quantmod)
library(lubridate)

startDate<-Sys.Date()-years(2)
endDate<-Sys.Date()

getSymbols(c("AAPL", "FB", "MSFT"), src = "yahoo", from = startDate, to = endDate)

stocks<-as.xts(data.frame(AAPL = AAPL[, "AAPL.Close"], FB = FB[, "FB.Close"], MSFT = MSFT[, "MSFT.Close"]))

head(stocks)
str(stocks)

candleChart(AAPL, up.col = "black", dn.col = "red", theme = "white", subset = "2019-01-01/")
addSMA(n = 20, col = "green")
addSMA(n = 50, col = "blue")
addSMA(n = 200, col = "pink")