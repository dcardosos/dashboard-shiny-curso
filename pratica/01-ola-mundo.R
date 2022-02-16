library(shiny)

ui <- fluidPage("Olá, mundo!")

server <- function(input, output, session) {
  # funciona como uma página estática
}

shinyApp(ui, server)