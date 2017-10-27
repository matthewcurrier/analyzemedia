#' Summarize paid search data quickly.
#'
#' This function has five arguments.
#' @param df Dataframe to analyze.
#' @param spend Amount spent for observation.
#' @param impr Number of impressions.
#' @param clicks Number of clicks.
#' @param ... Variables to group results by.
#' @keywords paid search, sem, clicks, impressions, cpm, cpc
#' @export
#' @examples
#' media_summarize(df, spend, impr, clicks, country, city)


# This works!
media_summarize <- function(df=df, spend=spend, impr=impr, clicks=clicks, ...) {
  spend <- enquo(spend)
  impr <- enquo(impr)
  clicks <- enquo(clicks)
  group_var <- quos(...)
  #group_var <- enquo(group_var)


  df %>%
    group_by(!!!group_var) %>%
    summarise(spend := sum(!!spend),
              impr := sum(!!impr),
              clicks := sum(!!clicks),
              cpm = sum((!!spend) / (sum(!!impr) / 1000)),
              cpc = sum(!!spend) / sum(!!clicks)
    ) %>%
    arrange(cpm)
}
