load("C:/Users/mcurr/Google Drive/R/Packages/miscmatt/data/sem_data.rda")
devtools::use_data(sem_data, overwrite = TRUE)



marin_results <- "C:/Users/mcurr/Google Drive/R/Packages/miscmatt/data/marin_results.csv"
marin_results <- read.csv(marin_results, stringsAsFactors = F)

library(janitor)
library(tidyverse)
marin_results <- clean_names(marin_results)
marin_results$account <- sub("Invoice2go", "A Company", marin_results$account)


marin_results <- marin_results %>% select(-avg_cpc, -conv_rate)


write.csv(marin_results, "marin_results.csv")
library(readxl)
library(stringr)
marin_results <- read_excel("marin_results.xlsx", 'marin_results')
marin_results$undersc_count <- str_count(marin_results$campaign, "_")
marin_results <- separate(marin_results, campaign, into = c("region", "country", "lang", "engine", "brand_nonbrand", "device"), "_")
marin_results <- marin_results %>% select(-status, -undersc_count, -start_date, -end_date)

marin_results <- as.data.frame(marin_results)
devtools::use_data(marin_results, overwrite = TRUE)

bookings <- readxl::read_excel("bookings_data.xlsx", "bookings")
bookings$channel <- stringr::str_replace(bookings$channel, "::", "")

bookings$channel <- stringr::str_replace(bookings$channel, "unspecified", "Unspecified")

devtools::use_data(bookings, overwrite = TRUE)

library(lubridate)
b <- bookings
b$day <- as.Date(b$day)
bookings_2013 <- b
bookings_2013$day <- as.Date(bookings_2013$day)
bookings_2013$day <- bookings_2013$day %m+% years(-1)

bookings_2013$value <- abs(round(bookings_2013$value + rnorm(nrow(bookings_2013), mean=50, sd=150), digits = 0))

bookings2 <- rbind(b, bookings_2013)
bookings2$day <- as.Date(bookings2$day)


bookings2 <- as.data.frame(bookings2)
devtools::use_data(bookings2, overwrite = TRUE)


library(xtable)


data(mtcars)
mtcars$cyl <- factor(mtcars$cyl, levels = c("4","6","8"),
                     labels = c("four","six","eight"))
tbl <- ftable(mtcars$cyl, mtcars$vs, mtcars$am, mtcars$gear,
              row.vars = c(2, 4),
              dnn = c("Cylinders", "V/S", "Transmission", "Gears"))




xftbl <- xtableFtable(bookings2_test2)

print.xtableFtable(xftbl, booktabs = TRUE)

