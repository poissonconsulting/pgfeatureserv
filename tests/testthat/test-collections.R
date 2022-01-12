test_that("collections information works", {
  base_url <- "https://features.hillcrestgeo.ca/"
  path <- "fwa"
  x <- pgf_collections(base_url = base_url,
                       path = path)
  x <- x$table
  expect_s3_class(x, "tbl_df")
  expect_identical(names(x), c("id", "title", "description",
                               "links", "extent.spatial.crs",
                               "extent.spatial.bbox"))
})
