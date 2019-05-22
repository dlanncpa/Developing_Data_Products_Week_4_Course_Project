library(shiny)
library(quantmod)

shinyServer(function(input, output) {
    dataInput<-reactive({
        getSymbols(input$symb,
                   src = "yahoo",
                   from = "2014-01-01",
                   auto.assign = FALSE)
        
    })
    
    moveAvg<-reactive({
        if(input$radioMoveAvg=="twentyAvg"){
            addSMA(n = 20, col = "blue")
        }
        else if(input$radioMoveAvg=="fiftyAvg"){
            addSMA(n = 50, col = "green")
        }
        else {
            addSMA(n = 200, col = "pink")
        }
    })

    output$candleStick <- renderPlot({
        candleChart(dataInput(), name = input$symb, up.col = "black", dn.col = "red", theme = "white", subset = "2019-01-01/")
        moveAvg()
    })
})