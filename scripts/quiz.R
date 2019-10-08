## Generate the quiz

library(exams)
library(here)
library(tidyverse)


## list of questions
quiz <- list(
    "choice.Rmd",                   ## include this question
    "glimpse-str.Rmd",              ## include this question
    c(                              ## include one of the following questions
        "matrix-selection.Rmd",
        "variable-assignment.Rmd",
        "vector-addition.Rmd"
    ),
    "clt-quantile3.Rmd"             ## include this question
)  

## Set a seed for reproducibility
set.seed(404)
name_exam <- c("Quiz-", "Quiz-solutions-")

## generate 9 different versions of the quiz
n_versions <- 9

getID <- function(i) paste0("1-", formatC(i, flag = "0", width = 1))


## compile the document

exam <- exams2pdf(
    file     = quiz,
    n        = n_versions,
    dir      = here::here("quizzes"),        ## output directory
    name     = name_exam,
    highlight = TRUE,
    edir     = here::here("exercises"),          ## exercise directory
    template = c(here("templates", "quiz.tex"),  ## template for the quiz
                 here("templates", "quiz-solution.tex")),  ## template for the solutions
    header = list(ID = getID, Date = Sys.Date()),
    verbose = TRUE
)

