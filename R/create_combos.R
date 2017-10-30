#' Create list of all possible combinations of string vector
#'
#' This function has two arguments.
#' @param strings Name of package to check
#' @param comb Name of package to check
#' @keywords sem, paid search
#' @export
#' @examples
#' strings <- c("dog","cat", "mouse", "hampster", "horse", "bird")
#' cc <- create_combos(strings, 3)
#' print(cc)

create_combos <- function(strings, comb) {
  library(combinat)

  f <- function(x) {
    paste(x, collapse = ", ")
  }

  c <- combn(strings, comb, simplify = T)
  df <- as.data.frame(c, stringsAsFactors=F)
  l <- lapply(df, f)
}
