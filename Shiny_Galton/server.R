#
# This is the server logic of a Shiny web application. 

library(shiny)
library(dplyr)
library(ggplot2)
library(HistData)

data(GaltonFamilies)

LM <- lm(childHeight ~ midparentHeight + gender + childNum, GaltonFamilies)

# Define server logic 
shinyServer(function(input, output, session) {
        
        output$plotText <- renderText({
                pred.data <- data.frame(midparentHeight = input$midparentHeight,
                        gender = input$gender, childNum = input$childNum)
                prediction <- predict(LM, pred.data)
                paste("Child predicted height is ",round(prediction, 2),
                      " (in) for child number ", input$childNum,
                      " with midparentHeight ",input$midparentHeight,
                      " (in) and ", input$gender," gender")
                
        })
        
        output$Plot <- renderPlot({
                pred.data <- data.frame(midparentHeight = input$midparentHeight,
                        gender = input$gender, childNum = input$childNum)
                prediction <- predict(LM, pred.data) 
                xax <- c("midparentHeight","childHeight")
                data <- data.frame(
                        x = factor(xax, levels = xax),
                        y = c(input$midparentHeight, prediction)
                )
                
                ggp <- ggplot(data, aes(x,y))
                ggp <- ggp + geom_bar(stat = "identity", fill = c("green","red"))
                ggp <- ggp + labs(x="", y="Height in")
                ggp        
                
        })
})
        
        



