structure(list(
  url = "h/collections/not_a_collection/items.json?limit=10000&offset=0&nocache=true",
  status_code = 404L, headers = structure(list(
    server = "nginx/1.18.0 (Ubuntu)",
    date = "Thu, 19 Sep 2024 16:31:17 GMT", `content-type` = "text/plain; charset=utf-8",
    `content-length` = "54", connection = "keep-alive", `content-encoding` = "gzip",
    vary = "Accept-Encoding", `x-content-type-options` = "nosniff"
  ), class = c(
    "insensitive",
    "list"
  )), all_headers = list(list(
    status = 404L, version = "HTTP/1.1",
    headers = structure(list(
      server = "nginx/1.18.0 (Ubuntu)",
      date = "Thu, 19 Sep 2024 16:31:17 GMT", `content-type` = "text/plain; charset=utf-8",
      `content-length` = "54", connection = "keep-alive",
      `content-encoding` = "gzip", vary = "Accept-Encoding",
      `x-content-type-options` = "nosniff"
    ), class = c(
      "insensitive",
      "list"
    ))
  )), cookies = structure(list(
    domain = logical(0),
    flag = logical(0), path = logical(0), secure = logical(0),
    expiration = structure(numeric(0), class = c(
      "POSIXct",
      "POSIXt"
    )), name = logical(0), value = logical(0)
  ), row.names = integer(0), class = "data.frame"),
  content = charToRaw("Collection not found: not_a_collection\n"),
  date = structure(1726763477, class = c("POSIXct", "POSIXt"), tzone = "GMT"), times = c(
    redirect = 0, namelookup = 1.3e-05,
    connect = 0, pretransfer = 8.1e-05, starttransfer = 0.091077,
    total = 0.091112
  )
), class = "response")
