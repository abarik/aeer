knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  cache = TRUE,
  warning = FALSE,
  message = FALSE,
  echo = TRUE,
  dpi = 300,
  cache.lazy = FALSE,
  tidy = "styler",
  out.width = "90%",
  fig.align = "center",
  fig.width = 5,
  fig.height = 7
)

options(
  htmltools.dir.version = FALSE, formatR.indent = 2,
  width = 80, digits = 4, warnPartialMatchAttr = FALSE, warnPartialMatchDollar = FALSE
)

options(crayon.enabled = FALSE)

suppressPackageStartupMessages(library(tidyverse))

theme_set(theme_light())

library(scales)
library(methods)

import_example <- function(file, lang = xfun::file_ext(file)) {
  x = xfun::read_utf8(file.path("examples", file))
  lang = tolower(lang)
  if (nchar(lang) > 1) {
    lang = sub('^r', '', lang)
    if (lang == 'nw') lang = 'tex'
  }
  knitr::asis_output(paste(c(sprintf("````%s", lang), x, "````"), collapse = '\n'))
}

