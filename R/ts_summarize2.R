#' Summarize time series based data quickly.
#'
#' This function has five arguments.
#' @param df Dataframe to analyze.
#' @param date Name of date column for dataset.
#' @param value Number of something.
#' @param ... Variables to group results by.
#' @keywords percent change, previous quarter, previous year
#' @export
#' @examples
#' ts_summarize(df, date, value, country, city)
#' ts_summarize(bookings, day, value, channel, metric_type)

ts_summarize2 <- function(df, date, value, ...) {

  value <- enquo(value)
  group_var <- quos(...)
  date <- enquo(date)
  df$year <- format(date, '%Y')
  df
  # date <- as.Date(!!date)
  # df$year <- format(!!date, '%Y')
  # df$date2 <- date
  # as.Date(!!date)
  # df$year <- format(!!date, '%Y')
}




