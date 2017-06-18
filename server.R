#
# This is the server logic of a Shiny web application. 
#
# Developed by Yuan Ren 
# for Project under Developing Data Products Course
# on June 17, 2017
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyServer(function(input, output) {
  model <- reactive({
    brushed_data <- brushedPoints(cars, input$brush1,
                                  xvar = "speed", yvar = "dist")
    if(nrow(brushed_data) < 4){
      return(NULL)
    }
    lm(dist ~ speed, data = brushed_data)
  })
  
  output$slopeOut <- renderText({
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][2]
    }
  })
  
  output$intOut <- renderText({
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][1]
    }
  })
  
  output$plot1 <- renderPlot({
    plot(cars$speed, cars$dist, xlab = "Speed of vehicle",
         ylab = "Distance traveled", main = "The impact of speed on Vehicle traveled distance",
         cex = 1.5, pch = 16, bty = "n")
    if(!is.null(model())){
      abline(model(), col = "red", lwd = 3)
    }
  })
  
  
})