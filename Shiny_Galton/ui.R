#
# This is the user-interface definition of a Shiny web application. 

library(shiny)
library(shinyWidgets)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Height prediction of children (GaltonFamily data set)"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        
           sidebarPanel(
                   
                   helpText("In this application, I predicted children's height 
                    on the basis of their gender, midparentHeight and child number."),
                   
                   helpText("For more information on the dataset, go through - 
                             https://rdrr.io/cran/HistData/man/GaltonFamilies.html"),
                   
                   helpText("Choose the gender of the children, and 
                             change the sliders to adjust the midparentHeight 
                             and child number in the family:"),
                   
                    radioButtons(inputId = "gender",
                                      label = "Gender of Children:",
                                      choices = c("male", "female")),
                    
                    sliderInput(inputId = "midparentHeight",
                                label = "midparentHeight (in):",
                                value = 70.,
                                min = 60.,
                                max = 80.,
                                step = 0.5),
                    
                    sliderInput(inputId = "childNum",
                                label = "Number of child in the family:",
                                value = 1.,
                                min = 1.,
                                max = 15.,
                                step = 1.), width = 4
                    
                ),

        # Show a plot of the generated distribution
        mainPanel(
                h3("Prediction results"),
                textOutput("plotText"),
                plotOutput("Plot", width = "80%", height = "400px")
                
        )
        
    )
)
