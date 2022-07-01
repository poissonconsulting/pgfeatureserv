#' Get collection feature
#'
#' Get collection feature given collection_id, feature_id and optional query
#' parameters (see API specs [here](https://github.com/CrunchyData/pg_featureserv/blob/master/API.md#feature-collections)).
#'
#' @inheritParams params
#' @return A sf object.
#' @family collections
#' @export
#' @examples
#' \dontrun{
#' pgf_collection_feature("whse_basemapping.fwa_wetlands_poly", limit = 1)
#' }
pgf_collection_feature <- function(collection_id,
                                   feature_id,
                                    base_url,
                                    path,
                                    properties = NULL,
                                    transform = NULL,
                                   nocache = FALSE,
                                    user = gh_user(),
                                    verbose = FALSE,
                                    response = FALSE) {
  chk_string(collection_id)
  chk_whole_number(feature_id)
  chk_gte(feature_id)
  chk_null_or(properties, vld = vld_character)
  chk_null_or(transform, vld = vld_character)
  chk_flag(nocache)
  chk_flag(verbose)
  chk_flag(response)

  properties <- format_parameter(properties)
  transform <- format_parameter(transform)

  query <- list(
      properties = properties,
      transform = transform,
      nocache = nocache
    )

  path <- file.path(path, "collections", collection_id, "items", feature_id)
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
