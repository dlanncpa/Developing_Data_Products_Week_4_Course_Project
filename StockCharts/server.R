library(shiny)
library(quantmod)
library(lubridate)

startDate<-Sys.Date()-years(2)
endDate<-Sys.Date()

getSymbols(c("AAPL", "FB", "MSFT"), src = "yahoo", from = startDate, to = endDate)

stocks<-as.xts(data.frame(AAPL = AAPL[, "AAPL.Close"], FB = FB[, "FB.Close"], MSFT = MSFT[, "MSFT.Close"]))

shinyServer(function(input, output) {
  cs<-reactive({
      candleChart(input$radioStocks, up.col = "black", dn.col = "red", theme = "white", subset = "2019-01-01/")
  })

    output$plotAAPL <- renderPlot({
      cs
      if(input$radioMoveAvg=="twentyAvg"){
          SMA(AAPL[, "AAPL.Close"], n = 20, col = "green")
      } else if(input$radioMoveAvg=="fiftyAvg") {
          SMA(AAPL[, "AAPL.Close"], n = 50, col = "blue")
      } else {
          SMA(AAPL[, "AAPL.Close"], n = 200, col = "pink")
      }
  })
  output$plotFB <- renderPlot({
      cs
      if(input$radioMoveAvg=="twentyAvg"){
          SMA(FB[, "FB.Close"], n = 20, col = "green")
      } else if(input$radioMoveAvg=="fiftyAvg") {
          SMA(FB[, "FB.Close"], n = 50, col = "blue")
      } else {
          SMA(FB[, "FB.Close"], n = 200, col = "pink")
      }
  })
  output$plotMSFT <- renderPlot({
      cs
      if(input$radioMoveAvg=="twentyAvg"){
          SMA(MSFT[, "MSFT.Close"], n = 20, col = "green")
      } else if(input$radioMoveAvg=="fiftyAvg") {
          SMA(MSFT[, "MSFT.Close"], n = 50, col = "blue")
      } else {
          SMA(MSFT[, "MSFT.Close"], n = 200, col = "pink")
      }
  })

})