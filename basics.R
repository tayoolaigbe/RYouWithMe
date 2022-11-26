#Load packages --------------


library(tidyverse)
library(here)
library(skimr)

# Read the data ------------
beaches <- read.csv(here("data", "sydneybeaches.csv"))

#Exploring the data
View(beaches)
dim(beaches)
str(beaches)
glimpse(beaches)
head(beaches)
tail(beaches)
summary(beaches)
skim(beaches)