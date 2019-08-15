
library(geojsonio)
library(rmapshaper)
library(rgdal)
library(tidyverse)
library(spdplyr)
library(sf)

here::here()


canada_raw <- readOGR(dsn = here::here("geography", "cd_canada", "lcd_000b16a_e"), layer = "lcd_000b16a_e",
                      use_iconv=TRUE, encoding="CP1250")

