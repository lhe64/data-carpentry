#dplyr
#install.packages("dplyr")
#getwd()
#setwd("C:/Users/linhe/Desktop/datacarpentry_R/code")
#getwd()
#install.packages("praise")
library(dplyr)
library(praise)
surveys <- read.csv(file="http://kbroman.org/datacarp/portal_data_joined.csv")
selected_col <- select(surveys,plot_id,species_id,weight)
surveys1995 <- filter(surveys, year==1995)
surveys$year==1995
praise()
surveys%>% #pipe
  filter(weight<5) %>% # the output after pipe is the input for the second function
  select(species_id, sex, weight)
filter(surveys, weight<5)
surveys%>%
  filter(year<1995)%>%
  select(year,sex,weight)
#pipe shortcuts - ctrl-shift-m
surveys_weight_kg <- surveys %>%
  mutate(weight_kg=weight/1000)
surveys %>% 
  group_by(sex) %>% 
  tally() #counting how many in each group
?tally
surveys %>% 
  count(sex)
surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight=mean(weight,na.rm=T))
surveys %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE)) %>%
  filter(!is.na(mean_weight)) %>%
  arrange(desc(mean_weight))
surveys %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE),
            min_weight = min(weight, na.rm = TRUE)) %>%
  filter(!is.na(mean_weight)) %>%
  arrange(desc(mean_weight))
surveys_complete <- surveys %>%
  filter(species_id != "", !is.na(weight)) %>%
  filter(!is.na(hindfoot_length), sex != "")
# count records per species
species_counts <- surveys_complete %>%
  group_by(species_id) %>%
  tally

head(species_counts)

# get names of the species with counts >= 10
frequent_species <-  species_counts %>%
  filter(n >= 10) %>%
  select(species_id)

# filter out the less-frequent species
reduced <- surveys_complete %>%
  filter(species_id %in% frequent_species$species_id)
