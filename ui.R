library(shiny)
library(haven)
library(mice)
library(ggplot2)

# Define UI  ----
ui <- fluidPage(
  
  titlePanel("Simple Imputation methods"),
  
  # Sidebarpanel
  sidebarLayout(
    # Sidebar panel for inputs ----
    sidebarPanel(
    
    # Input: Selector variable to plot  ----
    selectInput("Method", "Imputation Method", 
                c("Full dataset (without missings)", "Complete Case Analysis", 
                  "Mean" = "mean",
                  "Single Regression" = "norm.predict",
                  "Single Stochastic Regression" = "norm",
                  "Predictive Mean Matching" = "pmm")),
    
    tableOutput("table1")
    
    ),
  
  # Main panel for displaying outputs ----
  mainPanel(
    
    h3("Imputed values for the Tampa scale variable"),
    h4("In this plot the Pain scores are used to impute the missing values in the Tampascale variable, 
       according to the Imputation method selected by the user in the left panel"),
    plotOutput("plot2"),
    h3("Regression line in completed data"),
    h4("In this plot the effect of each Imputation method on the main analysis is shown, 
       the relationship between the (independent) Tampa scale and (dependent) Pain variable"),
    plotOutput("plot1"),
    
    h3("Linear regression model in the Completed data"),
    verbatimTextOutput("model1")
    
  )
)
)