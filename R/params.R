#' Parameter Descriptions for pgfsr Functions
#' @param ... Unused parameters.
#' @param response A flag indicating whether to return the raw response object.
#' @param base_url A character string of the base URL.
#' @param path A character string of the path or endpoint.
#' @param user A character string of the user. This allows whoever is running
#' the server your are querying to contact you in case of misuse.
#' @param verbose A flag indicating whether to provide verbose GET response.
#' @param collection_id A character string of the collection id.
#' @param function_id A character string of the function id.
#' @param limit A positive whole number that limits the number of
#' features in the response.
#' @param offset A positive whole number that starts the response at an offset.
#' @param sortby A string that sorts the response items by a property.
#' Default is ascending but property name can be prepended with '-' to indicate descending.
#' @param bbox A vector of four numbers indicating bounding box in lon/lat
#' (e.g. `c(minLon, minLat, maxLon, maxLat)`) that features in response
#' must intersect.
#' @param filter A named vector or list of the filter(s) to apply, where the list
#' names correspond to column names and the list values correspond to the desired
#' value, e.g. `list(gnis_name = "Sangan River")`.
#' @param properties A vector of strings of the column names to include.
#' If NULL (default), all columns are retained.
#' @param transform A character vector with the name of the
#' [*valid transform*](https://github.com/CrunchyData/pg_featureserv/blob/master/config/pg_featureserv.toml.example#L29)
#' function followed by the parameter values (e.g. c("ST_Simplify", 100)).
#' @param precision A positive whole number indicating precision
#' (i.e., number of decimal places) of GeoJSON coordinates.
#' @param groupby A string of the property name (i.e., column name) to group
#' response features by. This would typically be used with an aggregate
#' transform function.
#' @param parameters A named list of the parameters and values for a
#' specific function.
#'
#' @keywords internal
#' @name params
NULL
