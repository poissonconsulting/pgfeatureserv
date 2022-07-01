httptest::with_mock_dir("fr", {
  test_that("function can return response", {
    function_id <- "fwa_locatealong"
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    parameters <- list(
      blue_line_key = 356308001,
      downstream_route_measure = 0
    )

    x <- pgf_function_result(function_id,
                             base_url = base_url,
                             path = path,
                             parameters = parameters,
                             limit = 1,
                             response = TRUE,
                             nocache = 'true'
    )

    expect_s3_class(x, "pgfs_request")
    expect_s3_class(x$response, "response")
  })

  test_that("function works", {
    function_id <- "fwa_locatealong"
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    parameters <- list(
      blue_line_key = 356308001,
      downstream_route_measure = 100
    )

    x <- pgf_function_result(function_id,
                             base_url = base_url,
                             path = path,
                             parameters = parameters,
                             nocache = 'true'
    )

    expect_s3_class(x, "sf")
    expect_identical(nrow(x), 1L)
  })

  test_that("function informative error invalid function_id", {
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    parameters <- list(
      blue_line_key = 356308001,
      downstream_route_measure = 0
    )

    expect_chk_error(
      pgf_function_result("not_a_function",
                          base_url = base_url,
                          path = path,
                          parameters = parameters,
                          nocache = 'true'
      ),
      "API request failed \\[404\\]: Function not found: postgisftw.not_a_function"
    )
  })

  test_that("function informative error invalid transform", {
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    parameters <- list(
      blue_line_key = 356308001,
      downstream_route_measure = 0
    )

    expect_chk_error(
      pgf_function_result("fwa_locatealong",
                          base_url = base_url,
                          path = path,
                          parameters = parameters,
                          transform = "not_a_transform",
                          nocache = 'true'
      ),
      "API request failed \\[400\\]: Invalid value for parameter transform: not_a_transform"
    )
  })

  test_that("function informative error bounding box", {
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    parameters <- list(
      blue_line_key = 356308001,
      downstream_route_measure = 0
    )

    expect_chk_error(
      pgf_function_result("fwa_locatealong",
                          base_url = base_url,
                          path = path,
                          parameters = parameters,
                          bbox = 1,
                          nocache = 'true'
      ),
      "API request failed \\[400\\]: Invalid value for parameter bbox: 1"
    )
  })
})

