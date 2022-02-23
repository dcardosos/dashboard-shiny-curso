library(shiny)

ui <- fluidPage(
  h1("Formulário"),

  textInput(
    inputId = "nome",
    label = "Digite o seu nome"
  ),
  numericInput(
    inputId = "idade",
    label = "Digite a sua idade",
    value = 30,
    min = 18,
    max = NA,
    step = 1
  ),
  textInput(
    inputId = "estado",
    label = "Digite o seu estado"
  ),
  actionButton(
    inputId = "botao",
    label = "Enviar"
  ),
  h2("Resposta"),
  textOutput(outputId = "frase")
)

server <- function(input, output, session) {
  
  texto <- eventReactive(input$botao,{
    glue::glue("Seu nome é {input$nome}, tem {input$idade} anos e vive no estado de {input$estado}")
  })
  
  output$frase <- renderText({
    texto()  
  }) 
  
}

shinyApp(ui, server)
