library(shiny)
library(quantmod)

shinyUI(fluidPage(
    titlePanel("Candlestick Stock Charts"),
    sidebarLayout(
        sidebarPanel(
            textInput("symb", "Input a Valid Stock Symbol", "AAPL"),
            
            radioButtons("radioMoveAvg",
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