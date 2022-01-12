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
#' pgf_collection_properties(base_url = base_url, path = path)
#' }
pgf_collection_properties <- function(collection_id,
                                      base_url,
                                      path,
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

  if(response)
    return(resp)

  x <- resp$response
  content_json(x, table = "properties")
}
