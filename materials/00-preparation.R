#------------------------------------------------------------------------------#
#                                                                              #
#                  Engaging & Reproducible Data Visualization                  #
#                  From Theory to Implementation with ggplot2                  #
#                                                                              #
#                         Preparation: Install Packages                        #
#                                                                              #
#                              Dr. Cedric Scherer                              #
#                         NC3 Workshop // January 2024                         #
#                                                                              #
#------------------------------------------------------------------------------#

pkgs <- c(
  "ggplot2", "readr", "dplyr", "forcats", "stringr", "purrr", "lubridate", 
  "scales", "ragg", "systemfonts", "grDevices", "ggrepel", "ggforce", "ggtext", 
  "patchwork", "RColorBrewer", "rcartocolor", "scico", "colorspace", "sf",
  "rnaturalearth", "gapminder", "palmerpenguins", "concavemen", "remotes"
)

install.packages(setdiff(pkgs, rownames(installed.packages())))

remotes::install_github("ropensci/rnaturalearthhires")
remotes::install_github("AllanCameron/geomtextpath")
