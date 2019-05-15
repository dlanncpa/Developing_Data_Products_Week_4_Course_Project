library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Candlestick Stock Charts"),
  
  sidebarLayout(
    sidebarPanel(
       radioButtons("stocks",
                   "Stocks",
                   c("Apple" = "AAPL",
                     "Facebook" = "FB",
                     "Microsoft" = "MSFT")),
       checkboxInput("moveAvg",
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