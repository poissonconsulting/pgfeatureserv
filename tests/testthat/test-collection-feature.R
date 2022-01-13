test_that("collection feature can return response", {
  collection_id <- "whse_basemapping.fwa_named_streams"
  feature_id <- 2
  base_url <- "https://features.hillcrestgeo.ca/"
  path <- "fwa"

  x <- pgf_collection_feature(collection_id,
                              feature_id = feature_id,
                               base_url = base_url,
                               path = path,
                              response = TRUE
  )

  expect_s3_class(x, "pgfs_request")
  expect_s3_class(x$response, "response")
})

test_that("collection feature works with default values ", {

  collection_id <- "whse_basemapping.fwa_named_streams"
  feature_id <- 2
  base_url <- "https://features.hillcrestgeo.ca/"
  path <- "fwa"

  x <- pgf_collection_feature(collection_id,
                              feature_id = feature_id,
                              base_url = base_url,
                              path = path
  )

  expect_s3_class(x, "sf")
  expect_s3_class(x, "tbl_df")
  expect_s3_class(x$geometry, "sfc_MULTILINESTRING")
  expect_identical(sf::st_crs(x)$epsg, 4326L)
  expect_identical(colnames(sf::st_coordinates(x)), c("X", "Y", "L1", "L2"))
})
