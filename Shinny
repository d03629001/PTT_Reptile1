install.packages("shiny")
library(shiny)
#runExample("01_hello")

## Server.R
output$distPlot <- renderPlot({
  x <- faithful[, 2] # Old Faithful Geyser data
  bins <- seq(min(x), max(x), length.out = 10)
  hist(x, breaks = bins, col = 'blue', border = 'white')
})

mainPanel(plotOutput("distPlot"))
sliderInput("slider1", label = "Slider", min = 0, max = 100, value = 50)
bins <- seq(min(x), max(x), length.out = input$slider + 1)



mainPanel(plotOutput("distPlot"))

## UI.R
shinyUI(fluidPage(
  titlePanel('Analysis Report: Exotic/Wildlife Trade in Taiwan'),
  titlePanel("Year:2010~2017"),
  titlePanel("Source:PTT,Facebook,Forum")
))
## Sidebar
sidebarLayout(
  sidebarPanel(
    radioButtons("radio", label = "Exotic Type", choices = list("Avian" = 1, "Reptile" = 2,"Mammalian" = 3,"Insect" = 4)),
    sliderInput("slider1", label = "Time/week as unit", min = 0, max = 100, value = 50)
  ),
  mainPanel("Number trades within Time")
)

