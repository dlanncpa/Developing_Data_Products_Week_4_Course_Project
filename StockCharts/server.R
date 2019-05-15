library(shiny)
library(quantmod)
library(lubridate)

shinyServer(function(input, output) {
  startDate<-Sys.Date()-years(2)
  endDate<-Sys.Date()
  
  getSymbols(c("AAPL", "FB", "MSFT"), src = "yahoo", from = startDate, to = endDate)
  
  stocks<-as.xts(data.frame(AAPL = AAPL[, "AAPL.Close"], FB = FB[, "FB.Close"], MSFT = MSFT[, "MSFT.Close"]))
  
  
  
  output$candleStick <- renderPlot({
    
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
})
