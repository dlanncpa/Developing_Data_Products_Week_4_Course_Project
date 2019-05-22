library(shiny)
library(quantmod)

shinyUI(fluidPage(
    titlePanel("Candlestick Stock Charts"),
    sidebarLayout(
        sidebarPanel(
            textInput("symb", "Input a Valid Stock Symbol", "AAPL"),
            
            radioButtons("radioMoveAvg",
                         "Simple Moving Average",
                         c("20-day" = "twentyAvg",
                           "50-day" = "fiftyAvg", 
                           "200-day" = "twohundAvg"),
                         inline = TRUE),
            
            p("This app produces a candle chart based on the text input of a valid stock symbol. The stock 
              data is pulled from Yahoo. As a default, the app produces a 20-day simple moving average. The 
              user can choose to display a 50-day simple moving average or a 200-day simple moving average.")
        ),

        mainPanel(
            plotOutput("candleStick")
        )
    )
))