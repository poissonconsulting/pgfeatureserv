httptest::with_mock_api({
  test_that("function properties works", {
    function_id <- "fwa_locatealong"
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    x <- pgf_function_properties(function_id,
                                 base_url = base_url,
                                 path = path
    )

    expect_s3_class(x, "tbl_df")
    expect_identical(nrow(x), 1L)
    expect_identical(names(x), c("name", "type", "description"))
  })

  test_that("function parameters works", {
    function_id <- "fwa_locatealong"
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    x <- pgf_function_parameters(function_id,
                                 base_url = base_url,
                                 path = path
    )

    expect_s3_class(x, "tbl_df")
    expect_identical(nrow(x), 2L)
    expect_identical(names(x), c("name", "type", "description"))
  })

  test_that("function description works", {
    function_id <- "fwa_locatealong"
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    x <- pgf_function_description(function_id,
                                  base_url = base_url,
                                  path = path
    )

    expect_type(x, "character")
    expect_length(x, 1L)
  })

})
