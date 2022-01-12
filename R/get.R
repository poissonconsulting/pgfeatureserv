### this function is currently designed for json output and not html
# (e.g. if url ends with /items.html vs /items.json)
get_request <- function(url, user, verbose = FALSE) {
  headers <- add_headers(
    "User-Agent" = user
  )

  resp <- with_config(
    config = config(verbose = verbose, http_version = 2),
    GET(url, headers)
  )

  chk_response_status(resp)

  # eventually this list will be populated with pages once pagination is
  # implemented
  structure(
    list(
      response = resp
    ),
    class = "pgfs_request"
  )
}
