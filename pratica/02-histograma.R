library(shiny)

ui <- fluidPage(
  "Monte vários histogramas",
  selectInput(
    inputId = "variavel",
    label = "Selecione uma variável",
    choices = names(mtcars)
  ),
  plotOutput(outputId = "histograma")
)

server <- function(input, output, session){
  # sempre que precisar passar código para uma função você abre chaves
  output$histograma <- renderPlot({
    
    vetor <- mtcars[[input$variavel]]
    hist(vetor)
    
  })
}

shinyApp(ui, server)