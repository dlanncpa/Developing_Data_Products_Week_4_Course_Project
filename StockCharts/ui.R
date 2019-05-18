library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Candlestick Stock Charts"),
  
  sidebarLayout(
    sidebarPanel(
       radioButtons("radioStocks",
                   "Stocks",
                   c("Apple" = "AAPL",
                     "Facebook" = "FB",
                     "Microsoft" = "MSFT")),
       radioButtons("radioMoveAvg",
                     "Moving Averages",
                     c("20-day" = "twentyAvg",
                       "50-day" = "fiftyAvg", 
                       "200-day" = "twohundAvg"))
    ),
    
    mainPanel(
       conditionalPanel(condition = "input.radioStocks == 'AAPL'", plotOutput(outputId = "plotAAPL")),
       conditionalPanel(condition = "input.radioStocks == 'FB'", plotOutput(outputId = "plotFB")),
       conditionalPanel(condition = "input.radioStocks == 'MSFT'", plotOutput(outputId = "plotMSFT"))
    )
  )
))