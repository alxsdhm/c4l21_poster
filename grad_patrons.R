library(tidyverse)
library(stringdist)
grads <- read_csv("fakegrads.csv")
patrons <- read_csv("fakepatrons.csv")
grads <- grads %>%
  mutate(LAST=toupper(LAST)) %>% 
  mutate(FIRST=toupper(FIRST)) %>% 
  unite("NAMEKEY",LAST:FIRST,sep="",remove=FALSE)
patrons <- patrons %>%
  mutate(LAST=toupper(LAST)) %>%
  mutate(FIRST=toupper(FIRST)) %>%
  unite("NAMEKEY",LAST:FIRST,sep="",remove=FALSE)
graduating_patrons <- inner_join(grads,patrons,by="ID")
graduating_patrons <- graduating_patrons %>%
  mutate(SIMILARITY=stringsim(LAST.x,LAST.y))
graduating_patrons %>%
  arrange(SIMILARITY) %>%
  filter(SIMILARITY<0.9)
graduating_patrons