#------------------------------------------------------------------------------#
#                                                                              #
#                  Engaging & Reproducible Data Visualization                  #
#                  From Theory to Implementation with ggplot2                  #
#                                                                              #
#                        Beyond the Grammar of Graphics                        #
#                                                                              #
#                              Dr. Cedric Scherer                              #
#                         NC3 Workshop // January 2024                         #
#                                                                              #
#------------------------------------------------------------------------------#


## -----------------------------------------------------------------------------
library(ggplot2)
library(dplyr)
library(stringr)

bikes <- readr::read_csv(
  "data/london-bikes-custom.csv",
  col_types = "Dcfffilllddddc"
)

theme_set(theme_light(base_size = 14, base_family = "Asap SemiCondensed"))

theme_update(
  panel.grid.minor = element_blank(),
  legend.position = "top"
)

g <- 
  ggplot(
    bikes,
    aes(x = temp, y = count,
        color = season)
  ) +
  geom_point(
    alpha = .5
  )


## -----------------------------------------------------------------------------
# install.packages("ggtext")

g +
  ggtitle("**TfL bike sharing trends by _season_**")


## -----------------------------------------------------------------------------
g +
  ggtitle("**TfL bike sharing trends by _season_**") +
  theme(
    plot.title = ggtext::element_markdown()
  )


## -----------------------------------------------------------------------------
g +
  ggtitle("<i style='font-family:times;font-size:30pt;'>TfL</i> bike sharing trends by <b style='color:#28a87d;'>season</b>") +
  theme(
    plot.title = ggtext::element_markdown()
  )


## -----------------------------------------------------------------------------
ga <- 
  ggplot(bikes, 
         aes(x = temp, y = count)) +
  geom_point(
    aes(color = count > 40000),
    size = 2
  ) +
  scale_color_manual(
    values = c("grey", "firebrick"),
    guide = "none"
  )

ga


## -----------------------------------------------------------------------------
ga +
  annotate(
    geom = "text",
    x = 18,
    y = 48000,
    label = "What happened here?"
  )


## -----------------------------------------------------------------------------
ga +
  annotate(
    geom = "text",
    x = 18,
    y = 48000,
    label = "What happened here?",
    color = "firebrick",
    size = 6,
    family = "Asap SemiCondensed",
    fontface = "bold",
    lineheight =  .8
  )


## -----------------------------------------------------------------------------
ga +
  annotate(
    geom = "text",
    x = c(18, max(bikes$temp)),
    y = c(48000, 1000),
    label = c("What happened here?", "Powered by TfL"),
    color = c("firebrick", "black"),
    size = c(6, 3),
    family = c("Asap SemiCondensed", "Hepta Slab"),
    fontface = c("bold", "plain"),
    hjust = c(.5, 1)
  )


## -----------------------------------------------------------------------------
# ggannotate::ggannotate(g)


## -----------------------------------------------------------------------------
ga +
  annotate(
    geom = "text",
    x = 10,
    y = 38000,
    label = "The\nhighest\ncount",
    family = "Asap SemiCondensed",
    size = 6,
    lineheight =  .8
  ) +
  annotate(
    geom = "segment",
    x = 13, 
    xend = 18.2,
    y = 38000, 
    yend = 51870
  )


## -----------------------------------------------------------------------------
ga +
  annotate(
    geom = "text",
    x = 10,
    y = 38000,
    label = "The\nhighest\ncount",
    family = "Asap SemiCondensed",
    size = 6,
    lineheight =  .8
  ) +
  annotate(
    geom = "curve",
    x = 13, 
    xend = 18.2,
    y = 38000, 
    yend = 51870
  )


## -----------------------------------------------------------------------------
ga +
  annotate(
    geom = "text",
    x = 10,
    y = 38000,
    label = "The\nhighest\ncount",
    family = "Asap SemiCondensed",
    size = 6,
    lineheight =  .8
  ) +
  annotate(
    geom = "curve",
    x = 13, 
    xend = 18.2,
    y = 38000, 
    yend = 51870,
    curvature = .25,
    arrow = arrow()
  )


## -----------------------------------------------------------------------------
ga +
  annotate(
    geom = "text",
    x = 10,
    y = 38000,
    label = "The\nhighest\ncount",
    family = "Asap SemiCondensed",
    size = 6,
    lineheight =  .8
  ) +
  annotate(
    geom = "curve",
    x = 13, 
    xend = 18.2,
    y = 38000, 
    yend = 51870,
    curvature = .25,
    arrow = arrow(
      length = unit(10, "pt"),
      type = "closed",
      ends = "both"
    )
  )


## -----------------------------------------------------------------------------
ga +
  annotate(
    geom = "text",
    x = 10,
    y = 38000,
    label = "The\nhighest\ncount",
    family = "Asap SemiCondensed",
    size = 6,
    lineheight =  .8
  ) +
  annotate(
    geom = "curve",
    x = 13, 
    xend = 18.2,
    y = 38000, 
    yend = 51870,
    curvature = .8,
    angle = 130,
    arrow = arrow(
      length = unit(10, "pt"),
      type = "closed"
    )
  )


## -----------------------------------------------------------------------------
g +
  ggforce::geom_mark_rect(
    aes(label = "Outliers?",
        filter = count > 40000)
  )


## -----------------------------------------------------------------------------
g +
  ggforce::geom_mark_rect(
    aes(label = "Outliers?",
        filter = count > 40000),
    color = "black",
    label.family = "Asap SemiCondensed"
  )


## -----------------------------------------------------------------------------
g +
  ggforce::geom_mark_rect(
    aes(label = "Outliers?",
        filter = count > 40000),
    description = "What happened on\nthese two days?",
    color = "black",
    label.family = "Asap SemiCondensed"
  )


## -----------------------------------------------------------------------------
g +
  ggforce::geom_mark_rect(
    aes(label = "Outliers?",
        filter = count > 40000),
    description = "What happened on\nthese two days?",
    color = "black",
    label.family = "Asap SemiCondensed",
    expand = unit(8, "pt"),
    radius = unit(12, "pt"),
    con.cap = unit(0, "pt"),
    label.buffer = unit(15, "pt"),
    con.type = "straight",
    label.fill = "transparent"
  )


## -----------------------------------------------------------------------------
g +
  ggforce::geom_mark_circle(
    aes(label = "Outliers?",
        filter = count > 40000),
    description = "What happened on\nthese two days?",
    color = "black",
    label.family = "Asap SemiCondensed",
    expand = unit(8, "pt"),
    con.cap = unit(0, "pt"),
    label.buffer = unit(15, "pt"),
    con.type = "straight",
    label.fill = "transparent"
  )


## -----------------------------------------------------------------------------
g +
  ggforce::geom_mark_hull(
    aes(label = "Outliers?",
        filter = count > 40000),
    description = "What happened on\nthese two days?",
    color = "black",
    label.family = "Asap SemiCondensed",
    expand = unit(8, "pt"),
    con.cap = unit(0, "pt"),
    label.buffer = unit(15, "pt"),
    con.type = "straight",
    label.fill = "transparent"
  )


## -----------------------------------------------------------------------------
bikes |>
  filter(year == "2016") |>
  group_by(month, day_night) |> 
  summarize(count = sum(count)) |> 
  ggplot(aes(x = month, y = count, 
             color = day_night,
             group = day_night)) +
  geom_line(linewidth = 1) +
  coord_cartesian(expand = FALSE) +
  scale_y_continuous(
    labels = scales::label_comma(
      scale = 1/10^3, suffix = "K"
    ),
    limits = c(0, 850000)
  ) +
  scale_color_manual(
    values = c("#FFA200", "#757BC7"),
    name = NULL
  )


## -----------------------------------------------------------------------------
bikes |>
  filter(year == "2016") |>
  group_by(month, day_night) |> 
  summarize(count = sum(count)) |> 
  ggplot(aes(x = month, y = count, 
             color = day_night,
             group = day_night)) +
  geomtextpath::geom_textline(
    aes(label = day_night),
    linewidth = 1,
    vjust = -.5, 
    family = "Asap SemiCondensed",
    fontface = "bold"
  ) +
  coord_cartesian(expand = FALSE) +
  scale_y_continuous(
    labels = scales::label_comma(
      scale = 1/10^3, suffix = "K"
    ),
    limits = c(0, 850000)
  ) +
  scale_color_manual(
    values = c("#FFA200", "#757BC7"),
    guide = "none"
  )


## -----------------------------------------------------------------------------
bikes |>
  filter(year == "2016") |>
  group_by(month, day_night) |> 
  summarize(count = sum(count)) |> 
  mutate(day_night = if_else(
    day_night == "day", 
    "Day period (6am-6pm)", 
    "Night period (6pm-6am)"
  )) |> 
  ggplot(aes(x = month, y = count, 
             color = day_night,
             group = day_night)) +
  geomtextpath::geom_textline(
    aes(label = day_night),
    linewidth = 1,
    vjust = -.5, 
    hjust = .05,
    family = "Asap SemiCondensed",
    fontface = "bold"
  ) +
  coord_cartesian(expand = FALSE) +
  scale_y_continuous(
    labels = scales::label_comma(
      scale = 1/10^3, suffix = "K"
    ),
    limits = c(0, 850000)
  ) +
  scale_color_manual(
    values = c("#FFA200", "#757BC7"),
    guide = "none"
  )


## -----------------------------------------------------------------------------
theme_set(theme_minimal(base_size = 18, base_family = "Pally"))
theme_update(
  text = element_text(family = "Pally"),
  panel.grid = element_blank(),
  axis.text = element_text(color = "grey50", size = 12),
  axis.title = element_text(color = "grey40", face = "bold"),
  axis.title.x = element_text(margin = margin(t = 12)),
  axis.title.y = element_text(margin = margin(r = 12)),
  axis.line = element_line(color = "grey80", size = .4),
  legend.text = element_text(color = "grey50", size = 12),
  plot.tag = element_text(size = 40, margin = margin(b = 15)),
  plot.background = element_rect(fill = "white", color = "white")
)

bikes_sorted <-
  bikes %>%
  filter(!is.na(weather_type)) %>%
  group_by(weather_type) %>%
  mutate(sum = sum(count)) %>%
  ungroup() %>%
  mutate(
    weather_type = forcats::fct_reorder(
      str_to_title(str_wrap(weather_type, 5)), sum
    )
  )


## -----------------------------------------------------------------------------
p1 <- ggplot(
    bikes_sorted,
    aes(x = weather_type, y = count, color = weather_type)
  ) +
  geom_hline(yintercept = 0, color = "grey80", size = .4) +
  stat_summary(
    geom = "point", fun = "sum", size = 12
  ) +
  stat_summary(
    geom = "linerange", ymin = 0, fun.max = function(y) sum(y),
    size = 2, show.legend = FALSE
  ) +
  coord_flip(ylim = c(0, NA), clip = "off") +
  scale_y_continuous(
    expand = c(0, 0), limits = c(0, 8500000),
    labels = scales::comma_format(scale = .0001, suffix = "K")
  ) +
  scale_color_viridis_d(
    option = "magma", direction = -1, begin = .1, end = .9, name = NULL,
    guide = guide_legend(override.aes = list(size = 7))
  ) +
  labs(
    x = NULL, y = "Sum of reported bike shares", tag = "P1",
  ) +
  theme(
    axis.line.y = element_blank(),
    axis.text.y = element_text(family = "Pally", color = "grey50", face = "bold",
                               margin = margin(r = 15), lineheight = .9)
  )

p1


## -----------------------------------------------------------------------------
p2 <- bikes_sorted %>%
  filter(season == "winter", is_weekend == TRUE, day_night == "night") %>%
  group_by(weather_type, .drop = FALSE) %>%
  mutate(id = row_number()) %>%
  ggplot(
      aes(x = weather_type, y = id, color = weather_type)
    ) +
    geom_point(size = 4.5) +
    scale_color_viridis_d(
      option = "magma", direction = -1, begin = .1, end = .9, name = NULL,
      guide = guide_legend(override.aes = list(size = 7))
    ) +
    labs(
      x = NULL, y = "Reported bike shares on\nweekend winter nights", tag = "P2",
    ) +
    coord_cartesian(ylim = c(.5, NA), clip = "off")

p2


## -----------------------------------------------------------------------------
my_colors <- c("#cc0000", "#000080")

p3 <- bikes %>%
  group_by(week = lubridate::week(date), day_night, year) %>%
  summarize(count = sum(count)) %>%
  group_by(week, day_night) %>%
  mutate(avg = mean(count)) %>%
  ggplot(aes(x = week, y = count, group = interaction(day_night, year))) +
    geom_line(color = "grey65", size = 1) +
    geom_line(aes(y = avg, color = day_night), stat = "unique", size = 1.7) +
    annotate(
      geom = "text", label = c("Day", "Night"), color = my_colors,
      x = c(5, 18), y = c(125000, 29000), size = 8, fontface = "bold", family = "Pally"
    ) +
    scale_x_continuous(breaks = c(1, 1:10*5)) +
    scale_y_continuous(labels = scales::comma_format()) +
    scale_color_manual(values = my_colors, guide = "none") +
    labs(
      x = "Week of the Year", y = "Reported bike shares\n(cumulative # per week)", tag = "P3",
    )

p3


## -----------------------------------------------------------------------------
library(patchwork)
(p1 + p2) / p3


## -----------------------------------------------------------------------------
(p1 + p2) / p3 + plot_layout(guides = "collect")


## -----------------------------------------------------------------------------
((p1 + p2) / p3 & theme(legend.justification = "top")) + plot_layout(guides = "collect")


## -----------------------------------------------------------------------------
(p1 + p2) / p3 & theme(legend.position = "none", plot.background = element_rect(color = "black", size = 3))


## -----------------------------------------------------------------------------
((p1 + p2) / p3 & theme(legend.position = "none")) +
  plot_layout(heights = c(.2, .1), widths = c(2, 1))


## -----------------------------------------------------------------------------
picasso <- "
AAAAAA#BBBB
CCCCCCCCC##
CCCCCCCCC##"
(p1 + p2 + p3 & theme(legend.position = "none")) + plot_layout(design = picasso)


## -----------------------------------------------------------------------------
pl1 <- p1 + labs(tag = NULL, title = "Plot One") + theme(legend.position = "none")
pl2 <- p2 + labs(tag = NULL, title = "Plot Two") + theme(legend.position = "none")
pl3 <- p3 + labs(tag = NULL, title = "Plot Three") + theme(legend.position = "none")

(pl1 + pl2) / pl3 +
  plot_annotation(tag_levels = "1", tag_prefix = "P", title = "An overarching title for all 3 plots, placed on the very top while all other titles are sitting below the tags.")


## -----------------------------------------------------------------------------
text <- tibble(
  x = 0, y = 0, label = "Lorem ipsum dolor sit amet, **consectetur adipiscing elit**, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation <b style='color:#000080;'>ullamco laboris nisi</b> ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat <b style='color:#cc0000;'>cupidatat non proident</b>, sunt in culpa qui officia deserunt mollit anim id est laborum."
)

pt <- ggplot(text, aes(x = x, y = y)) +
  ggtext::geom_textbox(
    aes(label = label),
    box.color = NA, width = unit(23, "lines"),
    family = "Pally", color = "grey40", size = 6.5, lineheight = 1.4
  ) +
  coord_cartesian(expand = FALSE, clip = "off") +
  theme_void()

pt


## -----------------------------------------------------------------------------
(p1 + pt) / p3


## -----------------------------------------------------------------------------
pl1 + inset_element(pl2, l = .6, b = .1, r = 1, t = .6)


## -----------------------------------------------------------------------------
pl1 + inset_element(pl2, l = .6, b = 0, r = 1, t = .5, align_to = 'full')


## -----------------------------------------------------------------------------
(pl1 + inset_element(pl2, l = .6, b = .1, r = 1, t = .6) + pt) / pl3


## -----------------------------------------------------------------------------
theme_set(theme_minimal(base_size = 14, base_family = "Asap SemiCondensed"))

theme_update(
  panel.grid.minor = element_blank(),
  legend.position = "top"
)


## -----------------------------------------------------------------------------
smooth <- TRUE

ggplot(bikes, aes(x = temp, y = humidity)) +
  { if(smooth) geom_smooth(color = "red") } +
  geom_point(alpha = .5)


## -----------------------------------------------------------------------------
smooth <- FALSE

ggplot(bikes, aes(x = temp, y = humidity)) +
  { if(smooth) geom_smooth(color = "red") } +
  geom_point(alpha = .5)


## -----------------------------------------------------------------------------
draw_scatter <- function(smooth = TRUE) {
  ggplot(bikes, aes(x = temp, y = humidity)) +
    { if(smooth) geom_smooth(color = "red") } +
    geom_point(alpha = .5)
}


## -----------------------------------------------------------------------------
draw_scatter()


## -----------------------------------------------------------------------------
draw_scatter(smooth = FALSE)


## -----------------------------------------------------------------------------
geom_scatterfit <- function(pointsize = 1, pointalpha = 1, 
                            method = "lm", linecolor = "red", ...) {
  list(
    geom_point(size = pointsize, alpha = pointalpha, ...),
    geom_smooth(method = method, color = linecolor, ...)
  )
}


## -----------------------------------------------------------------------------
ggplot(bikes,
       aes(x = humidity, y = count)) +
  geom_scatterfit()


## -----------------------------------------------------------------------------
ggplot(bikes,
       aes(x = humidity, y = count)) +
  geom_scatterfit(
    color = "#28A87D", 
    linewidth = 3
  )


## -----------------------------------------------------------------------------
ggplot(diamonds, 
       aes(x = carat, y = price)) +
  geom_scatterfit(
    pointsize = .5, 
    pointalpha = .1,
    method = "gam",
    linecolor = "#EFAC00"
  )


## -----------------------------------------------------------------------------
scales_log <- function(sides = "xy") {
  list(
    if(stringr::str_detect(sides, "x")) {
      scale_x_log10(
        breaks = c(10^(1:100)), labels = scales::label_log()
      )
    },
    if(stringr::str_detect(sides, "y")) {
      scale_y_log10(
        breaks = c(10^(1:100)), labels = scales::label_log()
      )
    }
  )
}


## -----------------------------------------------------------------------------
ggplot(diamonds, 
       aes(x = carat, y = price)) +
  geom_scatterfit(
    pointsize = .5, 
    pointalpha = .1,
    method = "gam",
    linecolor = "#EFAC00"
  ) +
  scales_log(sides = "y")


## -----------------------------------------------------------------------------
trends_monthly <- function(grp = "January") {
  bikes |> 
    dplyr::mutate(month = lubridate::month(date, label = TRUE, abbr = FALSE)) |> 
    dplyr::filter(month %in% grp) |> 
    ggplot(aes(x = temp, y = count, color = day_night)) +
    geom_point(alpha = .2, show.legend = FALSE) +
    geom_smooth(se = FALSE) +
    scale_color_manual(values = c("#FFA200", "#757bc7")) +
    labs(title = grp, x = "Temperature", y = "Bike shares", color = NULL)
}

trends_monthly("July")


## -----------------------------------------------------------------------------
trends_monthly <- function(grp = "January") {
  bikes |> 
    dplyr::mutate(month = lubridate::month(date, label = TRUE, abbr = FALSE)) |> 
    dplyr::filter(month %in% grp) |> 
    ggplot(aes(x = temp, y = count, color = day_night)) +
    geom_point(alpha = .2, show.legend = FALSE) +
    geom_smooth(se = FALSE) +
    # keep axis ranges consistent
    scale_x_continuous(limits = range(bikes$temp)) +
    scale_y_continuous(limits = range(bikes$count)) +
    scale_color_manual(values = c("#FFA200", "#757bc7")) +
    labs(title = grp, x = "Temperature", y = "Bike shares", color = NULL)
}

trends_monthly("July")


## -----------------------------------------------------------------------------
plots <- purrr::map(month.name[1:12], trends_monthly) ## also: ~ trends_monthly(.x)
plots[[9]]


## -----------------------------------------------------------------------------
plots <- purrr::map(month.name[1:12], trends_monthly) ## also: ~ trends_monthly(.x)
patchwork::wrap_plots(plots)


## -----------------------------------------------------------------------------
plot_density <- function(data, var, grp = "") {
  ggplot(data, aes(x = !!sym(var))) +
    geom_density(aes(fill = !!sym(grp)), position = "identity",
                 color = "grey30", alpha = .3) +
    coord_cartesian(expand = FALSE, clip = "off") +
    scale_y_continuous(labels = scales::label_number()) +
    scale_fill_brewer(palette = "Dark2", name = NULL) +
    theme(legend.position = "top")
}

plot_density(
  bikes, "count"
)


## -----------------------------------------------------------------------------
plots <- purrr::map(
  c("count", "temp", "humidity", "wind_speed"), 
  ~ plot_density(data = bikes, var = .x, grp = "day_night")
)
patchwork::wrap_plots(plots, nrow = 1)


## -----------------------------------------------------------------------------
plots <- purrr::map(
  c("sleep_total", "sleep_rem", "sleep_cycle"), 
  ~ plot_density(data = dplyr::filter(msleep, !is.na(vore)), var = .x, grp = "vore")
)
patchwork::wrap_plots(plots, nrow = 1)


## -----------------------------------------------------------------------------
plots <- purrr::map(
  names(dplyr::select(midwest, where(is.numeric))),
  ~plot_density(data = midwest, var = .x)
)
patchwork::wrap_plots(plots)


## -----------------------------------------------------------------------------
## EXERCISES

## Exercise 1
##
##   -  Take a look at the visualization of counts per weather type.
##       -  For each group of text labels, note how one would add and modify them.
##       -  Discuss how to automate the placement of the labels in- and outside 
##          of the bars.
##   -  A copy of the graphic is provided in the "plots" folder.


## Exercise 1
##
##   -  Create the penguins multi-panel graphic, as close as possible.
##   -  A copy of the graphic is provided in the "plots" folder.


## Exercise 3
##
##   -  Create a function that plots the famous Gapminder chart, highlighting 
##      one of the continents.
##       -  Extend the following code in to annotate a continent your choice of 
##          with {ggforce}.
##       -  Turn the code into a function with the utility to annotate any 
##          continent.
##       -  Optional: Create a second function to highlight a country.

library(gapminder)
library(dplyr)
library(ggplot2)

gm2007 <- filter(gapminder, year == 2007)

ggplot(gm2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(
    aes(size = pop), alpha = .5
  ) +
  scale_x_log10(
    breaks = c(500, 2000, 8000, 32000),
    labels = scales::label_dollar(accuracy = 1)
  ) +
  scale_size(
    range = c(1, 12), name = "Population:", 
    breaks = c(10, 100, 1000)*1000000, 
    labels = scales::label_comma(scale = 1 / 10^6, suffix = "M")
  ) +
  labs(x = "GDP per capita", y = "Life expectancy") +
  theme_minimal(base_family = "Spline Sans", base_size = 15) +
  theme(panel.grid.minor = element_blank())

