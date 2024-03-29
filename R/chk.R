chk_response_status <- function(x) {
  if (vld_response_status(x)) {
    return(invisible(x))
  }
  msg <- status_msg(x)
  cd <- status_code(x)
  abort_chk(glue("API request failed [{cd}]: {msg}"))
}

chk_response_geojson <- function(x) {
  if (vld_response_geojson(x)) {
    return(invisible())
  }
  msg <- status_msg(x)
  abort_chk(glue("API did not return GeoJSON: {msg}"))
}

chk_response_json <- function(x) {
  if (vld_response_json(x)) {
    return(invisible())
  }
  msg <- status_msg(x)
  abort_chk(glue("API did not return JSON: {msg}"))
}
