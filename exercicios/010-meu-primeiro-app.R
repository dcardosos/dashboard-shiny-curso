# Meu primeiro shiny app
# 
# Faça um shiny app para visualizar histogramas da base diamonds 
# e o coloque no shinyapps.io.
# 
# Seu shiny deve ter um input e um output.
# 
# - Input: variáveis numéricas da base diamonds.
# - Output: histograma da variável selecionada.
# 
# Para acessar a base diamonds, carrrege o pacote ggplot2
# 
# library(ggplot2)
# 
# ou rode 
# 
# ggplot2::diamonds
library(magrittr)
library(ggplot2)
library(shiny)

ui <- fluidPage(
  "Plot your histogram!",
  selectInput(
    inputId = "variable", 
    label = "Chose one of the available numerical variables",
    choices = names(dplyr::select(diamonds, where(is.numeric)))
  ),
  
  plotOutput(
    outputId = "histogram",
    width = "900px",
    height = "800px"
  )
)


server <- function(input, output, session){
  
  output$histogram <- renderPlot({
    diamonds %>% 
      ggplot() +
      geom_histogram(aes(!!dplyr::sym(input$variable)), fill = "pink") +
      theme_minimal()
  })
}

shinyApp(ui, server)
