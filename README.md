<!-- 
Add a project state badge

See <https://github.com/BCDevExchange/Our-Project-Docs/blob/master/discussion/projectstates.md> 
If you have bcgovr installed and you use RStudio, click the 'Insert BCDevex Badge' Addin.
-->

census_geography_bc
============================

### Usage

These scripts take geographic boundary files made available by Statistics Canada (under the [Statistics Canada Open License](https://www.statcan.gc.ca/eng/reference/licence)), and convert them to .RDS files, which can be read into R and used for mapping etc.

Boundary files should be downloaded from this site:

* [Boundary files](https://www12.statcan.gc.ca/census-recensement/2011/geo/bound-limit/bound-limit-eng.cfm)


Folder structure within this project is 

* \scr\ -- for scripts

* \geography\ 

  - \(geolevel)_canada -- for the source shape files and a national *.RDS file for that level of geography
  
  - \bc_geography -- for all B.C. files (which are sub-sets of the national .RDS files)
  
  

#### Example: Census Metropolitan Area

File `lcma000b16a_e.zip` downloaded from [2016 Census - Boundary files](https://www12.statcan.gc.ca/census-recensement/2011/geo/bound-limit/bound-limit-2016-eng.cfm), after selecting "Census metropolitan areas and census agglomerations" in the "Cartographic Boundary File" column.

This file is then saved to folder `\geography\cma_canada`, and unzipped.

The following script will 
 
 * open the file (using the {sf} package), 
 
 * save it as an .RDS file in the above folder,
 
 * filter only the B.C. regions (using the provincial code of "59"), and
 
 * save the B.C. file in `\geography\bc_geography`.




``` r

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

canada_cma <- st_read(here::here("geography", "cma_canada", "lcma_000b16a_e.shp"))

saveRDS(canada_cma, here("geography", "cma_canada", "canada_cma.RDS"))

# filter B.C. geography

bc_cma <- 
  canada_cma %>%
  filter(PRUID == "59") %>%
  mutate(PRUID = fct_drop(PRUID))

saveRDS(bc_cma, here("geography", "bc_geog", "bc_cma.RDS"))

```

### Project Status

### Getting Help or Reporting an Issue

To report bugs/issues/feature requests, please file an [issue](https://github.com/bcgov/census_geography_bc/issues/).

### How to Contribute

If you would like to contribute, please see our [CONTRIBUTING](CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

### License

```
Copyright 2019 Province of British Columbia

Licensed under the Apache License, Version 2.0 (the &quot;License&quot;);
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an &quot;AS IS&quot; BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
```
---
*This project was created using the [bcgovr](https://github.com/bcgov/bcgovr) package.* 
