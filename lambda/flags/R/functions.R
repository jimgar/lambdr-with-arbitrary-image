library(httr2)

create_request <- function(country) {
  stopifnot("'country' must be a string containing a full or partial country name, e.g. 'ghana'" = nzchar(country))
  country <- utils::URLencode(country)

  base_url <- "https://restcountries.com/v3.1/name/"

  httr2::request(base_url) |>
    httr2::req_user_agent(
      "lambdr example (https://github.com/mdneuzerling/lambdr/)"
    ) |>
    httr2::req_url_path_append(country) |>
    httr2::req_url_query(fields = "flags")
}

unsuccessful <- function(resp) {
  body <- httr2::resp_body_json(resp)
  msg <- sprintf("\nHTTP %s: %s.\n", body$status, body$message)
  stop(
    msg,
    "Check supplied country name is valid and/or the server status."
  )
}

perform_request <- function(req) {
  resp <- req |>
    httr2::req_error(is_error = \(x) FALSE) |>
    httr2::req_perform()

  if (resp[["status_code"]] != 200L) {
    unsuccessful(resp)
  }

  return(httr2::resp_body_json(resp))
}
