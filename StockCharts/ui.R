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
       checkboxInput("checkboxMoveAvg",
                     "Moving Averages",
                     c("20-day" = "twentyAvg",
                       "50-day" = "fiftyAvg", 
                       "200-day" = "twohundAvg"))
    ),
    
    mainPanel(
       plotOutput("candleStick")
    )
  )
))