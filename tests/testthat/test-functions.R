httptest::with_mock_dir("fs", {
  test_that("functions information works", {
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"
    x <- pgf_functions(
      base_url = base_url,
      path = path,
      nocache = 'true'
    )
    expect_s3_class(x, "tbl_df")
    expect_identical(names(x), c("id", "description", "links"))
  })

  test_that("collection properties can return response", {
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    x <- pgf_functions(
      base_url = base_url,
      path = path,
      response = TRUE,
      nocache = 'true'
    )

    expect_s3_class(x, "pgfs_request")
    expect_s3_class(x$response, "response")
  })
})
