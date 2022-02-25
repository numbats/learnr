options(tidyverse.quiet = TRUE)
options(repr.plot.width=6, repr.plot.height=4, repr.plot.res = 250)
Sys.setenv(`_R_S3_METHOD_REGISTRATION_NOTE_OVERWRITES_` = "false")

.learnr_praise_tests <- function ()
{
  praise <- c(paste0(strrep("🎉🎊", 5), "🎉", " Nice code!"), "💅 Your code is beautiful 💅", "🥇 Your code deserve a gold medal 🥇",
            "🌈 Your code is over the rainbow 🌈", "🧿 Your code looks perfect 🧿",
            "🎯 Your code hit the mark 🎯", "🐝 Your code is the bees knees 🐝",
            "💣 Your code is da bomb 💣", "🔥 Your code is lit 🔥")
  sample(praise, 1)
}
.learnr_reporter <- R6::R6Class(
  "LearnrReporter", inherit = testthat::StopReporter,
  public = list(
    end_test = function(context, test) {
      self$local_user_output()

      failures <- self$failures$as_list()
      if (length(failures) == 0) {
        self$cat_line(cli::col_green(cli::symbol$tick, " ", .learnr_praise_tests()))
        return()
      }

      messages <- vapply(failures, function(x) {
        msg <- sub(".+\n`expected`:.+\n(.+)", "\\1", x$message)
        if(!nzchar(msg)) {
          msg <- sub("([^\n]+).+", "\\1", x$message)
        }
        cli::col_red(cli::symbol$cross, " ", msg)
      }, character(1L))
      self$cat_line(messages, "\n")
    }
  )
)
