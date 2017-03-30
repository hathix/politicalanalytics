library(shiny)

source('~/Documents/Git/politicalanalytics/scripts/turnout.R')
data <- read.csv("~/Documents/Git/politicalanalytics/data/L2/random-samples/UT-randsamp.csv")
zip_data <- read.csv("~/Documents/Git/politicalanalytics/data/flagships.csv")

ages <- seq(1:100)
# turnouts, inner
inner <- get_inner_zips(zip_data, "UT")
inner_turnouts <- unlist(lapply(ages, function(x) get_turnout_2016_by_exact_age(data, inner, x)))
outer <- get_outer_zips(zip_data, "UT")
outer_turnouts <- unlist(lapply(ages, function(x) get_turnout_2016_by_exact_age(data, outer, x)))



ui <- basicPage(
  plotOutput("plot1", click = "plot_click"),
  verbatimTextOutput("info")
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    plot(ages, inner_turnouts)
    plot(ages, outer_turnouts)
  })
  
  output$info <- renderText({
    paste0("x=", input$plot_click$x, "\ny=", input$plot_click$y)
  })
}

shinyApp(ui, server)
