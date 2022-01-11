format_parameter <- function(x) {
  if (is.null(x)) {
    return(x)
  }
  paste(x, collapse = ",")
}

status_msg <- function(x) {
  y <- content(x, "text", encoding = "UTF-8")
  if (vld_response_json(x)) {
    return(jsonlite::fromJSON(y))
  }
  y
}

format_parameter <- function(x) {
  if (is.null(x)) {
    return(x)
  }
  paste(x, collapse = ",")
}

# this prevents scientific notation
format_number <- function(x) {
  format(x, scientific = FALSE)
}

response_content <- function(x) {
  content(x, "text", encoding = "UTF-8")
}

content_features <- function(x) {
  x <- geojsonsf::geojson_sf(x)
  class(x) <- c("sf", "tbl", "tbl_df", "data.frame")
  x
}

content_parsed <- function(x) {
  # flatten = FALSE is slightly faster
  jsonlite::fromJSON(x, flatten = FALSE)
}
