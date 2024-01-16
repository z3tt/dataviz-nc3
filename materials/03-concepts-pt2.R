#------------------------------------------------------------------------------#
#                                                                              #
#                  Engaging & Reproducible Data Visualization                  #
#                  From Theory to Implementation with ggplot2                  #
#                                                                              #
#              Concepts of the Layered Grammar of Graphics (Pt. 2)             #
#                                                                              #
#                              Dr. Cedric Scherer                              #
#                         NC3 Workshop // January 2024                         #
#                                                                              #
#------------------------------------------------------------------------------#


## -----------------------------------------------------------------------------
library(ggplot2)
library(dplyr)
bikes <- readr::read_csv(
  "data/london-bikes-custom.csv",
  col_types = "Dcfffilllddddc"
)

theme_set(theme_light(base_size = 14, base_family = "Asap SemiCondensed"))

theme_update(
  panel.grid.minor = element_blank(),
  plot.title = element_text(face = "bold"),
  legend.position = "top",
  plot.title.position = "plot"
)


## -----------------------------------------------------------------------------
g <-
  ggplot(
    bikes,
    aes(x = temp, y = count,
        color = season)
  ) +
  geom_point(
    alpha = .3,
    guide = "none"
  )

g


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    vars(day_night)
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ day_night
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ is_workday + day_night,
    labeller = label_both
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ is_workday + day_night,
    labeller = labeller(
      day_night = stringr::str_to_title,
      is_workday = label_both
    )
  )


## -----------------------------------------------------------------------------
codes <- c(
  `TRUE` = "Workday",
  `FALSE` = "Weekend or Holiday"
)

g +
  facet_wrap(
    ~ is_workday + day_night,
    labeller = labeller(
      day_night = stringr::str_to_title,
      is_workday = codes
    )
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ is_workday + day_night,
    labeller = labeller(
      .default = stringr::str_to_title,
      is_workday = codes
    )
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ day_night,
    ncol = 1
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ day_night,
    ncol = 1,
    scales = "free"
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ day_night,
    ncol = 1,
    scales = "free_y"
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ day_night,
    ncol = 1,
    switch = "x"
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    rows = vars(day_night),
    cols = vars(is_weekend)
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_weekend
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_weekend + is_holiday
  )


## -----------------------------------------------------------------------------
codes_weekend <- c(
  `TRUE` = "Weekend",
  `FALSE` = "No weekend"
)

codes_holiday <- c(
  `TRUE` = "Holiday",
  `FALSE` = "No holiday"
)

g +
  facet_grid(
    day_night ~ is_weekend + is_holiday,
    labeller = labeller(
      day_night = stringr::str_to_title,
      is_weekend = codes_weekend,
      is_holiday = codes_holiday
    )
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_weekend,
    scales = "free"
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_weekend,
    scales = "free",
    switch = "y"
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_weekend,
    scales = "free",
    space = "free"
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_weekend,
    scales = "free_y",
    space = "free_y"
  )


## -----------------------------------------------------------------------------
ggplot(
  bikes,
  aes(x = temp, y = count)
) +
geom_point(
  data = dplyr::select(
    bikes, temp, count
  ), 
  color = "grey70"
) +
geom_point(
  alpha = .3
) +
facet_grid(
  day_night ~ is_weekend
)


## -----------------------------------------------------------------------------
## EXERCISE
##
##   -  Create the following facet from the `mpg` data:
##       -  Visualize city miles per gallon per fuel type.
##       -  Plot the data either as jitter strips or 
##          as summary of mean ± standard deviation.
##       -  Split the chart into small multiples with the years as rows
##          and the car classes as columns.
##       -  Only show those fuel types that are listed per car class.
##       -  Apply the bw theme.
##   -  A copy of the graphic is provided in the "plots" folder.
  

## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date() +
  scale_y_continuous() +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_continuous() +
  scale_y_continuous() +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_continuous() +
  scale_y_log10() +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_continuous() +
  scale_y_log10() +
  scale_color_viridis_d()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +  
  geom_point() +
  scale_y_continuous(
    trans = "log10"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares"
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = seq(0, 60000, by = 15000)
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = 0:4*15000
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = c(0, 2:12*2500, 40000, 50000)
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares in thousands",
    breaks = 0:4*15000,
    labels = 0:4*15
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = 0:4*15000,
    labels = paste(0:4*15000, "bikes")
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = 0:4*15000,
    labels = scales::label_comma(
      suffix = " bikes"
    )
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = 0:4*15000,
    limits = c(NA, 60000)
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = 0:4*15000,
    expand = c(0, 0)
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = -1:5*15000,
    expand = c(.5, .5) ## c(add, mult)
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = -1:5*15000,
    expand = expansion(add = 2000)
  )  


## -----------------------------------------------------------------------------

ggplot(
  bikes,
  aes(x = date, y = count,
      color = season)
) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = -1:5*15000,
    expand = expansion(add = c(2000, 0))
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares",
    guide = "none"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = temp,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Temperature (°C)",
    sec.axis = dup_axis()
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = temp,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Temperature (°C)",
    sec.axis = sec_axis(
      trans = ~ (. * 9/5) + 32,
      name = "Temperature (°F)"
    )
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date(
    name = NULL,
    date_breaks = "4 months"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date(
    name = NULL,
    date_breaks = "20 weeks"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date(
    name = NULL,
    date_breaks = "6 months",
    date_labels = "%Y/%m/%d"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date(
    name = NULL,
    date_breaks = "6 months",
    date_labels = "%b '%y"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  scale_x_discrete(
    name = "Period",
    labels = c("Dec-Feb", "Mar-May", "Jun-Aug", "Sep-Nov")
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  scale_x_discrete(
    name = "Season",
    expand = c(.5, 0) ## add, mult
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = as.numeric(season), y = count)
  ) +
  geom_boxplot()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = as.numeric(season), y = count)
  ) +
  geom_boxplot(
    aes(group = season)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = as.numeric(season),
        y = count)
  ) +
  geom_boxplot(
    aes(group = season)
  ) +
  scale_x_continuous(
    name = "Season",
    breaks = 1:4,
    labels = levels(bikes$season)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = as.numeric(season) + 
            as.numeric(season) / 8,
        y = count)
  ) +
  geom_boxplot(
    aes(group = season)
  ) +
  scale_x_continuous(
    name = "Season",
    breaks = 1:4,
    labels = levels(bikes$season)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(y = count,
        group = season)
  ) +
  geom_boxplot(
    aes(x = as.numeric(season) + .2),
    width = .3
  ) +
  geom_jitter(
    aes(x = as.numeric(season) - .2),
    width = .1,
    alpha = .3
  ) +
  scale_x_continuous(
    name = "Season",
    breaks = 1:4,
    labels = levels(bikes$season)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_color_discrete(
    name = "Season:",
    type = c("#69b0d4", "#00CB79", "#F7B01B", "#a78f5f")
  )


## -----------------------------------------------------------------------------
g <- ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_color_discrete(
    name = "Season:",
    type = c("#3ca7d9", "#1ec99b", "#F7B01B", "#bb7e8f")
  )

gb <- ggplot_build(g)

gb$data[[1]][c(1:5, 200:205, 400:405), 1:5]


## -----------------------------------------------------------------------------
my_colors <- c(
  `winter` = "#3c89d9",
  `spring` = "#1ec99b",
  `summer` = "#F7B01B",
  `autumn` = "#a26e7c"
)

ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_color_discrete(
    name = "Season:",
    type = my_colors
  )


## -----------------------------------------------------------------------------
my_colors_alphabetical <- c(
  `autumn` = "#a26e7c",
  `spring` = "#1ec99b",
  `summer` = "#F7B01B",
  `winter` = "#3c89d9"
)

ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_color_discrete(
    name = "Season:",
    type = my_colors_alphabetical
  )


## -----------------------------------------------------------------------------
library(RColorBrewer)

ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_color_discrete(
    name = "Season:",
    type = brewer.pal(
      n = 4, name = "Dark2"
    )
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = weather_type)
  ) +
  geom_point() +
  scale_color_manual(
    name = NULL,
    values = brewer.pal(n = 6, name = "Pastel1"),
    na.value = "black"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = weather_type)
  ) +
  geom_point() +
  rcartocolor::scale_color_carto_d(
    name = NULL,
    palette = "Pastel",
    na.value = "black"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_continuous()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_continuous(
    name = "Temperature:",
    type = "viridis"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_gradient(
    name = "Temperature:",
    low = "grey90",
    high = "#8b0023"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_gradient2(
    name = "Temperature:",
    low = "#28a87d",
    mid = "grey90",
    high = "#8b0023"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_gradient2(
    name = "Temperature:",
    low = "#28a87d",
    mid = "grey90",
    high = "#8b0023",
    midpoint = mean(bikes$temp)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_gradientn(
    name = "Temperature:",
    colors = c("red", "orange", "green", "blue")
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_viridis_c(
    name = "Temperature:",
    option = "magma"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_viridis_c(
    name = "Temperature:",
    option = "magma",
    direction = -1
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_viridis_c(
    name = "Temperature:",
    option = "magma",
    direction = -1,
    begin = .2,
    end = .95
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_distiller(
    name = "Temperature:",
    palette = "RdYlBu"
  )


## -----------------------------------------------------------------------------
RColorBrewer::display.brewer.all()


## -----------------------------------------------------------------------------
RColorBrewer::display.brewer.all(colorblindFriendly = TRUE)


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  rcartocolor::scale_color_carto_c(
    name = "Temperature:",
    palette = "ag_GrnYl",
    direction = -1
  )


## -----------------------------------------------------------------------------
rcartocolor::display_carto_all()


## -----------------------------------------------------------------------------
rcartocolor::display_carto_all(colorblind_friendly = TRUE)


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scico::scale_color_scico(
    name = "Temperature:",
    palette = "batlow"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scico::scale_color_scico(
    name = "Temperature:",
    palette = "managua",
    direction = -1
  )


## -----------------------------------------------------------------------------
scico::scico_palette_show()


## -----------------------------------------------------------------------------
ggplot(bikes, 
       aes(x = day_night, y = count, 
           fill = season)) +
  geom_boxplot() +
  rcartocolor::scale_fill_carto_d(
    palette = "Vivid" 
  )


## -----------------------------------------------------------------------------
ggplot(bikes, 
       aes(x = day_night, y = count, 
           fill = season)) +
  geom_boxplot() +
  scale_fill_manual(
    values = rcartocolor::carto_pal(
      name = "Vivid", n = 7
    )[c(2, 6, 1, 3)]
  )


## -----------------------------------------------------------------------------
carto_custom <- 
  rcartocolor::carto_pal(
    name = "Vivid", n = 7
  )[c(2, 6, 1, 3)]

ggplot(bikes, 
       aes(x = day_night, y = count, 
           fill = season)) +
  geom_boxplot() +
  scale_fill_manual(
    values = carto_custom
  )


## -----------------------------------------------------------------------------
library(colorspace)

carto_light <- lighten(
  carto_custom, .7
)

ggplot(bikes, 
       aes(x = day_night, y = count, 
           fill = season)) +
  geom_boxplot() +
  scale_fill_manual(
    values = carto_light
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_viridis_c(
    guide = "colorsteps"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_viridis_c(
    guide = guide_colorsteps()
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_viridis_c(
    guide = guide_colorsteps(
      show.limits = TRUE
    )
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = round(temp, 2))
  ) +
  geom_point() +
  scale_color_viridis_c(
    guide = guide_colorsteps(
      show.limits = TRUE
    )
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_viridis_c(
    breaks = 1:5*5,
    guide = guide_colorsteps()
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_viridis_b(
    breaks = 1:5*5,
    guide = guide_colorsteps()
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = temp)
  ) +
  geom_point() +
  scale_color_viridis_c(
    name = "Temperature",
    guide = guide_colorbar(
      barwidth = unit(15, "lines"),
      barheight = unit(.5, "lines"),
      title.position = "top"
    )
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_color_brewer(
    palette = "Dark2",
    guide = guide_legend()
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_color_brewer(
    palette = "Dark2",
    guide = guide_legend(
      override.aes = list(
        size = 4,
        shape = 1
      )
    )
  )


## -----------------------------------------------------------------------------
## EXERCISE
##
##   -  Modify the mpg facet from above:
##       -  Show cty in steps of 5 and include the zero baseline.
##       -  Turn the fuel abbreviations to uppercase letters.
##       -  Add a legend.
##       -  Use a custom color palette.
##       -  Customize the legend key height and remove the title.
##       -  For consistency, use uppercase letters in the legend as well.
##   -  A copy of the graphic is provided in the "plots" folder.


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  coord_cartesian(
    ylim = c(NA, 15000)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  coord_cartesian(
    ylim = c(NA, 15000)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  scale_y_continuous(
    limits = c(NA, 15000)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  coord_cartesian(
    ylim = c(NA, 15000),
    clip = "off"
  )+
  theme(
    plot.margin = margin(t = 150)
  )


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, is_holiday == TRUE),
    aes(x = temp, y = count)
  ) +
  geom_point() +
  geom_text(
    aes(label = season),
    nudge_x = .3,
    hjust = 0
  ) +
  coord_cartesian(
    clip = "off"
  )


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, is_holiday == TRUE),
    aes(x = temp, y = count)
  ) +
  geom_point() +
  ggrepel::geom_text_repel(
    aes(label = season),
    nudge_x = .3,
    hjust = 0
  ) +
  coord_cartesian(
    clip = "off"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_point() +
  coord_cartesian(
    expand = FALSE,
    clip = "off"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = temp_feel)
  ) +
  geom_point() +
  coord_fixed()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = temp_feel)
  ) +
  geom_point() +
  coord_fixed(ratio = 4)


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = weather_type)
  ) +
  geom_bar() +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = weather_type)
  ) +
  geom_bar() +
  coord_flip()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(y = weather_type)
  ) +
  geom_bar() +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = weather_type)
  ) +
  geom_bar() +
  coord_flip()


## -----------------------------------------------------------------------------
library(forcats)

ggplot(
    filter(bikes, !is.na(weather_type)),
    aes(y = fct_infreq(weather_type))
  ) +
  geom_bar()


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, !is.na(weather_type)),
    aes(y = fct_rev(fct_infreq(weather_type)))
  ) +
  geom_bar()


## -----------------------------------------------------------------------------
ggplot(
  bikes,
  aes(x = is_workday,
      fill = is_workday)
) +
  geom_bar() +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = is_workday,
        fill = is_workday)
  ) +
  geom_bar() +
  coord_polar()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = is_workday,
        fill = is_workday)
  ) +
  geom_bar(width = 1) +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = is_workday,
        fill = is_workday)
  ) +
  geom_bar(width = 1) +
  coord_polar()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = is_workday,
        fill = is_workday)
  ) +
  geom_bar() +
  coord_polar(theta = "x")


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = is_workday,
        fill = is_workday)
  ) +
  geom_bar() +
  coord_polar(theta = "y")


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = 1,
        fill = is_workday)
  ) +
  geom_bar() +
  coord_cartesian() 


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = 1,
        fill = is_workday)
  ) +
  geom_bar() +
  coord_polar(theta = "y") 


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_point() +
  coord_trans(y = "log10")


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count,
        group = day_night)
  ) +
  geom_point() +
  geom_smooth(method = "lm") +
  coord_trans(y = "log10")


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count,
        group = day_night)
  ) +
  geom_point() +
  geom_smooth(method = "lm") +
  scale_y_log10()


## -----------------------------------------------------------------------------
countries <- rnaturalearth::ne_countries(
  returnclass = "sf"
)

ggplot() +
  geom_sf(
    data = countries,
    color = "#79dfbd",
    fill = "#28a87d",
    linewidth = .3
  )


## -----------------------------------------------------------------------------
ggplot() +
  geom_sf(
    data = countries,
    color = "#79dfbd",
    fill = "#28a87d",
    linewidth = .3
  ) +
  coord_sf(crs = "+proj=moll")


## -----------------------------------------------------------------------------
ggplot() +
  geom_sf(
    data = countries,
    color = "#79dfbd",
    fill = "#28a87d",
    linewidth = .3
  ) +
  coord_sf(crs = "+proj=bonne +lat_1=10")


## -----------------------------------------------------------------------------
sf_bln <- sf::st_sfc(
  sf::st_point(c(13.4050, 52.5200)), 
  crs = sf::st_crs(countries)
)


## -----------------------------------------------------------------------------
sf_bln <- sf::st_sfc(
  sf::st_point(c(13.4050, 52.5200)), 
  crs = sf::st_crs(countries)
)

sf_bln


## -----------------------------------------------------------------------------
ggplot() +
  geom_sf(
    data = countries, 
    fill = "grey50", 
    color = NA
  ) + 
  geom_sf(
    data = sf_bln, 
    shape = 21, 
    color = "firebrick", 
    fill = NA, 
    size = 5, 
    stroke = 2
  )


## -----------------------------------------------------------------------------
ggplot() +
  geom_sf(
    data = countries, 
    fill = "grey50", 
    color = NA
  ) + 
  geom_sf(
    data = sf_bln, 
    shape = 21, 
    color = "firebrick", 
    fill = NA, 
    size = 5, 
    stroke = 2
  ) +
  coord_sf(crs = "+proj=moll")


## -----------------------------------------------------------------------------
oceans <- rnaturalearth::ne_download(
  category = "physical", type = "ocean", returnclass = "sf"
)


## -----------------------------------------------------------------------------
ggplot() +
  geom_sf(
    data = oceans,
    fill = "#d8f1f6"
  ) +
  geom_sf(
    data = countries,
    color = "#79dfbd",
    fill = "#28a87d",
    linewidth = .3
  ) +
  coord_sf(crs = "+proj=moll") +
  theme_void()


## -----------------------------------------------------------------------------
ggplot() +
  geom_sf(
    data = oceans,
    fill = "#d8f1f6",
    color = "white"
  ) +
  geom_sf(
    data = countries,
    aes(fill = economy),
    color = "white",
    linewidth = .3
  ) +
  coord_sf(crs = "+proj=moll") +
  scale_fill_viridis_d(option = "magma") +
  theme_void() +
  theme(legend.position = "top")


## -----------------------------------------------------------------------------
borders <- rmapshaper::ms_innerlines(countries)

ggplot() +
  geom_sf(
    data = oceans,
    fill = "#d8f1f6",
    color = "white"
  ) +
  geom_sf(
    data = countries,
    aes(fill = economy),
    color = "transparent"
  ) +
  geom_sf(
    data = borders,
    fill = "transparent",
    color = "white",
    linewidth = .3
  ) +
  coord_sf(crs = "+proj=moll") +
  scale_fill_viridis_d(option = "magma") +
  theme_void() +
  theme(legend.position = "top")


## -----------------------------------------------------------------------------
## EXERCISES

## Exercise 1
##
##   -  Create the visualization of carbon footprints for different 
##      modes of travel as close as possible.
##       -  Import the data "carbon-footprint-travel-2022-simple.csv".
##       -  Create a ranked bar chart of emissions per travel mode.
##       -  Modify the bar colors to differentiate train travel and other modes.
##       -  Add labels stating the exact emissions to the end of the bars.
##       -  Add reference lines to compare travel emissions relative to those 
##          produced when traveling by national trains.
##       -  Add title, subtitle, and caption. Remove the axis title of the y 
##          axis, turn the title of the x axis into a more meaningful one.
##       -  Apply the minimal complete theme.
##       -  Modify the theme elements and behavior.
##       -  Export the graphic as both, raster and vector graphic with a 
##          suitable aspect ratio and resolution.
##   -  A copy of the graphic is provided in the "plots" folder.

title <- "Taking the train instead of a petrol car or plane for medium-range travels cuts your emissions by more than 80%."
subtitle <- "If you took the Eurostar in France instead of a short-haul flight, you’d be able to cut your journey’s carbon footprint by around 97%."
caption <- "Data: UK Government, Department for Energy Security and Net Zero via OurWorldInData\nNote: Official conversion factors used in UK reporting. Data for aviation is based on economy class."



## Exercise 2
##  
##   -  Download data set(s) for your home country or study area and plot it/them.
##       -  Change the projection with `coord_sf()` and observe how the spatial 
##          mapping changes.
##       -  Choose a projection that is suited for the given area.
##       -  Add a marker to indicate your home city, location of the study etc.

