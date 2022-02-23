library(shiny)

ui <- fluidPage(
  "Monte vários histogramas",
  selectInput(
    inputId = "variavel",
    label = "Selecione a primeira variável",
    choices = names(mtcars)
  ),
  selectInput(
    inputId = "variavel2",
    label = "Selecione a segunda variavel",
    choices = names(mtcars)
  ),
  plotOutput(outputId = "scatterplot")
)

server <- function(input, output, session){
  
  output$scatterplot <- renderPlot({
    
    ggplot2::ggplot(mtcars, ggplot2::aes(x = !!dplyr::sym(input$variavel),
                                         y = !!dplyr::sym(input$variavel2))) +
      ggplot2::geom_point()
    
  })
}

shinyApp(ui, server)