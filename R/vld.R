vld_response_status <- function(x) {
  !http_error(x)
}

vld_response_gateway <- function(x) {
  !(http_error(x) && status_code(x) == 502)
}

vld_response_geojson <- function(x) {
  http_type(x) == "application/geo+json"
}

vld_response_json <- function(x) {
  http_type(x) == "application/json"
}
