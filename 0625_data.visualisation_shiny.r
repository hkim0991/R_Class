setwd('C:/Users/202-22/Documents/R/R2_Project/R_Studio_exercise')

install.packages('shiny')
install.packages('Cairo')

library(shiny)
library(googleVis)
library(Cairo)

shiny::runApp('hello')

runExample()
runExample('01_hello')
runExample('04_mpg')

telco <- read.csv('C:\\Users\\202-22\\Documents\\Python - Hyesu\\Project\\data\\telco\\telco_train.csv')
head(telco)
str(telco)

library(shiny)
library(datasets)

# Data pre-processing ----
# Tweak the "am" variable to have nicer factor labels -- since this
# doesn't rely on any user inputs, we can do this once at startup
# and then use the value throughout the lifetime of the app
telcoData <- telco
telcoData$SeniorCitizen <- factor(telcoData$SeniorCitizen, labels = c("0", "1"))


# Define UI for miles per gallon app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Telco data Boxplot"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for variable to plot against mpg ----
      selectInput("variable", "Variable:",
                  c("gender" = "gender",
                    "SeniorCitizen" = "senior",
                    "PhoneService" = "Phone Service",
                    "MultipleLines" = "MultipleLines",
                    "InternetService" = "Internet Service")),
      
      # Input: Checkbox for whether outliers should be included ----
      checkboxInput("outliers", "Show outliers", TRUE)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("caption")),
      
      # Output: Plot of the requested variable against mpg ----
      plotOutput("teloplot")
      
    )
  )
)

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  
  # Compute the formula text ----
  # This is in a reactive expression since it is shared by the
  # output$caption and output$mpgPlot functions
  formulaText <- reactive({
    paste("Churn ~", input$variable)
  })
  
  # Return the formula text for printing as a caption ----
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against mpg ----
  # and only exclude outliers if requested
  output$teloplot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = telcoData,
            outline = input$outliers,
            col = "#75AADB", pch = 19)
  })
  
}

# Create Shiny app ----
shinyApp(ui, server)