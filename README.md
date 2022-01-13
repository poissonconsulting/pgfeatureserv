
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pgfsr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

`pgfsr` is an R client for
[pg\_featureserv](https://github.com/CrunchyData/pg_featureserv), a
RESTful web service that provides access to spatial data stored in
PostGIS tables, as well as spatial processing capability based on
PostGIS spatial functions.

For more information on pg\_featureserv:  
- [User
Guide](https://access.crunchydata.com/documentation/pg_featureserv/1.2.0/)  
- [API
Summary](https://github.com/CrunchyData/pg_featureserv/blob/master/API.md#feature-collections)  
- [Github Page](https://github.com/CrunchyData/pg_featureserv)

### Work with collections

Get information about collections or a single collection:

-   [`pgf_collections()`](https://poissonconsulting.github.io/pgfsr/reference/pgf_collections.html)  
-   [`pgf_collection()`](https://poissonconsulting.github.io/pgfsr/reference/pgf_collection.html)

Query features or a single feature from a collection:

-   [`pgf_collection_features()`](https://poissonconsulting.github.io/pgfsr/reference/pgf_collection_features.html)  
-   [`pgf_collection_feature()`](https://poissonconsulting.github.io/pgfsr/reference/pgf_collection_feature.html)

### Work with functions

Get information about functions or a single function:

-   [`pgf_functions()`](https://poissonconsulting.github.io/pgfsr/reference/pgf_functions.html)  
-   [`pgf_function_properties()`](https://poissonconsulting.github.io/pgfsr/reference/pgf_function_properties.html)  
-   [`pgf_function_parameters()`](https://poissonconsulting.github.io/pgfsr/reference/pgf_function_parameters.html)  
-   [`pgf_function_description()`](https://poissonconsulting.github.io/pgfsr/reference/pgf_function_description.html)

Execute a spatial function and produce a result:

-   [`pgf_function_result()`](https://poissonconsulting.github.io/pgfsr/reference/pgf_function_result.html)

## Installation

You can install the development version of pgfsr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("poissonconsulting/pgfsr")
```

## Example

## Code of Conduct

Please note that the pgfsr project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
