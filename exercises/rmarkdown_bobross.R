# Bob Ross Painting Analysis
# # install necessary packages & load
# if(!require(somepackage)){
#   install.packages(c("rmarkdown", "bookdown"))
#   library(c("rmarkdown", "bookdown"))
# }

library(tidyverse)
library(stringr)

# source: tidytuesday (06.08.2019, https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-08-06)

# painting

#bob_ross <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-08-06/bob-ross.csv")

#saveRDS(bob_ross, "bob_ross.rds")
# read in dataframe


# elements by season
season_elements <- bob_ross %>%
  filter(element == "waterfall" | element == "mountain" | element == "lake") %>%
  group_by(season, element) %>%
  summarise(n = n())

# line plot elements by season
ggplot(season_elements) +
  geom_line(aes(season, n, color = element))
  
# overall occurence of elements
nature_elements_nr <- bob_ross %>%
  filter(element == "waterfall" | element == "mountain" | element == "lake") %>%
  group_by(element) %>%
  summarise(n = n())

# bar graph with occurence
ggplot(nature_elements_nr) +
  geom_bar(aes(element, n), stat = "identity")

