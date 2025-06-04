httptest::with_mock_dir("cs", {
  test_that("collections information works", {
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"
    x <- pgf_collections(
      base_url = base_url,
      path = path,
      nocache = "true"
    )
    expect_s3_class(x, "tbl_df")
    expect_identical(names(x), c(
      "id", "title", "description", "extent", "links"
    ))
  })

  test_that("collections collection_id values haven't changed", {
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"
    x <- pgf_collections(
      base_url = base_url,
      path = path,
      nocache = "true"
    )
    expect_snapshot_data(x$id, "collections")
  })

  test_that("collection properties can return response", {
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    x <- pgf_collections(
      base_url = base_url,
      path = path,
      response = TRUE,
      nocache = "true"
    )

    expect_s3_class(x, "pgfs_request")
    expect_s3_class(x$response, "response")
  })
})
