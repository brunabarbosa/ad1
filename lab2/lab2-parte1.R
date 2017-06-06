library(flexdashboard)
library(tidyverse)
library(plotly)
library(highcharter)
library(readr)


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



series_from_imdb %>%
  filter(series_name == "Dexter") %>%
  plot_ly(x = ~ series_ep, 
          y = ~ r1, 
          name = "avaliacoes",
          color = ~as.character(season), 
          text = ~Episode)

series_from_imdb %>%
  filter(series_name == "Dexter") %>%
  plot_ly(x = ~ series_ep, 
          y = ~ r1, 
          name = "avaliacoes",
          color = ~as.character(season), 
          text = ~Episode)

series_from_imdb %>%
  filter(series_name == "Dexter") %>%
  plot_ly(x = ~ series_ep, 
          y = ~ r10, 
          name = "avaliacoes",
          color = ~as.character(season), 
          text = ~Episode)


dexter <- series_from_imdb %>%
  filter(series_name == "Dexter")

p1 <- plot_ly(dexter, x = ~r1) %>% add_histogram(name = "plotly.js")
p2 <- plot_ly(dexter, x = ~r9) %>% add_histogram(name = "plotly.js")
p3 <- plot_ly(dexter, x = ~r10) %>% add_histogram(name = "plotly.js")

price_hist <- function(method = "FD") {
  h <- hist(dexter$r1, breaks = method, plot = FALSE)
  plot_ly(x = h$mids, y = h$counts) %>% add_bars(name = method)
}

subplot(
  p1, p2, p3,
  nrows = 3, shareX = TRUE
)


subplot(
  p1, price_hist(), price_hist("Sturges"),  price_hist("Scott"),
  nrows = 4, shareX = TRUE
)

price_hist
p1
 geom_line(data=dexter, aes(x = ~ series_ep, y = ~r1), color="red") 

series_from_imdb %>%
  filter(series_name == "Dexter") %>%
p <- ggplot(aes(x = ~ series_ep, y = ~r1)) +
  geom_point(aes(text = paste("Clarity:", clarity))) +
  geom_smooth(aes(colour = cut, fill = cut)) + facet_wrap(~ cut)

ggplotly(p)
  
d <- diamonds[sample(nrow(diamonds), 1000), ]
plot_ly(d, x = ~carat, y = ~price, color = ~carat,
        size = ~carat, text = ~paste("Clarity: ", clarity))

