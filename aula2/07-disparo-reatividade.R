library(shiny)

ui <- fluidPage(
  textInput(
    inputId = "entrada",
    label = "Escreva um texto"
  ),
  
  textOutput(outputId = "saida")
)

server <- function(input, output, session) {
  
  texto <- reactive({
    print("rodei a exp reativa")
    input$entrada
  })
  
  # primeiro roda o observer, se depara com o texto, vai no reactive e faz o calculo
  
  output$saida <- renderText({
    print("rodei o observer")
    texto()
  })
  
}

shinyApp(ui, server)