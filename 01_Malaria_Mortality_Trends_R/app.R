# =========================================================
# Malaria Epidemiology Dashboard
# Script: 05_dashboard_app.R
# Author: Chinonye Anams
# =========================================================

library(shiny)
library(shinydashboard)
library(shinycssloaders)
library(shinythemes)
library(tidyverse)
library(plotly)
library(sf)
library(viridis)


# -----------------------------------------
# Load datasets
# -----------------------------------------

data <- read_csv("data/processed/malaria_deaths_clean.csv")
nigeria_share <- read_csv("outputs/tables/nigeria_share_africa.csv")
africa_share_global <- read_csv("outputs/tables/africa_share_global.csv")
africa_map <- readRDS("data/africa_map.rds")


# -----------------------------------------
# UI
# -----------------------------------------

ui <- dashboardPage(
  
  dashboardHeader(title = "Malaria Mortality Dashboard"),
  
  dashboardSidebar(
    
    p(
      "Interactive analysis of global malaria mortality trends using WHO surveillance data (2000–2024).",
      style = "padding:10px; font-size:13px;"
    ),
    
    sidebarMenu(
      
      menuItem("Global Overview", tabName = "overview", icon = icon("dashboard")),
      menuItem("Country Trends", tabName = "country", icon = icon("chart-line")),
      menuItem("Trend Comparison", tabName = "trends", icon = icon("chart-bar")),
      menuItem("Africa Burden Map", tabName = "map", icon = icon("map"))
      
    ),
    
    br(),
    
    sliderInput(
      "year",
      "Select Year",
      min = min(data$year),
      max = max(data$year),
      value = max(data$year),
      step = 1,
      sep = ""
    ),
    
    selectInput(
      "country",
      "Select Country",
      choices = sort(unique(data$country)),
      selected = "Nigeria"
    )
    
  ),
  
  dashboardBody(
    
    tags$head(
      
      tags$link(
        href = "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap",
        rel = "stylesheet"
      ),
      
      tags$style(HTML("
      body {
        font-family: 'Inter', sans-serif;
      }

      .content-wrapper, .right-side {
        background-color: #f4f6f9;
      }

      .box {
        border-radius: 8px;
      }

      .box-header {
        font-weight: 600;
      }
      
      .box:hover {
        transform: translateY(-2px);
        transition: 0.2s;
      }

      .main-header .logo {
        font-weight: bold;
        font-size: 18px;
      }
      
      .main-header .navbar {
        background-color: #1f2d3d;
      }

      .main-header .logo {
        background-color: #1f2d3d;
      }
    "))
      
    ),
    
    tabItems(
      
      # =================================================
      # OVERVIEW TAB
      # =================================================
      
      tabItem(tabName = "overview",
              
              fluidRow(
                
                valueBoxOutput("total_deaths", width = 3),
                valueBoxOutput("nigeria_deaths", width = 3),
                valueBoxOutput("nigeria_share_box", width = 3),
                valueBoxOutput("africa_global_share", width = 3)
                
              ),
              
              fluidRow(
                
                box(
                  title = "Key Insights",
                  width = 12,
                  status = "primary",
                  solidHeader = TRUE,
                  htmlOutput("insights_text")
                )
              ),
              
              fluidRow(
                
                box(
                  title = "Top 10 High-Burden Countries",
                  width = 12,
                  withSpinner(plotlyOutput("top_countries")),
                  htmlOutput("top_countries_comment")
                )
                
              )
              
      ),
      
      # =================================================
      # COUNTRY ANALYSIS TAB
      # =================================================
      
      tabItem(tabName = "country",
              
              fluidRow(
                
                box(
                  title = "Country Mortality Trend",
                  width = 12,
                  withSpinner(plotlyOutput("country_trend")),
                  htmlOutput("country_trend_comment")
                )
                
              )
              
      ),
      
      # =================================================
      # TREND CLASSIFICATION TAB
      # =================================================
      
      tabItem(tabName = "trends",
              
              fluidRow(
                
                box(
                  title = "Global Malaria Mortality Trend Classification",
                  width = 12,
                  withSpinner(plotlyOutput("trend_classification_plot")),
                  htmlOutput("trend_comment")
                )
                
              ),
              
              fluidRow(
                
                box(
                  title = "Insight",
                  width = 12,
                  status = "primary",
                  solidHeader = TRUE,
                  htmlOutput("trend_insight")
                )
              ),
              
      ),
      
      # =================================================
      # MAP TAB
      # =================================================
      
      tabItem(tabName = "map",
              
              fluidRow(
                
                box(
                  title = "Africa Malaria Mortality Map",
                  width = 12,
                  withSpinner(plotOutput("map_plot", height = 600)),
                  htmlOutput("map_comment")
                  
                )
                
              )
              
      )
      
    ),
    
    tags$footer(
      style = "
    text-align:center;
    padding:10px;
    font-size:12px;
    color:#666;
  ",
  HTML("Data Source: <b>WHO World Malaria Report 2025</b> | Analysis by <b>Chinonye Anams</b>")
    )
  )
)

# -----------------------------------------
# SERVER
# -----------------------------------------

server <- function(input, output) {
  
  # =============================
  # Filtered data
  # =============================
  
  yearly_data <- reactive({
    data %>% filter(year == input$year)
  })
  
  # =============================
  # KPI CARDS
  # =============================
  
  output$total_deaths <- renderValueBox({
    
    total <- sum(yearly_data()$malaria_deaths, na.rm = TRUE)
    
    valueBox(
      format(total, big.mark = ","),
      subtitle = paste("Total Malaria Deaths (", input$year, ")", sep=""),
      icon = icon("virus"),
      color = "maroon"
    )
    
  })
  
  
  output$nigeria_deaths <- renderValueBox({
    
    nigeria <- yearly_data() %>%
      filter(country == "Nigeria") %>%
      pull(malaria_deaths)
    
    valueBox(
      format(nigeria, big.mark = ","),
      subtitle = paste("Nigeria Deaths (", input$year, ")", sep=""),
      icon = icon("flag"),
      color = "olive"

    )
    
  })
  
  
  output$nigeria_share_box <- renderValueBox({
    
    share <- nigeria_share %>%
      filter(year == input$year) %>%
      pull(nigeria_share)
    
    valueBox(
      paste0(round(share,2), "%"),
      subtitle = paste("Nigeria Share of Africa (", input$year, ")", sep=""),
      icon = icon("chart-pie"),
      color = "purple"
    )
    
  })
  
  output$africa_global_share <- renderValueBox({
    
    share <- africa_share_global %>%
      filter(year == input$year) %>%
      pull(africa_share)
    
    valueBox(
      paste0(round(share,1), "%"),
      subtitle = paste("Africa Share of Global Deaths (", input$year, ")", sep=""),
      icon = icon("globe"),
      color = "teal"
    )
    
  })
  
  # =============================
  # OVERVIEW INSIGHT
  # =============================
  
  output$insights_text <- renderUI({
    
    year_data <- data %>%
      filter(year == input$year)
    
    total <- sum(year_data$malaria_deaths, na.rm = TRUE)
    
    nigeria <- year_data %>%
      filter(country == "Nigeria") %>%
      pull(malaria_deaths)
    
    top_country <- year_data %>%
      arrange(desc(malaria_deaths)) %>%
      slice(1)
    
    africa_share <- africa_share_global %>%
      filter(year == input$year) %>%
      pull(africa_share)
    
    HTML(paste0(
      
      "<b>Global malaria burden in ", input$year, ":</b> ",
      format(total, big.mark=","), " malaria deaths were reported globally.<br><br>",
      
      "<b>Nigeria recorded ", format(nigeria, big.mark=","), 
      " deaths</b>, making it one of the countries with the highest malaria mortality burden.<br><br>",
      
      "<b>", top_country$country, "</b> had the highest number of malaria deaths in ",
      input$year, ".<br><br>",
      
      "Africa accounted for approximately <b>",
      round(africa_share,1), "%</b> of global malaria deaths."
      
    ))
    
  })
  
  # =============================
  # TOP COUNTRIES
  # =============================
  
  output$top_countries <- renderPlotly({
    
    df <- yearly_data() %>%
      arrange(desc(malaria_deaths)) %>%
      slice_head(n = 10)
    
    p <- ggplot(df,
                aes(reorder(country, malaria_deaths), malaria_deaths)) +
      geom_col(fill = "firebrick") +
      coord_flip() +
      labs(
        x = "",
        y = "Deaths"
      )
    
    ggplotly(p)
    
  })
  
  # =============================
  # TOP COUNTRIES COMMENT
  # =============================
  output$top_countries_comment <- renderUI({
    
    HTML(paste0(
      "<br></br>",
      "<div style='background-color:#f8f9fa; padding:8px; border-left:4px solid #007bff; border-radius:4px; font-size:14px; color:#333;'>",
      "This chart ranks the 10 countries with the highest total malaria deaths.",
      "<p>(Select a year to view the top 10 countries for that specific period.)</p>"
    ))
    
  })
  
  
  # =============================
  # COUNTRY TREND
  # =============================
  
  output$country_trend <- renderPlotly({
    
    df <- data %>%
      filter(country == input$country)
    
    p <- ggplot(df, aes(year, malaria_deaths)) +
      geom_line(color = "darkgreen", linewidth = 1.2) +
      geom_point() +
      labs(
        title = paste("Malaria Deaths Trend:", input$country),
        x = "Year",
        y = "Deaths"
      )
    
    ggplotly(p)
    
  })
  
  # =============================
  # COUNTRY TREND COMMENT
  # =============================
  output$country_trend_comment <- renderUI({
    
    HTML(paste0(
      "<br></br>",
      "<div style='background-color:#f8f9fa; padding:8px; border-left:4px solid #007bff; border-radius:4px; font-size:14px; color:#333;'>",
      "This chart shows the trend of malaria deaths in ", input$country, 
      " over time.",
      "<p>(Select another country to examine its malaria mortality trend)</p>"
    ))
    
  })
  
  
  # =============================
  # TRENND CLASSIFICATION 
  # =============================
  
  trend_dynamic <- reactive({
    
    base_year <- max(data$year)
    
    data %>%
      filter(year %in% c(input$year, base_year)) %>%
      select(country, year, malaria_deaths) %>%
      pivot_wider(
        names_from = year,
        values_from = malaria_deaths
      ) %>%
      mutate(
        change = .data[[as.character(base_year)]] - 
          .data[[as.character(input$year)]],
        
        trend = case_when(
          change > 0 ~ "Increasing",
          change < 0 ~ "Decreasing",
          TRUE ~ "Stable"
        )
      )
    
  })
  
  output$trend_classification_plot <- renderPlotly({
    
    trend_summary <- trend_dynamic() %>%
      count(trend)
    
    p <- ggplot(trend_summary,
                aes(trend, n, fill = trend)) +
      geom_col(show.legend = FALSE) +
      labs(
        title = paste("Country Malaria Death Trend:",
                      input$year, "vs 2024"),
        x = "Trend Category",
        y = "Number of Countries"
      ) +
      scale_fill_manual(values = c(
        "Increasing" = "firebrick",
        "Decreasing" = "darkgreen",
        "Stable" = "steelblue"
      ))
    
    plotly::ggplotly(p)
    
  })
  
  # ========================================
  # TREND CLASSIFICATION COMMENT AND INSIGHT
  # ========================================
  output$trend_comment <- renderUI({
    HTML(paste0(
      "<br></br>",
      "<div style='background-color:#f8f9fa; padding:8px; border-left:4px solid #007bff; border-radius:4px; font-size:14px; color:#333;'>",
      "This chart shows a quick overview of global progress and stagnation in malaria control.",
      "<p>(Select a year to compare its malaria mortality trends against 2024.)</p>"
    ))
    
  })
  
  output$trend_insight <- renderUI({
    
    trends <- trend_dynamic() %>% count(trend)
    
    increasing <- trends %>% filter(trend == "Increasing") %>% pull(n)
    decreasing <- trends %>% filter(trend == "Decreasing") %>% pull(n)
    stable     <- trends %>% filter(trend == "Stable") %>% pull(n)
    
    HTML(paste0(
      "<p>Comparing ", input$year, " with 2024,</p>",
      "<span style='color:firebrick;'>", ifelse(length(increasing) == 0, "0", increasing), "</span> countries show an <b>increasing</b> trend, ",
      "<span style='color:darkgreen;'>", ifelse(length(decreasing) == 0, "0", decreasing), "</span> countries show a <b>decreasing</b> trend, and ",
      "<span style='color:steelblue;'>", ifelse(length(stable) == 0, "0", stable), "</span> countries remain <b>stable</b>."
    ))
    
  })
  
  # =============================
  # MAP
  # =============================
 
  output$map_plot <- renderPlot({
    
    latest_data <- data %>%
      filter(year == input$year)
    
    map_data <- africa_map %>%
      left_join(latest_data, by = c("iso_a3" = "iso"))
    
    ggplot(map_data) +
      geom_sf(aes(fill = malaria_deaths),
              color = "white",
              linewidth = 0.2) +
      
      scale_fill_viridis(
        option = "plasma",
        trans = "sqrt",
        na.value = "grey90",
        name = "Malaria Deaths"
      ) +
      
      labs(
        title = paste("Malaria Deaths Across Africa (", input$year, ")"),
        subtitle = "Source: WHO World Malaria Report 2025",
        caption = "Analysis by Chinonye Anams"
      ) +
      
      theme_minimal() +
      
      theme(
        plot.title = element_text(face = "bold", size = 16),
        plot.subtitle = element_text(size = 12),
        legend.position = "right"
      )
    
  })
  
  # =============================
  # MAP COMMENT
  # =============================
  output$map_comment <- renderUI({
    
    HTML(paste0(
      "<br></br>",
      "<div style='background-color:#f8f9fa; padding:8px; border-left:4px solid #007bff; border-radius:4px; font-size:14px; color:#333;'>",
      "This map displays malaria deaths across African countries.",
      "<p>(Select a year to examine the distribution of malaria mortality across Africa.)</p>"
    ))
    
  })
  
}

# -----------------------------------------
# Run App
# -----------------------------------------

shinyApp(ui, server)