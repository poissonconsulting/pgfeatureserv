pgf_function <- function(function_id,
                         base_url,
                         path,
                         table,
                         nocache = NULL,
                         tibble = TRUE,
                         user = gh_user(),
                         verbose = FALSE,
                         response = FALSE) {
  chk_string(function_id)
  chk_string(base_url)
  chk_string(path)
  chk_null_or(nocache, vld = vld_charflag)
  chk_string(user)
  chk_flag(verbose)
  chk_flag(response)

  path <- file.path(path, "functions", function_id)
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
  content_json(x, table = table, tibble = tibble)
}

#' Get function parameters
#'
#' Get information on function parameters.
#'
#' @inheritParams params
#' @return A tibble.
#' @family functions
#' @export
#' @examples
#' \dontrun{
#' function_id <- "fwa_locatealong"
#' base_url <- "https://features.hillcrestgeo.ca/"
#' path <- "fwa"
#' pgf_function_parameters(
#'   function_id = function_id, base_url = base_url, path = path
#' )
#' }
pgf_function_parameters <- function(function_id,
                         base_url,
                          path,
                         nocache = NULL,
                          user = gh_user(),
                          verbose = FALSE,
                          response = FALSE) {
  pgf_function(
    function_id = function_id,
    base_url = base_url,
    path = path,
    nocache = nocache,
    user = user,
    verbose = verbose,
    response = response,
    table = "parameters"
  )
}

#' Get function properties
#'
#' Get information on function properties.
#'
#' @inheritParams params
#' @return A tibble.
#' @family functions
#' @export
#' @examples
#' \dontrun{
#' function_id <- "fwa_locatealong"
#' base_url <- "https://features.hillcrestgeo.ca/"
#' path <- "fwa"
#' pgf_function_properties(
#'   function_id = function_id, base_url = base_url, path = path
#' )
#' }
pgf_function_properties <- function(function_id,
                                    base_url,
                                    path,
                                    nocache = NULL,
                                    user = gh_user(),
                                    verbose = FALSE,
                                    response = FALSE) {
  pgf_function(
    function_id = function_id,
    base_url = base_url,
    path = path,
    nocache = nocache,
    user = user,
    verbose = verbose,
    response = response,
    table = "properties"
  )
}

#' Get function description
#'
#' Get information on function description.
#'
#' @inheritParams params
#' @return A string.
#' @family functions
#' @export
#' @examples
#' \dontrun{
#' function_id <- "fwa_locatealong"
#' base_url <- "https://features.hillcrestgeo.ca/"
#' path <- "fwa"
#' pgf_function_description(
#'   function_id = function_id, base_url = base_url, path = path
#' )
#' }
pgf_function_description <- function(function_id,
                                    base_url,
                                    path,
                                    nocache = NULL,
                                    user = gh_user(),
                                    verbose = FALSE,
                                    response = FALSE) {
  pgf_function(
    function_id = function_id,
    base_url = base_url,
    path = path,
    nocache = nocache,
    user = user,
    verbose = verbose,
    response = response,
    table = "description",
    tibble = FALSE
  )
}
