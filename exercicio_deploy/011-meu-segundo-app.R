# Meu segundo shiny app (agora importando uma base de dados)
# 
# Escolha uma das bases da pasta dados ou use uma base própria.
# 
# - Crie um shiny app com pelo menos um input e um output 
# para visualizarmos alguma informação interessante da base.
# 
# - Suba o app para o shinyapps.io.
# 
# Observação: se você usar uma base própria, 
# não se esqueça de descrever as variáveis utilizadas na hora 
# de tirar dúvidas.

library(magrittr)
library(ggplot2)
library(shiny)
library(dplyr)
library(tidytext)
library(stopwords)
library(abjutils)
library(wordcloud2)

tab <- readr::read_csv("dados/desigualdade.csv") %>% 
  dplyr::filter(!is.na(partido))

ui <- fluidPage(
  "O que os partidos estão falando sobre desigualdade?",
  
  selectInput(
    inputId = "partido",
    label = "Escolha um partido",
    choices = dplyr::distinct(tab, partido)
  ),
  
  wordcloud2::wordcloud2Output("cloud")
)

server <- function(input, output, session){
  output$cloud <- wordcloud2::renderWordcloud2({
    
    stopwords <- tidytext::get_stopwords("pt") %>% 
      bind_rows(
        tibble::tibble(
          word = c("nao", "presidente", "sr", "deputado", "deputados", "orador",
                   "brasil"),
          lexicon = "snowball"
        )
      )
    tab %>% 
      filter(partido == input$partido) %>% 
      tidytext::unnest_tokens(word, discurso) %>% 
      filter(!grepl('[0-9]', word)) %>%
      mutate(word = abjutils::rm_accent(word)) %>%
      anti_join(stopwords) %>%
      group_by(word) %>% 
      count(word) %>%
      ungroup() %>% 
      slice_max(order_by = n, n = 500) %>% 
      wordcloud2::wordcloud2(shape = "circle")
    
  })
}

shinyApp(ui, server)
