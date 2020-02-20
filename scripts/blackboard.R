## Generate the blackboard example

## 
##                 Can't use Chrome Web Browser
##                    Firefox works best
##


library(exams)
library(here)
library(tidyverse)


## list of questions
myexam <- list(
    "choice.Rmd",                   ## include this question
    "glimpse-str.Rmd",               ## include this question
    # c(                              ## include one of the following questions
    #     "matrix-selection.Rmd",
    #     "variable-assignment.Rmd",
    #     "vector-addition.Rmd"
    # ),
    "clt-quantile3-html.Rmd"             ## include this question
)  

## Set a seed for reproducibility
set.seed(404)

## generate 9 different versions of the quiz


## hint: to quickly check (prior to Blackboard export) whether each exercise can be
## converted to HTML, exams2html() can be used
exams2html(
    file   = myexam,
    dir    = here::here("blackboard"),
    edir   = here::here("exercises"),
    converter = "pandoc"
)



## compile the exam to Blackboard with 3 replications per question
exam <- exams2blackboard(
    file     = myexam,
    n        = 3,
    dir      = here::here("blackboard"),        ## output directory
    edir     = here::here("exercises"),          ## exercise directory
)


## Generate the file
## Log into blackboard -- choose a course that isn't active as a playground
##    - Select content on the left menu bar
##    - Select Pull-down option Build Content -> file
##    - Upload file
## Go to Content
##    - Select Pull-down option Assessments -> Assignment 

## Select Student view
