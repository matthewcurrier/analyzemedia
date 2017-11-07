#' Creates a simple black and white theme.
#'
#' This function has five arguments.
#' @param base_size The base size for the font.
#' @param family The font family to be used...assuming it's installed.
#' @keywords ggplot, ggplot2, simple theme, plot
#' @export
#' @examples
#' caption <- "Note: The idea that breakfast is the most important meal of the day has been ingrained in our thinking. But is it true? The traditional argument is that breakfast is critical to good health. But some experts argue that this idea is overblown."
#' caption <- paste0(strwrap(caption, 130), sep="", collapse="\n")
#'
#' library(ggplot2)
#' plot <- ggplot(mtcars, aes(x=wt, y=mpg)) +
#'   geom_point() + theme_bw_simple() +
#'   labs(title=toupper("You know what chart his is - BUT DONT WORRY!!!"),
#'        subtitle="The gary something can show how folks for different strokes",
#'        caption=caption)
#'
#' ggsave("test.png", plot)
#'
#'
#'
#' #' devtools::install_github("wch/extrafont")
#' #' extrafont::font_import()
#' #' tbl <- extrafont::fonttable()

theme_bw_simple <- function(base_size = 24, family="Cambria")
{
  theme_bw() +
    theme(
      text = element_text(size = 16),
      plot.title = element_text(face = "bold", size = rel(1.4), colour = "black", family = family),
      plot.subtitle = element_text(color = "black", size = rel(.8), family = family),
      plot.margin = unit(c(1, 3, 0, 0), "cm"),
      plot.caption = element_text(color = "black", size=rel(.7), hjust = 0, family = family),
      axis.title.x = element_text(size = rel(.8), family = family),
      axis.text.x = element_text(size = rel(1), family = family),
      axis.text.y = element_text(size = rel(1), family = family),
      axis.title.y = element_text(size = rel(.8), vjust = .5, family = family, margin = unit(c(0,.7, 0, 0), "cm")),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank()
    )
}




