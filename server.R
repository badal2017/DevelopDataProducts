#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    set.seed(2016-10-25)
    no_points <- input$numeric
    minX <- input$sliderX[1]
   minY <- input$sliderY[1]
    maxX <- input$sliderX[2]
    maxY <- input$sliderY[2]
   datax <- runif(no_points, minX, maxX)
    datay <- runif(no_points, minY, maxY)
    xlab <- ifelse(input$show_xlab,"X-Axis","")
    ylab <- ifelse(input$show_ylab,"Y-Axis","")
    main <- ifelse(input$show_title,"Title","")
    
    plot(datax,datay,xlab = xlab, ylab = ylab, main = main,
         xlim = c(-100,100), ylim = c(-100,100))
    
  })
  
})
