library(tidyverse)
library(fuzzyjoin)
library(stringdist)
kb <- read_csv("knowledge_base_package.csv")
catalog <- read_csv("print_holdings.csv")
#clean up the titles to make them easier to match, convert to lower because string distance is case sensitive
catalog <- catalog %>%
  mutate(title=gsub("&","and",title))
kb <- kb %>% 
  mutate(title=gsub("&","and",title))
catalog <- catalog %>%
  mutate(title=gsub("[[:punct:]]","",title)) %>%
  mutate(title=gsub("\\+s"," ",title)) %>%
  mutate(title=tolower(title))
kb <- kb %>%
  mutate(title=gsub("[[:punct:]]","",title)) %>%
  mutate(title=gsub("\\s+"," ",title)) %>%
  mutate(title=tolower(title))
#knock out the titles that match on issn
issn_match <- inner_join(kb,catalog,by="issn",na_matches="never")
#isolate kb titles that still need a match
kb_needmatch <- anti_join(kb,issn_match,by="issn") 
#fuzzy string matching--it's possible to skip some of the cleaning steps and increase your max distance, but i found that gave me more to sort through at the end
title_match <- stringdist_inner_join(kb_needmatch,catalog,by="title",max_dist=2,method=c("lv"))
#separate the titles that don't match on title or issn
kb_needmatch <- anti_join(kb_needmatch,title_match,by=c("title"="title.x"))
title_match <- title_match %>%
  select(title.x,title.y,issn.x,issn.y)
#calculate similarity on title matches
title_match <- title_match %>%
  mutate(similarity=stringsim(title.x,title.y)) %>% 
  arrange(similarity)
#filter for titles to review
title_match %>% filter(similarity<0.9)