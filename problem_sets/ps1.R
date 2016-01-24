# Preliminaries
rm(list=ls())
source("helper/useful.R")

# Data cleaning
d <- read.csv("data/janiszewski_rep_exercise.csv")

# head(d)
# unique(d$WorkerId)
summary(d)
# min(d$Answer.dog_cost)
# levels(d$Answer.dog_cost)

d$Answer.dog_cost <- revalue(d$Answer.dog_cost, c("five hundred" = 500))
d$Answer.sushi_cost <- revalue(d$Answer.sushi_cost, c("7,75" = 7.75, "ehight" = 8))
d$Answer.plasma_cost <- revalue(d$Answer.plasma_cost, c("4,000" = 4000, "0.45" = 4500))

d <- transform(d, Answer.dog_cost=as.numeric(d$Answer.dog_cost))
d <- transform(d, Answer.plasma_cost=as.numeric(d$Answer.plasma_cost))
d <- transform(d, Answer.sushi_cost=as.numeric(d$Answer.sushi_cost))

