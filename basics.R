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

# selecting a subset of data and saving them in a new variable
selected_data <- select(cleanbeaches, council, site, enterococci_100)

# using pipes

cleanbeaches <- beaches %>%
  clean_names() %>%
  rename(enterococci_100 = enterococci_cfu_100ml) %>%
  select(council, site, enterococci_100)

write.csv(cleanbeaches, "cleanbeaches.csv")

# which beach has the most extreme level of bugs

cleanbeaches %>% arrange(desc(enterococci_cfu_100ml))

cleanbeaches %>% 
  filter(council == "Waverley Council") %>%
  arrange(-enterococci_cfu_100ml)

#lets compare max bugs values across different beaches
coogee_bondi <- cleanbeaches %>%
  filter(site %in% c("Bondi Beach", "Coogee Beach")) %>%
  arrange(-enterococci_cfu_100ml)
  

# using summarise  na.rm = TRUE -----> means remove na

coogee_bondi_summary <- cleanbeaches %>%
  filter(site %in% c("Bondi Beach", "Coogee Beach")) %>%
  group_by(site) %>%
  summarise(maxbug = max(enterococci_cfu_100ml, na.rm = TRUE),
            minbug = min(enterococci_cfu_100ml, na.rm = TRUE),
            meanbug = mean(enterococci_cfu_100ml, na.rm = TRUE),
            sdbugs = sd(enterococci_cfu_100ml, na.rm = TRUE))