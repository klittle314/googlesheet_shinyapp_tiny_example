# googlesheet_shinyapp_tiny_example
Super minimal example to show failure of app to function on shinyapps.io

You need to have a Google Drive account and a shinyapps.io account to run the test.

You need to have a Google Sheet like the example here in your Google Drive:
https://docs.google.com/spreadsheets/d/1QhPtrsukBCVZJ-t-nSxCLR1J2OCX-yVReAGVYXIzexM/edit?usp=sharing

To set up and test for failure, open the Shiny app in RStudio, install googlesheets package and in your console submit these commands
library(googlesheets)

gs_auth()

Grant permission to googlesheets to operate on your behalf with Google Sheets and Google Drive.

Confirm that you now have a .httr-oauth file in your current working directory.

CASE 1
Run the shiny app locally to confirm that the script functions:  it should just copy the Google Sheet into a table in the ui and allow you to download the file as .csv

then publish the app to your shinyapps.io account.  

The app will load, the webpage will open but immediately disconnect.   On 4/2, I got an error message from shinyapps.io server with the set up I just described, however, I can no longer produce it: 
Error in value[[3L]](cond) : Expected content-type:
application/atom+xml; charset=UTF-8
Actual content-type:
text/html; charset=UTF-8
Calls: local ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>

You can get an "Expected content-type error" on your local system if you do not have .httr-oauth file in the working directory.   So conclude that on shinyapps.io server, the code can't find an authorization token and the app fails to run.   

However, earlier in 2016, evidently it was possible to publish .httr-oauth files to shinyapps.io server as I had two apps that were functional.

CASE 2   Code Suggestion from MarkEdmondson1234
Save the .httr-oauth file to a location other than the working directory so you can play more without starting over.  Comment out the lines 42-62 and uncomment the lines 11-39. 

In your console, submit these commands:

options("googlesheets.httr_oauth_cache" = "gs_auth")
gs_auth()

You should see a gs_auth file in the working directory.

Run the app locally to confirm function.

Now upload the app to shinyapps.io and confirm function.
