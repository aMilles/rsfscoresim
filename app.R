ui =shinyUI(fluidPage(
    
    # Sidebar with a slider input for number of bins
    wellPanel(
      
      #selectInput("samples", "Number of selections", c(50,200,400), selected= 400, selectize = TRUE),
      fluidRow(column(3,
                      numericInput("ind", label = "Individuum",min = 1, max = pop.size, value = 1)
      ))
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("leaflet_map")
    )))
server = shinyServer(function(input, output) {
    output$leaflet_map <- renderPlot(
      get(paste0("rsf_ind", input$ind))+
        facet_wrap(~score, scales = "free"), 
      res = 100
      
    )
  })
