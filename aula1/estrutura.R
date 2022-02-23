library(shiny)

# ui - guarda código em HTML, ou seja, só podemos colocar dentro de "ui"
# um código em HTML
# por isso o shiny é muito bom, porque ele constrói códigos html por você
ui <- fluidPage("Olá mundo")

# server - backend, lógica por trás das cortinas
# sempre recebe esses três argumentos
#' @param input uma lista com todos os parâmetros que o usuário pode mexer
#' @param output lista com todas as visualizaç˜òes que vamos mostra para o user
#' @param session lista com informações da sessão que está rodando o app
server <- function(input, output, session) {
  
}

# outputs
## definidos na UI e criados no server, cada tipo é definido por uma função
## do tipo `*Output()`, por exemplo:

plotOutput() # graficos
tableOutput() # tableas
textOutput() # textos

# funções render
## responsáveis por conectar nossos outputs criados em R com o código HTML do UI
## teremos o par visualizacaoOutput() e renderVisualizacao(), por exemplo:

renderPlot()
renderTable()
renderText()

# inputs
## funções *Input() ou *Button()