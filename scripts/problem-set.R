## Generate the problem set

library(exams)
library(here)
library(tidyverse)

## list of questions
problems <- list(
    "choice.Rmd",                   ## include this question
    "glimpse-str.Rmd",              ## include this question
    c(                              ## include one of the following questions
        "matrix-selection.Rmd",
        "variable-assignment.Rmd",
        "vector-addition.Rmd"
    ),
    "clt-quantile3.Rmd"             ## include this question
)  


set.seed(404)
name_exam <- c("Problem-set-", "Problem-set-solutions-")
n_versions <- 1


## compile the document
exam <- exams2pdf(
    file     = problems,
    n        = n_versions,
    dir      = here::here("problem-sets"), ## output directory
    name     = name_exam,
    highlight = TRUE,
    edir     = here::here("exercises"), ## exercise directory
    template = c(here("templates", "assignment.tex"),
                 here("templates", "assignment-solution.tex")),
    header = list(ID = "1-1", Date = Sys.Date()),
    verbose = TRUE
)

