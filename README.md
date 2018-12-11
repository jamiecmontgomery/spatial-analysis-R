# Introduction to spatial analysis in R

### Jamie Afflerbach & Jeanette Clark

Click on the links below for the tutorials on:

- [sf](http://jafflerbach.github.io/spatial-analysis-R/intro_to_sf.html)
- [raster analysis](http://jafflerbach.github.io/spatial-analysis-R/intro_spatial_data_R.html)

R is getting better and better for spatial data visualization and analyses. This tutorial specifically focuses on working with raster, or gridded, data in R and gives a brief introduction to the [`sf` package](https://r-spatial.github.io/sf/articles/sf1.html).

You can either fork this repository into your personal GitHub account, or download the repoository as a .zip file by hitting the green "Clone or Download" button.

## Required libraries

You will need the following libraries for the tutorial:

`sf`, `rgdal`, `dplyr`, `ggplot2`, `raster`, `devtools`, `leaflet`, `scales`, all of which are on CRAN and can be installed using `install.packages()` in your R console. You will also need to install a new package, [`fasterize`](https://github.com/ecohealthalliance/fasterize) using devtools. For this you'll need to run:

```r
devtools::install_github("ecohealthalliance/fasterize")
```








