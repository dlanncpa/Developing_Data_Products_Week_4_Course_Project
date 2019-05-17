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
                     c("20-day" == 20,
                       "50-day" == 50, 
                       "200-day" == 200))
    ),
    
    mainPanel(
       conditionalPanel(condition = "input.radioStocks == 'AAPL'", plotOutput(outputId = "plotAAPL")),
       conditionalPanel(condition = "input.radioStocks == 'FB'", plotOutput(outputId = "plotFB")),
       conditionalPanel(condition = "input.radioStocks == 'MSFT'", plotOutput(outputId = "plotMSFT"))
    )
  )
))