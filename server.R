# tiny minimal example server.R

source("global.R")

shinyServer(function(input, output, session) {
  
  df = gs_df

  # print table using input from Google Sheet
  output$table1 = renderDataTable(df)
  
  # download file
  output$downloadData <- downloadHandler(
      filename = function() {
        paste('data-', Sys.Date(), '.csv', sep='')
      },
      content = function(con) {
        write.csv(df, con)
      }
    )
 }
)


