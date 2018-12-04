fluidPage(

  # Application title
  titlePanel("Image Georeferencing"),
  
  sidebarLayout(
    sidebarPanel(width = 3,
                 includeMarkdown('instructions.md'),
                 h3("Import File to Georeference"),
                 wellPanel(
                   fileInput('add_file', 'Select File')
                 ),
                 downloadButton('download', 'Download Corrected Image'),
                 downloadButton('geom', 'Download Reference Geometry'),
                 h3('Parameters'),
                 tabsetPanel(type = "tabs",
                             tabPanel('Georefernce Method',
                                      wellPanel(style = "background: #ffe6e6",
                                                selectizeInput('method', 'Choose',
                                                               choices = c('No Click'= 1,
                                                                           '2 Click Image - Known Map Coordinates' = 2,
                                                                           '2 Click Image - 2 Click Map Coordinates' = 3
                                                               ),
                                                               selected = 3),
                                                numericInput('crs', 'Define CRS', 3857))),
                             tabPanel('Known Spatial Information',
                                      wellPanel(style = "background: #ffe6e6",
                                                sliderInput('x', 'X Max and Min', min = -180, max = 180, value = c(-90, 90)),
                                                sliderInput('y', 'Y Max and Min', min = -90, max = 90, value = c(-45, 45))))
                 ),
                 h3('Run Georeference'),
                 actionButton('btn', 'Run Georeference')
                 
                 ),
    mainPanel(
      fluidRow(
        column(12,
      shiny::tabsetPanel(
        tabPanel('Map',
                 editModUI("editor", height = 600)),
        tabPanel('Input Image',
                 fluidRow(column(10,
                                 #shiny::imageOutput('image', click = 'imageClick')),
                                 plotOutput('image', click = 'imageClick')),
                          column(2,
                                 h4('Image Clicks'),
                                 tableOutput('img_clicks')))
                 ),
        
        tabPanel('Output Image',
                 plotOutput('corrected'))
      )
      ) # end col
    ) # end row
    )
  )


)