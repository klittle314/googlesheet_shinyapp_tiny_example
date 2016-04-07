# tiny minimal example server.R
#corrected script to get google authorization to be correct
#see https://github.com/jennybc/googlesheets/issues/235 and https://groups.google.com/forum/#!topic/shinyapps-users/xSL6AWmtc08

#source("global.R")
library(shiny)
library(googlesheets)

#code that uses gs_auth as authorization file
shinyServer(function(input, output, session) {
  gs_df <- reactive({
    #Example key for my simple spreadsheet on google drive
    options("googlesheets.httr_oauth_cache" = "gs_auth")
    gskey2 <- "1QhPtrsukBCVZJ-t-nSxCLR1J2OCX-yVReAGVYXIzexM"
    gs_auth()
    # register the googlesheet
    gs_file <- gs_key(x=gskey2)
    gs_df <- gs_read(gs_file)
  })


  # print table using input from Google Sheet
  output$table1 = renderDataTable(gs_df())
  # 
  #output$table1 = renderDataTable(df)
  
  # download file
  output$downloadData <- downloadHandler(
      filename = function() {
        paste('data-', Sys.Date(), '.csv', sep='')
      },
      content = function(con) {
        
        write.csv(gs_df(), con)
      }
    )
 }
)


#uncomment the following lines to experience the error
# gskey2 <- "1QhPtrsukBCVZJ-t-nSxCLR1J2OCX-yVReAGVYXIzexM"
# gs_file <- gs_key(x=gskey2)
# gs_df <- gs_read(gs_file)
#shinyServer(function(input, output, session) {
#df = gs_df


# output$table1 = renderDataTable(df)
# 
# 
# output$downloadData <- downloadHandler(
#   filename = function() {
#     paste('data-', Sys.Date(), '.csv', sep='')
#   },
#   content = function(con) {
#     write.csv(df,con)
# 
#   }
# )
# }
#)
