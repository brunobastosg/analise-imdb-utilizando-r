library(shiny)
library(dplyr)
library(magrittr)
library(readr)

# dataset disponível em https://www.kaggle.com/PromptCloudHQ/imdb-data
filmes = read_csv("../dataset/IMDB-Movie-Data.csv")

ui <- fluidPage(

    titlePanel("Diretores melhores e piores avaliados pelo público e crítica de 2006 a 2016"),

    sidebarLayout(
        sidebarPanel(
            sliderInput("anos",
                        "Intervalo de anos",
                        min = 2006,
                        max = 2016,
                        value = c(2006, 2016),
                        sep = ""),

            numericInput("qtdMinFilmes", label = "Quantidade mínima de filmes", value = 3),

            radioButtons("tipoNota", label = "Tipo da nota", 
                               choices = list("Público" = 1, "Crítica" = 2, "Todas" = 3),
                               selected = 1),

            sliderInput("qtd",
                        "Quantidade de diretores",
                        min = 1,
                        max = 5,
                        value = 1),

            radioButtons("melhoresOuPiores", "Melhores ou piores",
                         choices = list("Melhores" = 1, "Piores" = 2), 
                         selected = 1)
        ),

        mainPanel(
           tableOutput("dfDiretores")
        )
    )
)

server <- function(input, output) {

    output$dfDiretores <- renderTable({
        filmes %>%
            filter(Year >= input$anos[1] & Year <= input$anos[2]) %>%
            filter(!is.na(Metascore)) %>%
            group_by(Director) %>%
            filter(n() >= input$qtdMinFilmes) %>%
            mutate(`Nota` = case_when(
                input$tipoNota == "1" ~ Rating,
                input$tipoNota == "2" ~ Metascore,
                input$tipoNota == "3" ~ Rating + Metascore
            )) %>%
            summarise(`Nota Média` = mean(Nota), Filmes = paste(Title, collapse = " / ")) %>%
            arrange(case_when(
                input$melhoresOuPiores == "1" ~ desc(`Nota Média`),
                input$melhoresOuPiores == "2" ~ `Nota Média`
            )) %>%
            filter(row_number() <= input$qtd)
    })
}

shinyApp(ui = ui, server = server)
