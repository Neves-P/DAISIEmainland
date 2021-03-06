#' Updates the island_spec when an immigration event occurs
#'
#' @inheritParams default_params_doc
#'
#' @return A data frame
immig_event <- function(
  timeval,
  island_spec,
  mainland_spec) {
  colonist <- DDD::sample2(mainland_spec, 1)
  if (length(island_spec[, "spec_id"]) != 0) {
    isitthere <- which(island_spec[, "spec_id"] == colonist)
  } else {
    isitthere <- c()
  }
  if (length(isitthere) == 0) {
    island_spec <- rbind(
      island_spec,
      data.frame(spec_id = colonist,
                 main_anc_id = colonist,
                 col_t = timeval,
                 spec_type = "I",
                 branch_code = as.character(NA),
                 branch_t = NaN,
                 ana_origin = as.character(NA)))
  }
  if (length(isitthere) != 0) {
    island_spec[isitthere, ] <- data.frame(spec_id = colonist,
                                           main_anc_id = colonist,
                                           col_t = timeval,
                                           spec_type = "I",
                                           branch_code = as.character(NA),
                                           branch_t = NaN,
                                           ana_origin = as.character(NA))
  }
  return(island_spec)
}
