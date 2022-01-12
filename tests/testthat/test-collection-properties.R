test_that("collection properties works", {

  base_url <- "https://features.hillcrestgeo.ca/"
  path <- "fwa"
  collection_id <- "whse_basemapping.fwa_wetlands_poly"

  x <- pgf_collection_properties(collection_id = collection_id,
                                 base_url = base_url,
                                 path = path)
  expect_s3_class(x, "tbl_df")
  expect_identical(names(x), c("name", "type", "description"))
})

test_that("collection properties can return response", {

  base_url <- "https://features.hillcrestgeo.ca/"
  path <- "fwa"
  collection_id <- "whse_basemapping.fwa_wetlands_poly"

  x <- pgf_collection_properties(collection_id = collection_id,
                                 base_url = base_url,
                                 path = path,
                                 response = TRUE)

  expect_s3_class(x, "pgfs_request")
  expect_s3_class(x$response, "response")
})
