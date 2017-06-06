library(flexdashboard)
library(tidyverse)
library(plotly)
library(highcharter)
library(readr)
library(dplyr)


series_from_imdb <- read_csv("~/Documents/ad1/lab2/series_from_imdb.csv")




series_from_imdb %>%
  filter(series_name == "Dexter") %>%
  plot_ly(x = ~ series_ep, 
          y = ~ r1, 
          name = "avaliacoes",
          color = ~as.character(season), 
          text = ~Episode) %>% 
  add_trace(y = ~ UserRating, 
            type = "scatter",
            mode = "lines+markers",
            color = ~as.character(season),
            line = list(width = 1), 
            hoverinfo = "text")



p1 <- plot_ly(data = series_from_imdb %>%
          filter(series_name == "Dexter"),
        x = ~series_ep,
        y = ~r1,
        name = "Nota Min",
        type = "scatter") %>%
        add_trace(y = ~ r1, 
        type = "scatter",
        mode = "lines+markers",
        color = ~as.character(season),
        line = list(width = 1), 
        hoverinfo = "text")

p3 <- plot_ly(data = series_from_imdb %>%
            filter(series_name == "Dexter"),
            x = ~series_ep,
            y = ~r10,
            name = "Nota Max",
            type = "scatter") %>%
            add_trace(y = ~ r10, 
            type = "scatter",
            mode = "lines+markers",
            color = ~as.character(season),
            line = list(width = 1), 
            hoverinfo = "text")

subplot(
  p1, p3,
  nrows = 2, shareX = TRUE
)






