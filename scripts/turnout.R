get_turnout <- function(data, zip_vector) {
  in_zips <- data[data$zip %in% zips,]
  voted <- in_zips[in_zips$turn.2016.gen == "Y",]
  turnout <- nrow(voted) / nrow(in_zips)
  return(turnout)
}

get_inner_zips <- function(data) {
  
}