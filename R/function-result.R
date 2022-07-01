#' Get function result
#'
#' Call a spatial function and get results.
#'
#' @inheritParams params
#' @return A sf object.
#' @family functions
#' @export
#' @examples
#' \dontrun{
#' function_id <- "fwa_locatealong"
#' base_url <- "https://features.hillcrestgeo.ca/"
#' path <- "fwa"
#'
#' parameters <- list(
#'   blue_line_key = 356308001,
#'   downstream_route_measure = 0
#' )
#' pgf_function_result(function_id,
#'   base_url = base_url,
#'   path = path,
#'   parameters = parameters
#' )
#' }
#'
pgf_function_result <- function(function_id,
                         base_url,
                         path,
                         parameters,
                         limit = 10000,
                         offset = 0,
                         sortby = NULL,
                         bbox = NULL,
                         properties = NULL,
                         precision = NULL,
                         transform = NULL,
                         nocache = FALSE,
                         user = gh_user(),
                         verbose = FALSE,
                         response = FALSE) {
  chk_string(function_id)
  chkor_vld(vld_null(parameters),
            vld_named(parameters) & vld_vector(parameters))
  chk_whole_number(limit)
  chk_gt(limit)
  chk_lte(limit, 10000L)
  chk_whole_number(offset)
  chk_gte(offset)
  chk_null_or(bbox, vld = vld_numeric)
  chk_null_or(properties, vld = vld_character)
  chkor_vld(vld_null(precision),
            vld_whole_number(precision) & vld_gt(precision, 0))
  chk_null_or(transform, vld = vld_character)
  chk_flag(nocache)
  chk_flag(verbose)
  chk_flag(response)

  properties <- format_parameter(properties)
  bbox <- format_parameter(bbox)
  transform <- format_parameter(transform)
  limit <- format_number(limit)
  offset <- format_number(offset)

  query <- c(
    parameters,
    list(
      limit = limit,
      offset = offset,
      sortBy = sortby,
      bbox = bbox,
      properties = properties,
      transform = transform,
      precision = precision,
      nocache = nocache
    )
  )

  path <- file.path(path, "functions", function_id, "items")
  url <- modify_url(url = base_url, path = path, query = query)

  resp <- get_request(
    url = url, user = user, verbose = verbose
  )

  if (response) {
    return(resp)
  }

  x <- resp$response
  content_geojson(x)
}
