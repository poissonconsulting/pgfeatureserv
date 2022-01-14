function(request) {
  request |>
    gsub_request("https://features.hillcrestgeo.ca/fwa/", "h/", fixed = TRUE)
}
