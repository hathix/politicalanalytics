
source('~/Documents/Git/politicalanalytics/scripts/turnout.R')
data <- read.csv("data/L2/random-samples/UT-randsamp.csv")
zip_data <- read.csv("data/flagships.csv")

ages <- seq(1:100)
# turnouts, inner
inner <- get_inner_zips(zip_data, "UT")
turnouts <- unlist(lapply(ages, function(x) get_turnout_2016_by_exact_age(data, inner, x)))





ages <- seq(1:100)
# turnouts, inner
inner <- get_inner_zips(zip_data, "UT")
inner_turnouts <- unlist(lapply(ages, function(x) get_turnout_2016_by_exact_age(data, inner, x)))
outer <- get_outer_zips(zip_data, "UT")
outer_turnouts <- unlist(lapply(ages, function(x) get_turnout_2016_by_exact_age(data, outer, x)))

# frame <- data.frame(ages, inner_turnouts, outer_turnouts)

frame <- read.csv("out/turnouts.csv")
library(reshape2)
melted <- melt(frame, measure.vars = c("inner_turnouts", "outer_turnouts"))
library(ggplot)
ggplot(aes(x=ages, y=value, color=variable), data=melted) + geom_point() + geom_smooth()