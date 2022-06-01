library(shiny)
library(plyr)
library(dplyr)
library(ggplot2)
library(circlize)
library(sf)
#install.packages("rnaturalearth")
#library(rnaturalearth)
source("get_data.R")

ui = fluidPage(
  
  fluidPage(
    titlePanel("How many species of amphibians are shared between African countries?"),
    #input functions
    sidebarLayout(
      sidebarPanel(width = 5,id = "panel1",
                   p("Data source: ",
                     a("The IUCN Red List of Threatened Species", 
                       href = "https://www.iucnredlist.org/"), "accessed June 2020"),
                   checkboxGroupInput(inputId = "selCountries", 
                                      label = "Countries to show:",
                                      choices = sort(country_names), 
                                      selected = country_names,
                                      inline = TRUE),
                   fluidRow(column(4, radioButtons("label_switch", 
                                                   "Show labels on diagram:",
                                                   c("Yes" = TRUE, "No" = FALSE))),
                            column(8, sliderInput(inputId="species_min", 
                                                  label="Minimum number of species connections to show:", 
                                                  value=22, 
                                                  min=1, 
                                                  max=100, 
                                                  step=1,
                                                  ticks = FALSE))),
                   # actionButton(inputId = "goButton", 
                   #              label = "update diagram"),
                   plotOutput(outputId="africa_map")
                   ),
      #output functions
      mainPanel(width = 7,id = "panel2",
                #verbatimTextOutput("text_test"),
                plotOutput(outputId="chordDiagram"))
    )
    
  )
)

server = function(input, output){
  # output$text_test = renderPrint({
  #   print(input$selCountries)
  # })
  output$chordDiagram = renderPlot({
    
    unselected_countries = country_names[!(country_names%in%input$selCountries)]
    col_mat[unselected_countries,] = "#00000000"
    col_mat[,unselected_countries] = "#00000000"
    col_mat[Working_mat < input$species_min] = "#00000000"
    aT = c("name","grid")
    if(input$label_switch == FALSE){
      aT = c("grid")
    }
    chordDiagram(Working_mat, 
                 annotationTrack = aT,
                 col = col_mat,
                 order = sort_countries,
                 grid.col = cols)
  }, width = "auto",
  height = 750)
  
  output$africa_map = renderPlot({
  p + geom_text(data = continents_iso2 %>% 
                  filter(NAME %in% input$selCountries), aes(x= long, y = lat, label = NAME), size = 2)
   
})
  
}


shinyApp(ui, server)
