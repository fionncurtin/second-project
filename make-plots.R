library(tidyverse)
library(tidycensus)
library(tmap)
library(knitr)

hennepin_race <- read_rds("race-data.rds")


hennepin_dots <- hennepin_race %>%
  as_dot_density(
    value = "value",
    values_per_dot = 100,
    group = "variable"
  )


background_tracts <- filter(hennepin_race, variable == "White")

my_plot <- tm_shape(background_tracts) + 
  tm_polygons(col = "white", 
              border.col = "grey") + 
  tm_shape(hennepin_dots) +
  tm_dots(col = "variable", 
          palette = "Set1",
          size = 0.005, 
          title = "1 dot = 100 people") + 
  tm_layout(legend.outside = TRUE,
            title = "Race/ethnicity,\n2020 US Census")


write_rds(my_plot, "plot-1.rds")