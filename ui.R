
#tiny inimal example ui

shinyUI(fluidPage(
  
  titlePanel("GoogleSheet Download"),
  
  sidebarLayout(
    
    sidebarPanel(
      helpText("Test of loading and downloading data from a Google sheet"),
      downloadButton('downloadData', 'Download'),
      width=3
      
    ),
    
    mainPanel(
      h2('Fruit Available'), hr(),
      dataTableOutput('table1')
      
    )
  )
 )
)


  
  
  



