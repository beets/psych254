rm(list=ls())
library(ggplot2)
library(tidyr)
library(dplyr)

head(iris)
unique(iris$Species)
hist(iris$Sepal.Width)
qplot(Sepal.Width, data=iris)

tidy.iris <- iris %>%
  group_by(Species) %>%
  mutate(index = 1:n()) %>%
  gather(measure_name, measure_value,
         Sepal.Length, Sepal.Width,
         Petal.Length, Petal.Width) %>% 
  spread(measure_value, measure_name)

qplot(measure_value, facets = ~ Species, data = tidy.iris)
