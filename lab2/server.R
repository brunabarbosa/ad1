library(shiny)
library(plotly)
library(readr)
library(ggthemes)
library(dplyr)

series_from_imdb <- read_csv("series_from_imdb.csv")

server <- function(input, output, session) {
  
  output$plot <- renderPlotly({
    # use the key aesthetic/argument to help uniquely identify selected observations
    dexter <- series_from_imdb %>%
      filter(series_name == input$name)
    key <- row.names(dexter)
    
    p1 <- plot_ly(dexter, x = ~series_ep, y = ~r10, key = ~key, color = ~as.character(season), 
                  mode =     "lines+markers", type="scatter" ) %>%
      layout(dragmode = "select", title = "Proporcao que atribuiu nota max e min, respectivamente")
    
    
    p2 <- plot_ly(dexter, x = ~series_ep, y = ~r1, key = ~key, color = ~as.character(season), 
                  mode =     "lines+markers", type="scatter" ) %>%
      layout(dragmode = "select")
    
    p <- subplot(p1, p2, nrows = 2, margin = 0.04, heights = c(0.5, 0.5))
    
    
  })
  
  
  
}

#shinyApp(ui, server)
