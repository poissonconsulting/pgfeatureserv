### this function is currently designed for json output and not html
# (e.g. if url ends with /items.html vs /items.json)
get_request <- function(url, user, verbose) {

  headers <- add_headers(
    "User-Agent" = user
  )

  resp <- with_config(
    config = config(verbose = verbose, http_version = 2),
    GET(url, headers)
  )

  chk_response_status(resp)
  chk_response_geojson(resp)

  cont <- response_content(resp)
  ## don't need this until paginated requests possible (slows function down)
  # parsed <- content_parsed(cont)
  feat <- content_features(cont)

  structure(
    list(
      # content = parsed,
      features = feat,
      response = resp
    ),
    class = "pgfs_request"
  )
}

