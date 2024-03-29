#############################################
## The following loads the needed packages ##
#############################################

# load the required packages
packages <- c(
  "here", # for the project's organization
  "tidyverse", "lubridate", # for wrangling
  "ggrepel", "gghighlight", "patchwork", "scales", # for plotting
  "knitr", "kableExtra", "bookdown", "rmarkdown",
  "evd",
  "MASS",
  "prettydoc",
  "reshape2",
  "copula")

# install packages if they were not already installed
unavailable <- setdiff(packages, rownames(installed.packages()))
install.packages(unavailable)

# load the packages
purrr::walk(packages, library, character.only = TRUE)

######################################################
## The following sets a few option for nice reports ##
######################################################

# general options
options(
  digits = 3,
  str = strOptions(strict.width = "cut"),
  width = 69,
  tibble.width = 69,
  cli.unicode = FALSE
)

# ggplot options
theme_set(theme_light())

# knitr options
opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  # cache = TRUE,
  fig.retina = 0.8, # figures are either vectors or 300 dpi diagrams
  dpi = 300,
  out.width = "70%",
  fig.align = "center",
  fig.width = 6,
  fig.asp = 0.618,
  fig.show = "hold",
  message = FALSE,
  echo = FALSE,
  warning = FALSE
  )

# creating function for a nice kable
kable_maker <- function(a_tibble, ...) {
  a_tibble %>%
    kable(caption = ..., align = "c") %>% 
    kable_styling(bootstrap_options = c("striped", "hover"))
}

# using the kable_maker to display the first 5 rows for exercise 3
kable_head <- function(a_tibble,...){
  a_tibble %>% 
  head(5) %>% kable_maker(...)
}