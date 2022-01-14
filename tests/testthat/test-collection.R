httptest::with_mock_api({
  test_that("collection properties works ", {
    collection_id <- "whse_basemapping.fwa_named_streams"
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    x <- pgf_collection_properties(collection_id,
                                   base_url = base_url,
                                   path = path
    )
    expect_s3_class(x, "tbl_df")
    expect_identical(nrow(x), 5L)
    expect_identical(names(x), c("name", "type", "description"))
  })

  test_that("collection description works ", {
    collection_id <- "whse_basemapping.fwa_named_streams"
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    x <- pgf_collection_description(collection_id,
                                    base_url = base_url,
                                    path = path
    )
    expect_type(x, "character")
    expect_length(x, 1L)
  })

  test_that("collection crs works ", {
    collection_id <- "whse_basemapping.fwa_named_streams"
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    x <- pgf_collection_crs(collection_id,
                            base_url = base_url,
                            path = path
    )
    expect_type(x, "character")
    expect_length(x, 1L)
  })

  test_that("collection bbox works ", {
    collection_id <- "whse_basemapping.fwa_named_streams"
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    x <- pgf_collection_bbox(collection_id,
                             base_url = base_url,
                             path = path
    )
    expect_type(x, "double")
    expect_length(x, 4L)
  })

  test_that("collection geometry_type works ", {
    collection_id <- "whse_basemapping.fwa_named_streams"
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    x <- pgf_collection_geometry_type(collection_id,
                                      base_url = base_url,
                                      path = path
    )
    expect_type(x, "character")
    expect_length(x, 1L)
  })
})
