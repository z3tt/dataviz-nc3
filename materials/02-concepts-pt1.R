#------------------------------------------------------------------------------#
#                                                                              #
#                  Engaging & Reproducible Data Visualization                  #
#                  From Theory to Implementation with ggplot2                  #
#                                                                              #
#              Concepts of the Layered Grammar of Graphics (Pt. 1)             #
#                                                                              #
#                              Dr. Cedric Scherer                              #
#                         NC3 Workshop // January 2024                         #
#                                                                              #
#------------------------------------------------------------------------------#


## -----------------------------------------------------------------------------
# install.packages("ggplot2")
library(ggplot2)


## -----------------------------------------------------------------------------
# install.packages("tidyverse")
# library(tidyverse)


## -----------------------------------------------------------------------------
bikes <- readr::read_csv(
  "data/london-bikes-custom.csv",
  # here::here("data", "london-bikes-custom.csv"),
  # "https://cedricscherer.com/data/london-bikes-custom.csv",
  col_types = "Dcfffilllddddc"
)


## -----------------------------------------------------------------------------
?ggplot


## -----------------------------------------------------------------------------
ggplot(data = bikes)


## -----------------------------------------------------------------------------
ggplot(data = bikes) +
  aes(x = temp, y = count)


## -----------------------------------------------------------------------------
ggplot(data = bikes) +
  aes(x = temp, y = count)


## -----------------------------------------------------------------------------
ggplot(data = bikes, mapping = aes(x = temp, y = count))


## -----------------------------------------------------------------------------
ggplot(bikes, aes(temp, count))


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = temp, y = count))


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_point()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_point(
    color = "#28a87d",
    alpha = .5,
    shape = "X",
    stroke = 1,
    size = 4
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_point(
    color = "#28a87d",
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_point(
    aes(color = season),
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_point(
    aes(color = temp > 20),
    alpha = .5
  )


## -----------------------------------------------------------------------------
## EXERCISE
##
##   -  Explore the `mpg` data set that is contained in {ggplot2}.
##   -  Create a scatter plot of city miles per gallon vs displacement.
##       -  Map the color of the points to the class.
##       -  Turn the points into larger, semi-transparent diamonds.
##       -  Now, use color to indicate if the model is an SUV or not
##       -  Bonus: How could you highlight SUVs and pick-ups together?
##       -  Bonus: What if we only want to show data from 2008?


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = humidity)
  ) +
  geom_histogram()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = humidity)
  ) +
  geom_histogram(
    bins = 100 
    # binwidth = 1
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = humidity)
  ) +
  geom_histogram(
    aes(fill = day_night)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = humidity)
  ) +
  geom_density(
    aes(color = day_night)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = humidity)
  ) +
  geom_density(
    aes(color = day_night,
        fill = day_night),
    alpha = .3
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = humidity)
  ) +
  geom_density(
    aes(color = day_night,
        fill = day_night),
    alpha = .3,
    position = "stack"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = humidity)
  ) +
  geom_density(
    aes(color = day_night,
        fill = day_night),
    alpha = .3,
    position = "fill"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp, y = count)
  ) +
  geom_point()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_bin2d()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_hex()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_density2d()


## -----------------------------------------------------------------------------
ggplot(
  bikes,
  aes(x = temp, y = count)
) +
  geom_density2d(
    aes(color = day_night)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = temp)
  ) +
  geom_density2d_filled()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_point(
    aes(color = season),
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count,
        color = season)
  ) +
  geom_point(
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count,
        color = season)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count,
        color = season)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_point(
    aes(color = season),
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_point(
    aes(color = season),
    alpha = .5
  ) +
  geom_smooth(
    aes(group = day_night),
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count,
        color = season,
        group = day_night)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count,
        color = season,
        group = day_night)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm",
    color = "black"
  )


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = date, y = temp)) +
  geom_point(stat = "identity") # default


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = date, y = temp)) +
  stat_identity(geom = "point") # default


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = weather_type)) +
  geom_bar(stat = "count") # default


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = weather_type)) +
  stat_count(geom = "bar") # default


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = temp, y = count)) +
  geom_smooth(stat = "smooth") # default


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = temp, y = count)) +
  stat_smooth(geom = "smooth") # default


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp)
  ) +
  stat_summary() 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp)
  ) +
  stat_summary(
    fun.data = mean_se, # default
    geom = "pointrange"  # default
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp)
  ) +
  geom_boxplot() +
  stat_summary(
    fun = mean,
    geom = "point",
    color = "#28a87d",
    size = 3
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp)
  ) +
  stat_summary(
    fun = mean, 
    fun.max = function(y) mean(y) + sd(y), 
    fun.min = function(y) mean(y) - sd(y) 
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp)
  ) +
  stat_summary(
    fun = mean, 
    fun.max = function(foo) mean(foo) + sd(foo), 
    fun.min = function(foo) mean(foo) - sd(foo)
  ) 


## -----------------------------------------------------------------------------
ggplot(
  bikes, 
  aes(x = season, y = temp)
) +
  stat_summary(
    fun.data = mean_sdl, 
    fun.args = list(mult = 1)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp)
  ) +
  stat_summary(
    geom = "errorbar", 
    fun.max = function(y) mean(y) + sd(y), 
    fun.min = function(y) mean(y) - sd(y),
    width = .3
  ) +
  stat_summary(
    geom = "point",
    fun = mean,
    size = 2
  ) 


## -----------------------------------------------------------------------------
ggplot(
  bikes, 
  aes(x = season, y = temp)
) +
  stat_summary(
    geom = "errorbar", 
    fun.max = function(y) mean(y) + sd(y), 
    fun.min = function(y) mean(y) - sd(y),
    width = .3
  ) +
  stat_summary(
    geom = "point",
    fun = mean,
    size = 2
  ) +
  stat_summary(
    geom = "text",
    fun = mean,
    aes(label = after_stat(y))
  ) 


## -----------------------------------------------------------------------------
ggplot(
  bikes, 
  aes(x = season, y = temp)
) +
  stat_summary(
    geom = "errorbar", 
    fun.max = function(y) mean(y) + sd(y), 
    fun.min = function(y) mean(y) - sd(y),
    width = .3
  ) +
  stat_summary(
    geom = "point",
    fun = mean,
    size = 2
  ) +
  stat_summary(
    geom = "text",
    fun = mean,
    aes(label = after_stat(
      sprintf("%2.1f", y)
    )),
    hjust = -.3
  ) 


## -----------------------------------------------------------------------------
ggplot(
  bikes, 
  aes(x = season,  
      y = weather_type, 
      z = count)
  ) +
  stat_summary_2d() 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season,  
        y = weather_type, 
        z = count)
  ) +
  stat_summary_2d(
    geom = "tile", 
    fun = "sum", 
    color = "white", 
    linewidth = .7
  ) 


## -----------------------------------------------------------------------------
g <-
  ggplot(
    bikes,
    aes(x = temp, y = count,
        color = season,
        group = day_night)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm",
    color = "black"
  )

class(g)


## -----------------------------------------------------------------------------
g$data


## -----------------------------------------------------------------------------
g$mapping


## -----------------------------------------------------------------------------
gbuilt <- ggplot_build(g)
names(gbuilt)

head(gbuilt$data[[1]])

head(gbuilt$data[[2]])


## -----------------------------------------------------------------------------
g +
  geom_rug(
    alpha = .2
  )


## -----------------------------------------------------------------------------
g +
  geom_rug(
    alpha = .2,
    show.legend = FALSE
  )


## -----------------------------------------------------------------------------
g +
  xlab("Temperature (°C)") +
  ylab("Reported bike shares") +
  ggtitle("TfL bike sharing trends")


## -----------------------------------------------------------------------------
g +
  labs(
    x = "Temperature (°C)",
    y = "Reported bike shares",
    title = "TfL bike sharing trends"
  )


## -----------------------------------------------------------------------------
g <- g +
  labs(
    x = "Temperature (°C)",
    y = "Reported bike shares",
    title = "TfL bike sharing trends",
    color = "Season:"
  )

g


## -----------------------------------------------------------------------------
g +
  labs(
    x = "Temperature (°C)",
    y = "Reported bike shares",
    title = "TfL bike sharing trends",
    subtitle = "Reported bike rents versus temperature in London",
    caption = "Data: TfL",
    color = "Season:",
    tag = "Fig. 1"
  )


## -----------------------------------------------------------------------------
g +
  labs(
    x = "",
    caption = "Data: TfL"
  )


## -----------------------------------------------------------------------------
g +
  labs(
    x = NULL,
    caption = "Data: TfL"
  )


## -----------------------------------------------------------------------------
g + theme_light()


## -----------------------------------------------------------------------------
g + theme_minimal()


## -----------------------------------------------------------------------------
g + theme_light(
  base_size = 14,
  base_family = "Asap SemiCondensed"
)


## -----------------------------------------------------------------------------
theme_set(theme_light())

g


## -----------------------------------------------------------------------------
theme_set(theme_light(
  base_size = 14,
  base_family = "Asap SemiCondensed"
))

g


## -----------------------------------------------------------------------------

library(systemfonts)


## -----------------------------------------------------------------------------

match_font("Asap", bold = TRUE)


## -----------------------------------------------------------------------------

system_fonts()


## -----------------------------------------------------------------------------

system_fonts() |>
  dplyr::filter(stringr::str_detect(family, "Asap")) |>
  dplyr::select(family) |>
  unique() |> 
  dplyr::arrange(family)


## -----------------------------------------------------------------------------

g +
  theme_minimal(
    base_family = "Asap SemiCondensed",
    base_size = 13
  )


## -----------------------------------------------------------------------------

system_fonts() |>
  dplyr::filter(family == "Asap SemiCondensed") |>
  dplyr::select(name) |>
  dplyr::arrange(name)


## -----------------------------------------------------------------------------

register_variant(
  name = "Asap SemiCondensed Semibold S1",
  family = "Asap SemiCondensed",
  weight = "semibold",
  features = font_feature(letters = "stylistic")
)


## -----------------------------------------------------------------------------

g + 
  theme_minimal(
    base_family = "Asap SemiCondensed Semibold S1",
    base_size = 13
  )


## -----------------------------------------------------------------------------

register_variant(
  name = "Spline Sans Tabular",
  family = "Spline Sans",
  weight = "normal",
  features = font_feature(numbers = "tabular")
)


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank()
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold")
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    legend.position = "top"
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    legend.position = "none"
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    legend.position = "top",
    plot.title.position = "plot"
  )


## -----------------------------------------------------------------------------
theme_update(
  panel.grid.minor = element_blank(),
  plot.title = element_text(face = "bold"),
  legend.position = "top",
  plot.title.position = "plot"
)

g


## -----------------------------------------------------------------------------
# ggsave(g, filename = "my_plot.png")


## -----------------------------------------------------------------------------
# ggsave("my_plot.png")


## -----------------------------------------------------------------------------
# ggsave("my_plot.png", width = 8, height = 5, dpi = 600)


## -----------------------------------------------------------------------------
# ggsave("my_plot.pdf", width = 20, height = 12, unit = "cm", device = cairo_pdf)


## -----------------------------------------------------------------------------
# grDevices::cairo_pdf("my_plot.pdf", width = 10, height = 7)
# g
# dev.off()



## -----------------------------------------------------------------------------
## EXERCISES 

## Exercise 1
##
##   -  Explore the TfL bike share data visually:  
##      create a timeseries of reported bike shares on weekend days
##       -  Highlight day and night encoded by colors and shapes.
##       -  Connect the points of each period with lines.
##       -  What is the difference between `geom_line()` and `geom_path()`?
##       -  Apply your favorite theme to the plot.
##       -  Add meaningful labels.
##       -  Save the plot as a vector graphic with a decent plot size.


## Exercise 2
##
##   -  Explore the TfL bike sharing data visually:
##      create a boxplot of counts per weather type.
##       -  Turn the plot into a jitter strips plot (random noise across the 
##          x-axis).
##       -  Combine both chart types (jittered points on top of the boxplots).
##       -  Bonus: Sort the boxplot-jitter hybrid by median counts.
##       -  Apply your favorite theme to the plot.
##       -  Add meaningful labels.
##       -  Bonus: Explore other chart types to visualize the distributions.
##       -  Save the plot as a vector graphic with a decent plot size.

