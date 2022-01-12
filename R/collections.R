#' Get collections
#'
#' Get information about the collections.
#'
#' @inheritParams params
#' @return A tibble.
#' @family collections
#' @export
#' @examples
#' \dontrun{
#' base_url <- "https://features.hillcrestgeo.ca/"
#' path <- "fwa"
#' pgf_collections(base_url = base_url, path = path)
#' }
pgf_collections <- function(base_url,
                            path,
                            user = gh_user(),
                            verbose = FALSE,
                            response = FALSE) {
  chk_string(base_url)
  chk_string(path)
  chk_string(user)
  chk_flag(verbose)
  chk_flag(response)

  path <- file.path(path, "collections")
  url <- modify_url(url = base_url, path = path, query = NULL)

  resp <- get_request(
    url = url, user = user, verbose = verbose
  )

  if (response) {
    return(resp)
  }

  x <- resp$response
  content_json(x, "collections")
}
