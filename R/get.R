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

  # chk_response_status(resp)
  # table <- response_table(resp, table = table, geojson = geojson,)
  #
  # ## don't need this until paginated requests possible (slows function down)
  # # cont <- response_content(resp)
  # # parsed <- content_parsed(cont)
  #
}
