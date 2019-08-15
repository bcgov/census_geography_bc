# CMA test

# PACKAGES
# the tidyverse
library(dplyr)
library(forcats)
library(glue)

# utilities
library(here)

# mapping
library(sf)


# read and save Canada file

canada_cma <- st_read(here::here("geography", "cma_canada", "lcma000b16a_e.shp"))

saveRDS(canada_cma, here("geography", "cma_canada", "canada_cma.RDS"))

# filter B.C. geography

bc_cma <- 
  canada_cma %>%
  filter(PRUID == "59") %>%
  mutate(PRUID = fct_drop(PRUID))

saveRDS(bc_cma, here("geography", "bc_geog", "bc_cma.RDS"))

