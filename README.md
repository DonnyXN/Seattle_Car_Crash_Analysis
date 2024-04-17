# Seattle_Car_Crash_Analysis
Currently in Progress:

Exploratory Data Analysis project aimed to show insights on King County traffic accidents using SQL and PowerBI.

This project is based off of my [Final Group Project](https://github.com/DonnyXN/Seattle_Car_Crash_Analysis/tree/main/BIS412_Final_Project) for BIS412 Advanced Data Visualizations Class which was done using R.

## Description

The goal is to create a dashboard that visualizes the most common types of car accidents in Seattle and where they occur. Our goal is to design dashboard that represents useful information that aims to show attributes of various collisions occurring in the city of Seattle. This information will hopefully help auto engineers make safety adjustments, and policymakers adjust traffic safety precautions. Overall this project will lead to public awareness of the leading factors of car crashes. 

Tasks to address for thid Dashboard:
- Make an interactive dashboard.
- Display comparisons over successive years to show the leading variables in car accidents.
- Provide a geographical map of where accidents frequently occur.
- Show comparisons of accidents that occur during daylight and night.
- Display accident variables that are most common by month.
- Find correlations and co-occurrences of different variables.
- Provide insights into the missing data
- 
- Are there any noticeable trends in the number of collisions over the years?
- Are there specific times of day, days of thte week, or months of the year when collisions are more likely to occur?
- How do weather conditions affect the frequency and severity of collisions?
- Is there a correlations between the severity of a collisions and factors such as road conditions or time of day?

Querying Questions to answers:

- How many collisions occurred between January 1, 2020 and December 31, 2023?
- Which months had the leading number of accidents.
- What are the top 10 most common collision types and their respective counts?
- How many collisions resultd in injuries (severity code 2) in 2021?
- How many collisions occurred on each day of the week?
- How many collisions involved bicycles?
- What is the distribution of collision severity (injury vs property damage) for collisions that occurred in different weater conditions>
- During which hours of the day do pedertian-involved collisions most frequesntly occur>
- What is the average number of vehicles involved in each collision type?
- What percentage of collisions resulted in injuries for each month.
- 
- 

## Data Source Background

The dataset is named "SDOT Collisions All Years." It encompasses a comprehensive collection of traffic collision data managed and provided by the Seattle Department of Transportation (SDOT). The data is meticulously collected and provided by the Seattle Police Department (SPD) and recorded by Traffic Records under the oversight of the Seattle Department of Transportation (SDOT). The reports are primarily sourced from two types:
1. PTCR (Police Traffic Collision Report): These reports are filed by police officers responding to collision scenes. They provide authoritative, detailed accounts of the incidents, including information on the involved parties, witness statements, and the officer's scene assessment.
2. CVCR (Citizen Vehicle Collision Report): These reports are submitted by the citizens involved in or witnessing the collision. While they might not be as comprehensive as PTCR, they offer valuable firsthand accounts of the incidents.

The dataset aims to represent the general location and attributes of various collisions occurring in the city. The primary purpose of collecting this data is to analyze traffic collisions systematically, providing insights that can help in enhancing road safety measures, informing urban planning, and guiding policy decisions regarding traffic management in Seattle. This dataset is crucial for urban planners, policymakers, traffic authorities, and public safety officials. It helps in understanding collision patterns, identifying high-risk areas, and planning road safety improvements. The general public also benefits from increased transparency and data-driven decisions aimed at reducing collision rates and enhancing road safety. While the dataset is robust and provides a comprehensive view of traffic collisions in Seattle, it's important to note that there are instances of missing data. However, it is assessed that the missing data does not pertain to critical information that would significantly affect the analysis or the conclusions drawn from the dataset. The missing data may include certain details that, while useful for a complete picture, do not hinder the primary analyses typically conducted using this dataset, such as identifying high-risk areas, understanding the causes of collisions, or evaluating the effectiveness of road safety measures.

## Sources
Seattle Department of Transportation. (2024). SDOT Collisions All Years [January 24, 2024]. The City of Seattle ArcGIS Online. Retrieved from https://data-seattlecitygis.opendata.arcgis.com/datasets/SeattleCityGIS::sdot-collisions-all-years-2/about

