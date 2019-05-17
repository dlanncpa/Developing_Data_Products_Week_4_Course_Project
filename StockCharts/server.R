library(shiny)
library(quantmod)
library(lubridate)

startDate<-Sys.Date()-years(2)
endDate<-Sys.Date()

getSymbols(c("AAPL", "FB", "MSFT"), src = "yahoo", from = startDate, to = endDate)

stocks<-as.xts(data.frame(AAPL = AAPL[, "AAPL.Close"], FB = FB[, "FB.Close"], MSFT = MSFT[, "MSFT.Close"]))

shinyServer(function(input, output) {
  cs<-candleChart(input$radioStocks, up.col = "black", dn.col = "red", theme = "white", subset = "2019-01-01/")
  
  movAvg<-addSMA(n = input$radioMoveAvg)

  output$plotAAPL <- renderPlot({
      cs
      if(input$radioMoveAvg){
          movAvg
      }
  })
  output$plotFB <- renderPlot({
      cs
      if(input$radioMoveAvg){
          movAvg
      }
  })
  output$plotMSFT <- renderPlot({
      cs
      if(input$radioMoveAvg){
          movAvg
      }
  })

})