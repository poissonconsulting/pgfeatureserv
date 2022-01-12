### this function is currently designed for json output and not html
# (e.g. if url ends with /items.html vs /items.json)
get_request <- function(url, user, verbose = FALSE, geojson = TRUE) {

  headers <- add_headers(
    "User-Agent" = user
  )

  resp <- with_config(
    config = config(verbose = verbose, http_version = 2),
    GET(url, headers)
  )

  chk_response_status(resp)
  # cont <- response_content(resp)

  table <- response_table(resp, geojson = geojson)

  ## don't need this until paginated requests possible (slows function down)
  # parsed <- content_parsed(cont)

  structure(
    list(
      # content = parsed,
      table = table,
      response = resp
    ),
    class = "pgfs_request"
  )
}

