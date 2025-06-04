#' Get collection features
#'
#' Get collection features given collection_id and optional query
#' parameters (see API specs [here](https://github.com/CrunchyData/pg_featureserv/blob/master/API.md#feature-collections)).
#'
#' @inheritParams params
#' @return A sf object.
#' @family collections
#' @export
#' @examples
#' \dontrun{
#' pgf_collection_features("whse_basemapping.fwa_wetlands_poly", limit = 1)
#' }
pgf_collection_features <- function(collection_id,
                                    base_url,
                                    path,
                                    filter = NULL,
                                    limit = 10000,
                                    offset = 0,
                                    sortby = NULL,
                                    bbox = NULL,
                                    properties = NULL,
                                    precision = NULL,
                                    transform = NULL,
                                    groupby = NULL,
                                    nocache = NULL,
                                    user = gh_user(),
                                    verbose = FALSE,
                                    response = FALSE) {
  chk_string(collection_id)
  chkor_vld(
    vld_null(filter),
    vld_named(filter) & vld_vector(filter)
  )
  chk_whole_number(limit)
  chk_gt(limit)
  chk_lte(limit, 10000L)
  chk_whole_number(offset)
  chk_gte(offset)
  chk_null_or(bbox, vld = vld_numeric)
  chk_null_or(properties, vld = vld_character)
  chkor_vld(
    vld_null(precision),
    vld_whole_number(precision) & vld_gt(precision, 0)
  )
  chk_null_or(groupby, vld = vld_string)
  chk_null_or(transform, vld = vld_character)
  chk_null_or(nocache, vld = vld_charflag)
  chk_flag(verbose)
  chk_flag(response)

  properties <- format_parameter(properties)
  bbox <- format_parameter(bbox)
  transform <- format_parameter(transform)
  groupby <- format_parameter(groupby)
  limit <- format_number(limit)
  offset <- format_number(offset)

  query <- c(
    filter,
    list(
      limit = limit,
      offset = offset,
      sortBy = sortby,
      bbox = bbox,
      properties = properties,
      transform = transform,
      precision = precision,
      groupBy = groupby,
      nocache = nocache
    )
  )

  path <- file.path(path, "collections", collection_id, "items.json")
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
