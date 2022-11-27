
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pgfeatureserv

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/poissonconsulting/pgfeatureserv/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/pgfeatureserv/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/pgfeatureserv/branch/main/graph/badge.svg)](https://app.codecov.io/gh/poissonconsulting/pgfeatureserv?branch=main)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

`pgfeatureserv` is an R client for
[pg_featureserv](https://github.com/CrunchyData/pg_featureserv), a
RESTful web service that provides access to spatial data stored in
PostGIS tables, as well as spatial processing capability based on
PostGIS spatial functions.

For more information on pg_featureserv:  
- [User
Guide](https://access.crunchydata.com/documentation/pg_featureserv/1.2.0/)  
- [API
Summary](https://github.com/CrunchyData/pg_featureserv/blob/master/API.md#feature-collections)  
- [Github Page](https://github.com/CrunchyData/pg_featureserv)

### Work with collections

Get information about collections or a single collection:

- [`pgf_collections()`](https://poissonconsulting.github.io/pgfeatureserv/reference/pgf_collections.html)  
- [`pgf_collection_properties()`](https://poissonconsulting.github.io/pgfeatureserv/reference/pgf_collection_properties.html)  
- [`pgf_collection_description()`](https://poissonconsulting.github.io/pgfeatureserv/reference/pgf_collection_description.html)  
- [`pgf_collection_crs()`](https://poissonconsulting.github.io/pgfeatureserv/reference/pgf_collection_crs.html)  
- [`pgf_collection_bbox()`](https://poissonconsulting.github.io/pgfeatureserv/reference/pgf_collection_bbox.html)  
- [`pgf_collection_geometry_type()`](https://poissonconsulting.github.io/pgfeatureserv/reference/pgf_collection_geometry_type.html)

Query features or a single feature from a collection:

- [`pgf_collection_features()`](https://poissonconsulting.github.io/pgfeatureserv/reference/pgf_collection_features.html)  
- [`pgf_collection_feature()`](https://poissonconsulting.github.io/pgfeatureserv/reference/pgf_collection_feature.html)

### Work with functions

Get information about functions or a single function:

- [`pgf_functions()`](https://poissonconsulting.github.io/pgfeatureserv/reference/pgf_functions.html)  
- [`pgf_function_properties()`](https://poissonconsulting.github.io/pgfeatureserv/reference/pgf_function_properties.html)  
- [`pgf_function_parameters()`](https://poissonconsulting.github.io/pgfeatureserv/reference/pgf_function_parameters.html)  
- [`pgf_function_description()`](https://poissonconsulting.github.io/pgfeatureserv/reference/pgf_function_description.html)

Execute a spatial function and get result:

- [`pgf_function_result()`](https://poissonconsulting.github.io/pgfeatureserv/reference/pgf_function_result.html)

## Installation

You can install the development version of pgfeatureserv from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("poissonconsulting/pgfeatureserv")
```

## Demonstration

Lookup available collections in BC Freshwater Atlas:

``` r
base_url <- "https://features.hillcrestgeo.ca/"
path <- "fwa"
collections <- pgfeatureserv::pgf_collections(base_url = base_url, path = path)
collections$id
#>  [1] "fwapg.fwa_stream_networks_sp"                   
#>  [2] "hydrosheds.hybas_lev12_v1c"                     
#>  [3] "usgs.wbdhu12"                                   
#>  [4] "whse_basemapping.fwa_approx_borders"            
#>  [5] "whse_basemapping.fwa_assessment_watersheds_poly"
#>  [6] "whse_basemapping.fwa_basins_poly"               
#>  [7] "whse_basemapping.fwa_bays_and_channels_poly"    
#>  [8] "whse_basemapping.fwa_bcboundary"                
#>  [9] "whse_basemapping.fwa_coastlines_sp"             
#> [10] "whse_basemapping.fwa_glaciers_poly"             
#> [11] "whse_basemapping.fwa_islands_poly"              
#> [12] "whse_basemapping.fwa_lakes_poly"                
#> [13] "whse_basemapping.fwa_linear_boundaries_sp"      
#> [14] "whse_basemapping.fwa_manmade_waterbodies_poly"  
#> [15] "whse_basemapping.fwa_named_streams"             
#> [16] "whse_basemapping.fwa_named_watersheds_poly"     
#> [17] "whse_basemapping.fwa_obstructions_sp"           
#> [18] "whse_basemapping.fwa_rivers_poly"               
#> [19] "whse_basemapping.fwa_watershed_groups_poly"     
#> [20] "whse_basemapping.fwa_watersheds_poly"           
#> [21] "whse_basemapping.fwa_wetlands_poly"
```

Get Sangan River from the stream network collection:

``` r
coll <- "whse_basemapping.fwa_stream_networks_sp"
river <- pgfeatureserv::pgf_collection_features(coll, base_url = base_url, path = path,
                 filter = list(gnis_name = "Sangan River"))
class(river)
#> [1] "sf"         "tbl"        "tbl_df"     "data.frame"
river[1:5, 1:4]
#> # A data frame: 5 × 4
#>   blue_line_key blue_line_key_50k downstream_route_measure edge_type
#>           <dbl>             <dbl>                    <dbl>     <dbl>
#> 1     360879896                11                    7849.      1000
#> 2     360879896                11                   10909.      1000
#> 3     360879896               130                   16588.      1000
#> 4     360879896                11                    4721.      1000
#> 5     360879896                11                    3446.      1000
```

## Code of Conduct

Please note that the pgfeatureserv project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
