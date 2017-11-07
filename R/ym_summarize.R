#' Summarize time series based data quickly.
#'
#' This function has five arguments.
#' @param df Dataframe to analyze.
#' @param year Name of date column for dataset.
#' @param month Name of date column for dataset.
#' @param value Number of something.
#' @param lag_cols Boolean to determine if lag columns should be included.
#' @param ... Variables to group results by.
#' @keywords percent change, previous month, previous year
#' @export
#' @examples
#' ym_summarize(df, year, month, value, country, city)
#' bookings2 <- ym_summarize(bookings2, y, m, value, lag_cols=FALSE, channel, metric_type)
ym_summarize <- function(df, year, month, value, lag_cols=TRUE, pretty=FALSE, ...) {

  value <- enquo(value)
  group_var <- quos(...)
  year <- enquo(year)
  month <- enquo(month)


  #Step 1: Group by year month and sum
  df <- df %>% arrange(!!year, !!month, !!!group_var) %>%
    group_by(!!year, !!month, !!!group_var) %>%
    summarise(value=sum(value, na.rm=TRUE))

  #Step 2: Find lag (prv month) and calc percent change.
  df <- df %>% arrange(!!year, !!month, !!!group_var) %>%
    group_by(!!!group_var) %>%
    mutate(lag_value_month_prior=lag(value),
           prv_month_per_change=(value - lag_value_month_prior) / lag_value_month_prior) %>%
    ungroup()

  #Step 3: Find year-over-year change by month
  df <- df %>% arrange(!!year, !!month, !!!group_var) %>%
    group_by(!!!group_var) %>%
    mutate(lag_value_one_year_prior=lag(value, n=12),
           month_over_month_per_change=(value - lag_value_one_year_prior) / lag_value_one_year_prior) %>%
    ungroup()

  #Step 4: Remove lag value columns?
  if(lag_cols==FALSE) {
    df <- df %>% select(-lag_value_month_prior, - lag_value_one_year_prior)
  }

  #Step 5: Determine if we want to round our numbers for printing.
  if(pretty==TRUE){
    df$prv_month_per_change <- round(df$prv_month_per_change * 100, digits = 2)
    df$month_over_month_per_change <- round(df$month_over_month_per_change * 100, digits = 2)
  }
  return(df)
}




# b4 <- ym_summarize(bookings2_test, y, m, value, lag_cols=FALSE, pretty=TRUE, channel, metric_type)



