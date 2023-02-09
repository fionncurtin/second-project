library(tidycensus)
library(tidyverse)
library(tmap)

hennepin_race <- get_decennial(
  geography = "tract",
  state = "MN",
  county = "Hennepin",
  variables = c(
    Hispanic = "P2_002N",
    White = "P2_005N",
    Black = "P2_006N",
    Native = "P2_007N",
    Asian = "P2_008N"
  ),
  summary_var = "P2_001N",
  year = 2020,
  geometry = TRUE
) |>
  mutate(percent = 100 * (value / summary_value))

write_rds(hennepin_race, "race-data.rds")