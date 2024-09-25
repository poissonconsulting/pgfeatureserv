httptest::with_mock_dir("cf", {
  test_that("collection feature can return response", {
    collection_id <- "whse_basemapping.fwa_named_streams"
    feature_id <- 2
    base_url <- "https://features.hillcrestgeo.ca/"
    path <- "fwa"

    expect_defunct({
      pgf_collection_feature(collection_id,
                                  feature_id = feature_id,
                                  base_url = base_url,
                                  path = path,
                                  nocache = 'true'
      )
    })
  })
})

