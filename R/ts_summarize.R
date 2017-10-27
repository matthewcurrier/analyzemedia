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

ts_summarize <- function(df, date, value, ...) {
  value <- enquo(value)
  group_var <- quos(...)
  date <- enquo(date)

  df <- df %>% arrange(!!date, !!!group_var)

  df <- df %>%
    group_by(!!!group_var) %>%
    mutate(lag_value=lag(value),
           per_change=format((value - lag_value) / value, digits=3)
           ) %>%
    ungroup()
}



