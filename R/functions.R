#' Get functions
#'
#' Get information on available functions.
#'
#' @inheritParams params
#' @return A tibble.
#' @family functions
#' @export
#' @examples
#' \dontrun{
#' base_url <- "https://features.hillcrestgeo.ca/"
#' path <- "fwa"
#' pgf_functions(
#'   base_url = base_url, path = path
#' )
#' }
pgf_functions <- function(base_url,
                          path,
                          nocache = FALSE,
                          user = gh_user(),
                          verbose = FALSE,
                          response = FALSE) {
  chk_string(base_url)
  chk_string(path)
  chk_flag(nocache)
  chk_string(user)
  chk_flag(verbose)
  chk_flag(response)

  path <- file.path(path, "functions")
  query <- list(
    nocache = nocache
  )
  url <- modify_url(url = base_url, path = path, query = query)

  resp <- get_request(
    url = url, user = user, verbose = verbose
  )

  if (response) {
    return(resp)
  }

  x <- resp$response
  content_json(x, "functions")
}
