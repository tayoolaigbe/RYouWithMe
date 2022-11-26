#Load packages --------------


library(tidyverse)
library(here)
library(skimr)
library(janitor)

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


# tidying columns ---------

glimpse(beaches)

select_all(beaches, tolower)
clean_names(beaches)
names(beaches)

cleanbeaches <- clean_names(beaches)

names(cleanbeaches)

# fro renaming columns: new_name = old_name
cleanbeaches <- rename(cleanbeaches, enterococci_100 = enterococci_cfu_100ml)
