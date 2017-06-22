library(shiny)
library(plotly)
library(readr)
library(ggthemes)
library(dplyr)

#series_from_imdb <- read_csv("series_from_imdb.csv")


ui <- fluidPage(
  mainPanel(
    h3("É comum o ultimo episodio de uma serie receber notas maximas? É comum o episodio piloto de uma serie receber uma maior quantidade de notas minimas? "),
    br(),
    p("Para isso vamos analisar a proporcao de notas minimas e maximas atribuidas a cada episodio pelos usuarios.
      "),
  radioButtons("name", "Plot Type:", choices = c("Dexter", 
                                                 "Mr Robot",
                                                 "Sense8",
                                                 "Black Mirror",
                                                 "Breaking Bad",
                                                 "House of Cards",
                                                 "Stranger Things",
                                                 "Daredevil",
                                                 "Game of Thrones")),
  plotlyOutput("plot")
  
 
  )
)
