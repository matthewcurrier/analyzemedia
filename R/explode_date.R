#' Create column for each component of data (ie, year, month, day).
#'
#' This function has five arguments.
#' @param df Dataframe to analyze.
#' @param date Name of date column for dataset.
#' @keywords explode date, year, month, day
#' @export
#' @examples
#' explode_date(df, "date")

explode_date <- function(df, date) {
  df <- as.data.frame(df) #Tibbles don't responed well to this function.

  df[, "y"] <- format(df[, date], '%Y')
  df[, "q"] <- lubridate::quarter(df[, date])
  df[, "m"] <- format(df[, date], '%m')
  df[, "d"] <- format(df[, date], '%d')
  return(df)

}
