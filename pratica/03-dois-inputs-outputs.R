library(shiny)

ui <- fluidPage(
  selectInput(
    inputId = "variavel_a",
    label = "variavel a",
    choices = names(mtcars)
  ),
  plotOutput(outputId = "histograma_a"),
  selectInput(
    inputId = "variavel_b",
    label = "variavel b",
    choices = names(mtcars)
  ),
  plotOutput(outputId = "histograma_b")
)

server <- function(input, output, session){
  
  output$histograma_a <- renderPlot({
    vetor <- mtcars[[input$variavel_a]]
    hist(vetor)
  })
  
  output$histograma_b <- renderPlot({
    vetor <- mtcars[[input$variavel_b]]
    hist(vetor)
  })
}

shinyApp(ui, server)