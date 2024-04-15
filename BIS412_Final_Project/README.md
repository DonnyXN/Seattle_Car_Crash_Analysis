# Seattle's Car Crashes
The data dashboard challenge for the Winter 2024 BIS 412 Advanced Data Visualization course. The challenge uses data from the Seattle Department of Transportation (SDOT).
- Challenge created by and made for the BIS 412 Advanced Data Visualization course at the University of Washington Bothell.
- Authored by [Donny N](https://github.com/donnyn-2021674), [Eric L](https://github.com/ljh2001uw), [Jaime Y](https://github.com/lyazzie1), [Sam S](https://github.com/sam-studer)
- Committee members: [Drake M.](https://github.com/drakemon), [Kara Nilsson](https://github.com/karanilsson), [Rachel Gragham](https://github.com/rachelfgraham)
- Committee chair: [Andrew Lawandy](https://github.com/andrewLawandy)
- Edited and supervised by [Prof. Caleb Trujillo](https://github.com/calebtru)

## Challenge Description

The challenge is to create a dashboard that visualizes the most common types of car accidents in Seattle and where they occur. Our goal is to design an accessible platform that represents useful information that aims to show attributes of various collisions occurring in the city of Seattle. This information will hopefully help auto engineers make safety adjustments, and policymakers adjust traffic safety precautions. Overall this project will lead to public awareness of the leading factors of car crashes. 

Tasks to address for our challenge:
- Make an interactive dashboard.
- Display comparisons over successive years to show the leading variables in car accidents.
- Provide a geographical map of where accidents frequently occur.
- Show comparisons of accidents that occur during daylight and night.
- Display accident variables that are most common by month.
- Find correlations and co-occurrences of different variables.
- Provide insights into the missing data
- Preferably, the data remains live with a connection to the data source

## Proposed Plan

First Week:
- Importing data to clean and process by removing unneeded information.
- Sketch ideas and potential markups of visualizations for the dashboard.
- Clearly outline the goals and objectives of the dashboard and identify the key metrics and insights the dashboard should provide.

Second Week:
- Begin creating initial ggplot visualizations of our proposed sketches and create visualizations without consideration of our sketch.
- Iterate on the visualizations and get feedback from each other.
- Refine the visualization and ideas based on insights gained from the analysis and make changes based on feedback.

Third Week:
- Consider the visual appearance and layout of the dashboard and implement visualizations.
- Ensure data is formatted appropriately for different visualizations and implementation.
- Conduct thorough testing of the dashboard’s functionality and debug any issues to ensure a smooth user experience.

Final Week:
- Collect feedback on our dashboard.
- Make final adjustments to the layout, color scheme, overall design, and possible changes based on feedback.
- Evaluate user interface for user interface and clarity.
- Publish the final dashboard.
- Test the live version and ensure all components are functioning correctly.

## Background

The dataset is named "SDOT Collisions All Years." It encompasses a comprehensive collection of traffic collision data managed and provided by the Seattle Department of Transportation (SDOT). The data is meticulously collected and provided by the Seattle Police Department (SPD) and recorded by Traffic Records under the oversight of the Seattle Department of Transportation (SDOT). The reports are primarily sourced from two types:
1. PTCR (Police Traffic Collision Report): These reports are filed by police officers responding to collision scenes. They provide authoritative, detailed accounts of the incidents, including information on the involved parties, witness statements, and the officer's scene assessment.
2. CVCR (Citizen Vehicle Collision Report): These reports are submitted by the citizens involved in or witnessing the collision. While they might not be as comprehensive as PTCR, they offer valuable firsthand accounts of the incidents.

The dataset aims to represent the general location and attributes of various collisions occurring in the city. The primary purpose of collecting this data is to analyze traffic collisions systematically, providing insights that can help in enhancing road safety measures, informing urban planning, and guiding policy decisions regarding traffic management in Seattle. This dataset is crucial for urban planners, policymakers, traffic authorities, and public safety officials. It helps in understanding collision patterns, identifying high-risk areas, and planning road safety improvements. The general public also benefits from increased transparency and data-driven decisions aimed at reducing collision rates and enhancing road safety. While the dataset is robust and provides a comprehensive view of traffic collisions in Seattle, it's important to note that there are instances of missing data. However, it is assessed that the missing data does not pertain to critical information that would significantly affect the analysis or the conclusions drawn from the dataset. The missing data may include certain details that, while useful for a complete picture, do not hinder the primary analyses typically conducted using this dataset, such as identifying high-risk areas, understanding the causes of collisions, or evaluating the effectiveness of road safety measures.

## Sources
Seattle Department of Transportation. (2024). SDOT Collisions All Years [January 24, 2024]. The City of Seattle ArcGIS Online. Retrieved from https://data-seattlecitygis.opendata.arcgis.com/datasets/SeattleCityGIS::sdot-collisions-all-years-2/about
