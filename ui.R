#
# This is the user-interface definition of a Shiny web application. 
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
shinyUI(fluidPage(
  titlePanel("Regression from selected samples"),
  titlePanel("Please select at least 4 points"),
  sidebarLayout(
    sidebarPanel(
      h3("Slope"),
      textOutput("slopeOut"),
      h3("Intercept"),
      textOutput("intOut")
    ),
    mainPanel(
      plotOutput("plot1", brush = brushOpts(
        id = "brush1"
      ))
    )
  )
))