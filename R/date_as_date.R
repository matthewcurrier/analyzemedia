#' Scan column names of dataframe for 'date' columns, then convert to date.
#'
#' This function has five arguments.
#' @param df Dataframe to analyze.
#' @keywords date, convert-to-date
#' @export
#' @examples
#' df <- data.frame(Date=Sys.time(), c1="baba", date=Sys.time(), val=234)
#' date_as_date(df)

date_as_date <- function(df){
  library(anytime)
  cn <- tolower(colnames(df))

  #identify which columns match the word 'date' exactly, disregarding case
  r <- which(cn %in% "date")

  #loop through columns. Convert to timestamp via anytime, then date.
  for(i in 1:length(r)) {
    df[, r[i]] <- as.Date(anytime(df[, r[i]]))
  }
  return(df)
}




