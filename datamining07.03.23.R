#installing data from github library
devtools::install_github("bradleyboehmke/harrypotter")
#importing libraries
library(tidyverse) #data manipulating and plotting
library(stringr)#text cleaning and regular expressions
library(tidytext)#text mining tasks
library(harrypotter)#harry potter books
#viewing raw text
View(philosophers_stone[1:2])
#tibbling
text_tb<- tibble(chapter=seq_along(philosophers_stone),text=philosophers_stone)
View(text_tb)
#Applying unnest token(split to single words,remove punctuation & convert)
text_tb%>%unnest_tokens(word,text)
text_tb
#books names
titles <- c("philosophers stone","chamber of secrets","prisoner of azkaban"
            ,"goblet of fire","order of the phoenix","half blood prince",
            "Deathly hallows")
titles
#books list
books<- list(philosophers_stone,chamber_of_secrets,prisoner_of_azkaban
,goblet_of_fire,order_of_the_phoenix,half_blood_prince,
deathly_hallows)
View(books)

#tibbling &unnest token for all boooks
series <- tibble()
for(i in seq_along(titles)){
  clean<-tibble(chapter=seq_along(books[[i]]),text=books[[i]])%>%
                  unnest_tokens(word,text)%>%mutate(book=titles[i]) %>%
                  select(book,everything())
                series<-rbind(series,clean)}
View(clean)
View(series)
#
