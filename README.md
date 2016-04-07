# googlesheet_shinyapp_tiny_example
Super minimal example to show failure of app to function on shinyapps.io

You need to have a Google Drive account and a shinyapps.io account to run the test.

You need to have a Google Sheet like the example here in your Google Drive:
https://docs.google.com/spreadsheets/d/1QhPtrsukBCVZJ-t-nSxCLR1J2OCX-yVReAGVYXIzexM/edit?usp=sharing

To set up and test for failure, open the Shiny app in RStudio, install googlesheets package and in your console type
library(googlesheets)
gs_auth()

Grant permission to googlesheets to operate on your behalf with Google Sheets and Google Drive.

Confirm that you now have a .httr-oauth file in your current working directory.

CASE 1
Run the shiny app locally to confirm that the script functions:  it should just copy the Google Sheet into a table in the ui and allow you to download the file as .csv

then publish the app to your shinyapps.io account.  

The app will load, the webpage will open but immediately disconnect.   On 4/2, I got an error message from shinyapps.io server with this set up, can no longer produce:
Error in value[[3L]](cond) : Expected content-type:
application/atom+xml; charset=UTF-8
Actual content-type:
text/html; charset=UTF-8
Calls: local ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
