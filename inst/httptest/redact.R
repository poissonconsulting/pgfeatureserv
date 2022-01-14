function(response) {
  response |>
    gsub_response("https://features.hillcrestgeo.ca/fwa/", "h/", fixed = TRUE)
}
