library(shinydashboard)
library(leaflet)
library(leaflet.extras)
ui <- dashboardPage(
  # Application title
  dashboardHeader(title = "Seattle Car Crashes Visualization"),
  
  dashboardSidebar(
    width = 300,
    tableOutput("severityTable"),
    dateRangeInput("dateRange",
                   "Select Date Range:",
                   start = as.Date("2018-01-01"),
                   end = as.Date("2023-12-31"),
                   format = "mm/dd/yyyy"),
    checkboxGroupInput('weatherFilter', 'Select Weather Condition:', choices = NULL),
    actionButton('clearFilters', 'Clear Filters')
  ),
  dashboardBody(
    tabsetPanel(
      tabPanel("Main", plotOutput("timeTrend", width = "100%", height = "300px"),
               leafletOutput("map", height = "600px")),
      tabPanel("Collision Types", plotOutput("accidentTypePlot")),
      tabPanel("Weather Conditions", plotOutput("weatherTypePlot")),
      tabPanel("Road Conditions Over Time", plotOutput("roadCondPlot")),
      tabPanel("Severity of Accidents", plotOutput("severityPlot")),
      tabPanel("Severity Based on Weather", plotOutput("weatherSeverityPlot")),
      tabPanel("About", h1("Challenge Description"), uiOutput("about"))
    )
  )
)
