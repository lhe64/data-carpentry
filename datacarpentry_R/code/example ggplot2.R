library(dplyr)
library(praise)
reduced <- read.csv(file="http://kbroman.org/datacarp/portal_data_reduced.csv")
library(ggplot2)
ggplot(reduced, aes(x = weight, y = hindfoot_length)) + geom_point()
p1 <- ggplot(reduced, aes(x=weight, y=hindfoot_length))
p2 <- p1 + geom_point()
print(p2)
p2 + scale_x_log10()
p2 + scale_x_sqrt()
surveys_plot <- ggplot(reduced, aes(x = weight, y = hindfoot_length))
surveys_plot + geom_point(alpha = 0.1)
surveys_plot + geom_point(alpha = 0.1, color = "slateblue")
surveys_plot + geom_point(alpha = 0.1, color = "slateblue", size=0.5)
surveys_plot + geom_point(aes(color = species_id))
count_by_year <- reduced %>%
  group_by(year) %>%
  tally

p <- ggplot(count_by_year, aes(x=year, y=n))
p + geom_line()
p + geom_line() + geom_point()
p + geom_line(color="lightblue") + geom_point(color="violetred")
p + geom_point(color="violetred") + geom_line(color="lightblue")







# count_by_year <- reduced %>%
#   filter(species_id %in% c("DM", "DS"))%>%
#   group_by(year,species_id) %>%
#   tally
# ggplot(count_by_year, aes(x=year,y=n,group=species_id))+geom_point(aes(color=species_id))+geom_line()
# 
# ggplot(reduced, aes(x=weight))+geom_histogram(bins=8)
# 
# ggplot(reduced, aes(x=species_id,y=weight))+geom_jitter(color="tomato")+geom_boxplot()
# 
# yearly_count2 <- reduced %>% group_by(year,species_id) %>% tally
# yearly_count2
# ggplot(yearly_count2,aes(x=year,y=n,group=species_id,color=species_id))+geom_line()
# 
# ggplot(yearly_count2,aes(x=year,y=n,group=species_id,color=species_id))+geom_line()+facet_wrap(~species_id)


p + geom_line() + geom_point(aes(color=year))
p + geom_line() + geom_point() + aes(color=year)
counts_dm_ds <- reduced %>% filter(species_id %in% c("DM", "DS")) %>%
  group_by(species_id, year) %>% tally
p <- ggplot(counts_dm_ds, aes(x=year, y=n))
p + geom_line() + geom_point(aes(color=species_id))
p + geom_line() + geom_point() + aes(color=species_id)
p + aes(group=species_id) + geom_line() + geom_point(aes(color=species_id))
ggplot(reduced, aes(x = species_id, y = hindfoot_length)) +
  geom_boxplot()
ggplot(reduced, aes(x = species_id, y = hindfoot_length)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato")
yearly_counts <- reduced %>% group_by(year, species_id) %>% tally
ggplot(yearly_counts, aes(x = year, y = n, group = species_id, colour = species_id)) +
  geom_line() +
  facet_wrap(~ species_id)
yearly_weight <- reduced %>%
  group_by(year, species_id, sex) %>%
  summarise(avg_weight = mean(weight, na.rm = TRUE))
ggplot(yearly_weight, aes(x=year, y=avg_weight, color = species_id, group = species_id)) +
  geom_line() +
  facet_wrap(~ species_id)
yearly_weight <- reduced %>%
  group_by(year, species_id, sex) %>%
  summarise(avg_weight = mean(weight, na.rm = TRUE))
ggplot(yearly_weight, aes(x=year, y=avg_weight, color = sex, group = sex)) +
  geom_line() +
  facet_wrap(~ species_id)
## One column, facet by rows
yearly_weight %>% filter(species_id %in% c("DM", "DO", "DS")) %>%
  ggplot(aes(x=year, y=avg_weight, color = species_id, group = species_id)) +
  geom_line() +
  facet_grid(sex ~ .)
# One row, facet by column
yearly_weight %>% filter(species_id %in% c("DM", "DO", "DS")) %>%
  ggplot(aes(x=year, y=avg_weight, color = species_id, group = species_id)) +
  geom_line() +
  facet_grid( ~ sex)
# separate panel for each sex and species
yearly_weight %>% filter(species_id %in% c("DM", "DO", "DS")) %>%
  ggplot(aes(x=year, y=avg_weight, color = species_id, group = species_id)) +
  geom_line() +
  facet_grid(species_id ~ sex)
p <- ggplot(reduced, aes(x=weight, y=hindfoot_length)) + geom_point()
ggsave("scatter.png", p, height=6, width=8)
ggsave("scatter.pdf", p, height=6, width=8)
ggsave("scatter_2.png", p, height=6, width=8, scale=0.8)
xrange <- range(reduced$weight)
yrange <- range(reduced$hindfoot_length)

p <- reduced %>% filter(species_id=="DM") %>%
  ggplot(aes(x=weight, y=hindfoot_length)) +
  geom_point()
p + scale_x_log10(limits=xrange) +
  scale_y_continuous(limits=yrange)
p <- reduced %>% filter(species_id %in% c("DM", "DS", "DO")) %>%
  ggplot(aes(x=weight, y=hindfoot_length)) +
  geom_point(aes(color=species_id))

colors <- c("blue", "green", "orange")
p + scale_color_manual(values=colors)
hexcolors <- c("#001F3F", "#0074D9", "#01FF70")
p + scale_color_manual(values=hexcolors)
p + theme_bw()
