library(shiny)
library(ggplot2)
library(dplyr)
library(readr)
library(leaflet)
library(leaflet.extras)
library(shinydashboard)

# Loading dataset
data <- read_csv("SDOT_Collisions_2018_2023.csv")

# Convert date columns to Date type 
data$ADDDTTM <- as.Date(data$ADDDTTM, format = "%Y-%m-%d")

# Define server 
server <- function(input, output, session) {
  
  # Reactive filter data based on user input
  filteredData <- reactive({
    filtered <- data %>%
      filter(ADDDTTM >= input$dateRange[1] & ADDDTTM <= input$dateRange[2])
    if (!is.null(input$weatherFilter)) {
      filtered <- filtered %>%
        filter(WEATHER %in% input$weatherFilter)
    }
    return(filtered)
  })
  
  
  # Filter for updateCheckbocGroupInput
  observe({
    updateCheckboxGroupInput(session, "weatherFilter", choices = unique(data$WEATHER))
  })
  
  
  # Output for a text summary of the filtered data
  output$summary <- renderText({
    paste("Total collisions within selected range:", nrow(filteredData()))
  })
  
  
  # reset filter
  observeEvent(input$clearFilters, {
    updateDateRangeInput(session, "dateRange", start = as.Date("2018-01-01"), end = as.Date("2023-12-31"))
    updateCheckboxGroupInput(session, "weatherFilter", choices = unique(data$WEATHER), selected = NULL)
    })
  
  # Output for the time trend histogram
  output$timeTrend <- renderPlot({
    data <- filteredData()
    
    if (nrow(data) == 0) {
      return(NULL)
    }
    
    ggplot(data, aes(x = ADDDTTM, fill = WEATHER)) +
      geom_bar(binwidth = 30) +
      scale_fill_discrete(name = "Weather Condition") +
      theme_minimal() +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
      labs(x = "Date", y = "Number of Collisions", title = "Collisions Over Time")
  })
  
  
  # Output for the collision type bar chart
  output$accidentTypePlot <- renderPlot({
    data <- filteredData() %>%
      filter(!is.na(COLLISIONTYPE))
    ggplot(data, aes(x = COLLISIONTYPE)) +
      geom_bar(fill = "cornflowerblue", color = "black") +
      theme_minimal() +
      labs(x = "Type of Collision", y = "Accidents", title = "Collision Types")
  })
  
  # Output for the heatmap visualization
  output$map <- renderLeaflet({
    data <- filteredData() %>% filter(!is.na(X) & !is.na(Y)) # filter out any NA coordinates
    leaflet(data) %>%
      addTiles() %>%
      addHeatmap(
        lng = ~X, lat = ~Y, intensity = ~1, # assume each row has the same intensity
        blur = 20, max = 0.05, radius = 15
      )
  })
  
  
  # Output for the weather bar chart
  output$weatherTypePlot <- renderPlot({
    data <- filteredData()
    ggplot(data, aes(x = WEATHER)) +
      geom_bar(fill = "cornflowerblue", color = "black") +
      theme_minimal() +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
      labs(x = "Weather Condition", y = "Collision Count", title = "Weather Conditions")
  })

  # New output for the ROADCOND over time plot
  output$roadCondPlot <- renderPlot({
    output$roadCondPlot <- renderPlot({
      data <- filteredData() %>%
        mutate(Month = format(ADDDTTM, "%Y-%m-01")) %>% 
        group_by(Month, ROADCOND) %>%
        summarise(Count = n(), .groups = 'drop') %>%
        ungroup() %>%
        mutate(Month = as.Date(Month))

      ggplot(data, aes(x = Month, y = Count, color = ROADCOND)) +
        geom_line() +
        theme_minimal() +
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
        labs(x = "Time", y = "Collision Count", title = "Road Condition Over Time") +
        scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
        theme(axis.text.x = element_text(angle = 45, hjust = 1))
    })
  })
  
  # New Output for ggplot Jaime graph
  output$severityPlot <- renderPlot({
    # ggplot(data, aes(x = "ADDDTTM" , y = "SEVERITYCODE")) +
    #    geom_line() 
    filteredData() %>% 
      # select(ADDDTTM, SEVERITYCODE) %>%
      group_by(ADDDTTM,SEVERITYCODE) %>%
      summarise(countSeverity = n()) %>%
      ggplot(aes(x= ADDDTTM, y = countSeverity, color = SEVERITYCODE)) +
      labs(x = "Time", y = "Level of Severity") +
      geom_line()
  })
  # output graph for ggplot Sam
  output$weatherSeverityPlot <- renderPlot({
    data <- filteredData() %>%
      filter(!is.na(SEVERITYCODE))
    ggplot(data, aes(SEVERITYCODE)) + geom_bar(aes(fill = WEATHER)) +
      ggtitle("Severity Code Totals By Weather")
    
    
  })
  
  # Output for the about section
  output$about <- renderUI({
    HTML(paste0(
      "The challenge is to create a dashboard that visualizes the most common types of car accidents in Seattle and where they occur. ",
      "Our goal is to design an accessible platform that represents useful information that aims to show attributes of various collisions occurring in the city of Seattle. ",
      "This information will hopefully help auto engineers make safety adjustments, and policymakers adjust traffic safety precautions. ",
      "Overall this project will lead to public awareness of the leading factors of car crashes.<br><br>",
      "Link to Team's Challenge Github: ",
      '<a href="https://github.com/UWB-Adv-Data-Vis-2024-Winter/seattle-car-crashes-nevercrashes" target="_blank">',
      "https://github.com/UWB-Adv-Data-Vis-2024-Winter/seattle-car-crashes-nevercrashes</a>"
    ))
  })
}