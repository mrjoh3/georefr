fluidPage(theme = shinytheme("superhero"),

  # Application title
  titlePanel(withTags(
    div("Image Georeferencing",
        div(class = 'pull-right',
            a(href = 'https://github.com/mrjoh3/georefr',
              icon('github'))), hr() )
    ), 
    windowTitle = "Image Georeferencing"
    ),
  
  sidebarLayout(
    sidebarPanel(width = 3,
                 includeMarkdown('instructions.md'),
                 h3("Import Image"),
                 wellPanel(style = 'background-color: #637281; padding: 10px; margin-top: 5px;',
                   fileInput('add_file', label = 'Select or drag n drop image', placeholder =  'JPEG, PNG, TIFF or BMP')
                 ),
                 h3('Parameters'),
                 tabsetPanel(type = "tabs",
                             tabPanel('Georeference Method',
                                      wellPanel(style = "background: #910505;",
                                                selectizeInput('method', 'Choose',
                                                               choices = c('No Click'= 1,
                                                                           '2 Click Image - Known Map Coordinates' = 2,
                                                                           '2 Click Image - 2 Click Map Coordinates' = 3
                                                               ),
                                                               selected = 3)
                                                ),
                                                numericInput('crs', 'Define CRS', 3857),
                                                selectInput('cntry', 'Define Output Map Area', 
                                                            choices = rnaturalearth::countries110$admin,
                                                            selected = 'France')),
                             tabPanel('Known Spatial Information',
                                      wellPanel(style = "background: #910505",
                                                sliderInput('xs', 'X Max and Min', min = -180, max = 180, value = c(-10, 150)),
                                                sliderInput('ys', 'Y Max and Min', min = -90, max = 90, value = c(-40, 40))))
                 ),
                 h3('Run Georeference'),
                 actionButton('btn', 'Run Georeference', class = "btn-primary"),
                 tags$hr(),
                 downloadButton('download', 'Corrected Raster'),
                 downloadButton('geom', 'Reference Geometry')
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
