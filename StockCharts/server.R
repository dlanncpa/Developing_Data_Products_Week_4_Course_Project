library(shiny)
library(quantmod)
library(lubridate)

shinyServer(function(input, output) {
  stockChoice<-reactive({
      stockInput<-input$radioStocks
      
      startDate<-Sys.Date()-years(2)
      endDate<-Sys.Date()
      
      getSymbols(c("AAPL", "FB", "MSFT"), src = "yahoo", from = startDate, to = endDate)
      
      stocks<-as.xts(data.frame(AAPL = AAPL[, "AAPL.Close"], FB = FB[, "FB.Close"], MSFT = MSFT[, "MSFT.Close"]))
  })
  
  moveAvgChoice<-reactive({
      moveAvgInput<-input$checkboxMoveAvg
      twentyAvg<-addSMA(n = 20, col = "green")
      fiftyAvg<-addSMA(n = 50, col = "blue")
      twohundAvg<-addSMA(n = 200, col = "pink")
  })

  output$candleStick <- renderPlot({
      candleChart(stockInput(), up.col = "black", dn.col = "red", theme = "white", subset = "2019-01-01/")
      
  })
  
})
