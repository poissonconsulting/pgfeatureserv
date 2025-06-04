httptest::with_mock_dir("get", {
  test_that("get_request works", {
    url <- "https://features.hillcrestgeo.ca/fwa/collections/whse_basemapping.fwa_wetlands_poly/items.json"
    url <- modify_url(url, query = list(limit = 1))
    x <- get_request(url, user = "test", verbose = FALSE)
    expect_type(x, "list")
    expect_s3_class(x, "pgfs_request")
    expect_identical(names(x), c("response"))
  })
})
