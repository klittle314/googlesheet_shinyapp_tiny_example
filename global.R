#read a googlesheet into a shiny app
#tiny minimal example
#
library(shiny)
library(shinyjs)
library(shinyapps)
library(rsconnect)
library(curl)
library(RCurl)
library(httr)
library(googlesheets)
library(openssl)

##########################################
#Credentials to interact with Google Sheets, requires .httr-oauth file in working directory
##########################################

#Example key for my simple spreadsheet on google drive
gskey2 <- "1QhPtrsukBCVZJ-t-nSxCLR1J2OCX-yVReAGVYXIzexM"

# register the googlesheet
gs_file <- gs_key(x=gskey2)
gs_df <- gs_read(gs_file)



