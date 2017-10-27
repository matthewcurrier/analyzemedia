load("C:/Users/mcurr/Google Drive/R/Packages/miscmatt/data/sem_data.rda")
devtools::use_data(sem_data, overwrite = TRUE)



marin_results <- "C:/Users/mcurr/Google Drive/R/Packages/miscmatt/data/marin_results.csv"
marin_results <- read.csv(marin_results, stringsAsFactors = F)

library(janitor)
library(tidyverse)
marin_results <- clean_names(marin_results)
marin_results$account <- sub("Invoice2go", "A Company", marin_results$account)


marin_results <- marin_results %>% select(-avg_cpc, -conv_rate)
