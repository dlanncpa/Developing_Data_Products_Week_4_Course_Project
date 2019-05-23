Shiny Stock Candle Chart App
========================================================
author: Dustin Lanning
date: 2019-05-23
autosize: true

Introduction
========================================================

This presentation is the final course project for the Developing
Data Products course. The project consists of two parts. First,
we are to create a Shiny app and deploy it on RStudio's servers.
Second, we must create a pitch presentation using Slidify or RStudio
Presenter.

I have chosen to create a stock chart app using the Quantmod
package. The Quantmod package allows one to develop, test and deploy
statistically based trading models. My application takes the text
input of a valid publicly traded ticker symbol and using financial
data from Yahoo, produces a candle chart of the stocks closing
price for each trading day in 2019. The user can choose to display
either a 20-day, 50-day, or 200-day simple moving average on the plot.

Quantmod getSymbols Function
========================================================

The following is an example of the getSymbols code used in my app. Apple's
ticker symbol AAPL is used for the example.






```
Error in getSymbols.yahoo(Symbols = "AAPL", env = <environment>, verbose = FALSE,  : 
  Unable to import "AAPL".
Send failure: Connection was reset
```
