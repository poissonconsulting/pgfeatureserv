pgf_collection <- function(collection_id,
                           base_url,
                           path,
                           table,
                           tibble = TRUE,
                           user = gh_user(),
                           verbose = FALSE,
                           response = FALSE) {
  chk_string(collection_id)
  chk_string(base_url)
  chk_string(path)
  chk_string(user)
  chk_flag(verbose)
  chk_flag(response)

  path <- file.path(path, "collections", collection_id)
  url <- modify_url(url = base_url, path = path, query = NULL)

  resp <- get_request(
    url = url, user = user, verbose = verbose
  )

  if (response) {
    return(resp)
  }

  x <- resp$response
  content_json(x, table = table, tibble = tibble)
}

#' Get collection properties
#'
#' Get information about a collection's column names.
#'
#' @inheritParams params
#' @return A tibble.
#' @family collections
#' @export
#' @examples
#' \dontrun{
#' base_url <- "https://features.hillcrestgeo.ca/"
#' path <- "fwa"
#' collection_id <- "whse_basemapping.fwa_named_streams"
#' pgf_collection_properties(,
#'   collection_id = collection_id, base_url = base_url, path = path
#' )
#' }
pgf_collection_properties <- function(collection_id,
                                      base_url,
                                      path,
                                      user = gh_user(),
                                      verbose = FALSE,
                                      response = FALSE) {
  pgf_collection(
    collection_id = collection_id,
    base_url = base_url,
    path = path,
    user = user,
    verbose = verbose,
    response = response,
    table = "properties"
  )
}

#' Get collection description
#'
#' Get description of a collection.
#'
#' @inheritParams params
#' @return A string.
#' @family collections
#' @export
#' @examples
#' \dontrun{
#' base_url <- "https://features.hillcrestgeo.ca/"
#' path <- "fwa"
#' collection_id <- "whse_basemapping.fwa_named_streams"
#' pgf_collection_description(,
#'   collection_id = collection_id, base_url = base_url, path = path
#' )
#' }
pgf_collection_description <- function(collection_id,
                                      base_url,
                                      path,
                                      user = gh_user(),
                                      verbose = FALSE,
                                      response = FALSE) {
  pgf_collection(
    collection_id = collection_id,
    base_url = base_url,
    path = path,
    user = user,
    verbose = verbose,
    response = response,
    table = "description",
    tibble = FALSE
  )
}

#' Get collection crs
#'
#' Get crs of a collection.
#'
#' @inheritParams params
#' @return A string.
#' @family collections
#' @export
#' @examples
#' \dontrun{
#' base_url <- "https://features.hillcrestgeo.ca/"
#' path <- "fwa"
#' collection_id <- "whse_basemapping.fwa_named_streams"
#' pgf_collection_crs(,
#'   collection_id = collection_id, base_url = base_url, path = path
#' )
#' }
pgf_collection_crs <- function(collection_id,
                                       base_url,
                                       path,
                                       user = gh_user(),
                                       verbose = FALSE,
                                       response = FALSE) {
  x <- pgf_collection(
    collection_id = collection_id,
    base_url = base_url,
    path = path,
    user = user,
    verbose = verbose,
    response = response,
    table = "extent",
    tibble = FALSE
  )
  x$spatial$crs
}

#' Get collection bbox
#'
#' Get bounding box of a collection.
#'
#' @inheritParams params
#' @return A list.
#' @family collections
#' @export
#' @examples
#' \dontrun{
#' base_url <- "https://features.hillcrestgeo.ca/"
#' path <- "fwa"
#' collection_id <- "whse_basemapping.fwa_named_streams"
#' pgf_collection_bbox(,
#'   collection_id = collection_id, base_url = base_url, path = path
#' )
#' }
pgf_collection_bbox <- function(collection_id,
                                  base_url,
                                  path,
                                  user = gh_user(),
                                  verbose = FALSE,
                                  response = FALSE) {
  x <- pgf_collection(
    collection_id = collection_id,
    base_url = base_url,
    path = path,
    user = user,
    verbose = verbose,
    response = response,
    table = "extent",
    tibble = FALSE
  )
  x$spatial$bbox
}

#' Get collection geometry type
#'
#' Get geometry type of a collection.
#'
#' @inheritParams params
#' @return A string.
#' @family collections
#' @export
#' @examples
#' \dontrun{
#' base_url <- "https://features.hillcrestgeo.ca/"
#' path <- "fwa"
#' collection_id <- "whse_basemapping.fwa_named_streams"
#' pgf_collection_geometry_type(,
#'   collection_id = collection_id, base_url = base_url, path = path
#' )
#' }
pgf_collection_geometry_type <- function(collection_id,
                                       base_url,
                                       path,
                                       user = gh_user(),
                                       verbose = FALSE,
                                       response = FALSE) {
  pgf_collection(
    collection_id = collection_id,
    base_url = base_url,
    path = path,
    user = user,
    verbose = verbose,
    response = response,
    table = "geometrytype",
    tibble = FALSE
  )
}
