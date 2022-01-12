test_that("collections information works", {
  base_url <- "https://features.hillcrestgeo.ca/"
  path <- "fwa"
  x <- pgf_collections(base_url = base_url,
                       path = path)
  expect_s3_class(x, "tbl_df")
  expect_identical(names(x), c("id", "title", "description",
                               "links", "extent.spatial.crs",
                               "extent.spatial.bbox"))
})

test_that("collection properties can return response", {

  base_url <- "https://features.hillcrestgeo.ca/"
  path <- "fwa"

  x <- pgf_collections(base_url = base_url,
                                 path = path,
                                 response = TRUE)

  expect_s3_class(x, "pgfs_request")
  expect_s3_class(x$response, "response")
})
