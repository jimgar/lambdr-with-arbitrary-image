library(lambdr)
library(logger)
source(file.path("R", "functions.R"))

logger::log_threshold(logger::DEBUG)

handler <- function(country) {
  logger::log_info("Event received:", country)

  req <- create_request(country)
  resp <- perform_request(req)

  return(resp)
}

if (!interactive()) {
  lambdr::start_lambda()
}
