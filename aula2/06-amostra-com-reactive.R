library(shiny)
library(magrittr)
library(ggplot2)
# Shiny app que mostre o resultado do sorteio de n números entre 1 e 10, sendo
# n um valor escolhido na UI

ui <- fluidPage(
  h1("Resultado do sorteio"), # titulo
  numericInput(
    inputId = "tamanho",
    label = "Selecione o tamanho da amostra",
    value = 100,
    min = 10,
    max = 100000,
    step = 1       # de quanto em quanto    
  ),
  
  plotOutput(outputId = "grafico"),
  textOutput(outputId = "resultado")
)

server <- function(input, output, session) {
  
  amostra <- reactive({
    sample(1:10, input$tamanho, replace = TRUE)
  })
  
  output$grafico <- renderPlot({
    
    amostra() %>% 
      table() %>% 
      barplot()
    
  })
  
  output$resultado <- renderText({
    
    valor <- names(which.max(table(amostra())))
    
    glue::glue("O número mais sorteado foi o {valor}")
    
  })
}

shinyApp(ui, server)
