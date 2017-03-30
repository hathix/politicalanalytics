get_turnout <- function(data, zip_vector) {
  in_zips <- data[data$zip %in% zip_vector,]
  voted <- in_zips[in_zips$turn.2016.gen == "Y",]
  turnout <- nrow(voted) / nrow(in_zips)
  return(turnout)
}

# percent of voters in given zips who voted in 2016, given that they voted in 2012
# aka the retention rate of voters from 2012 to 2016
get_turnout_2016_if_2012 <- function(data, zip_vector) {
  in_zips <- data[data$zip %in% zip_vector,]
  voted_2012 <- in_zips[in_zips$turn.2012.gen == "Y",]
  voted_2016 <- voted_2012[voted_2012$turn.2016.gen == "Y",]
  ratio <- nrow(voted_2016) / nrow(voted_2012)
  return(ratio)
}

# percent of voters in given zips who voted in 2016, given that they voted in 2012
# aka the retention rate of voters from 2012 to 2016
get_turnout_2016_if_2012_d <- function(data, zip_vector) {
  dems_in_zips <- subset(data, zip %in% zip_vector & party.reg == "Democratic")
  voted_2012 <- subset(dems_in_zips, turn.2012.gen == "Y")
  voted_2016 <- subset(voted_2012, turn.2016.gen == "Y")
  ratio <- nrow(voted_2016) / nrow(voted_2012)
  return(ratio)
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

get_dem_percent <- function(data, zip_vector) {
  in_zips <- data[data$zip %in% zip_vector,]
  num_dems <- nrow(in_zips[in_zips$party.reg == "Democratic",])
  num_reps <- nrow(in_zips[in_zips$party.reg == "Republican",])
  ratio <- num_dems / (num_dems + num_reps)
  return(ratio)
}