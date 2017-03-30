get_turnout <- function(data, zip_vector) {
  in_zips <- data[data$zip %in% zips,]
  voted <- in_zips[in_zips$turn.2016.gen == "Y",]
  turnout <- nrow(voted) / nrow(in_zips)
  return(turnout)
}

get_inner_zips <- function(zip_data, state) {
  zip_row <- zip_data[zip_data$State == state,]
  inner_zip_list_string <- zip_row$Inner.ZIPs
  inner_zip_list <- lapply(inner_zip_list_string, function(x) as.vector(strsplit(as.character(x), ", "))[[1]])[[1]]
  return(inner_zip_list)
}

get_outer_zips <- function(zip_data, state) {
  zip_row <- zip_data[zip_data$State == state,]
  outer_zip_list_string <- zip_row$Peripheral.ZIPs
  outer_zip_list <- lapply(outer_zip_list_string, function(x) as.vector(strsplit(as.character(x), ", "))[[1]])[[1]]
  return(outer_zip_list)
}