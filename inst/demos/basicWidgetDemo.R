library(shiny)
library(basicWidget)
count <- 0
#----------------------------------------------------------------------------------------------------
ui = fluidPage(

  sidebarLayout(
     sidebarPanel(
        actionButton("randomTextButton", "Random Text"),
        width=2
        ),
     mainPanel(
        fluidRow(basicWidgetOutput('basicWidget', width="100px", height="50px"),
                 textOutput('textWidget')),
        width=10
        )
     ) # sidebarLayout
)
#----------------------------------------------------------------------------------------------------
server = function(input, output, session) {

   randomText <- reactiveVal("fubar")

   observeEvent(input$randomTextButton, ignoreInit=TRUE, {
     printf("new word")
     new.word <- paste(sample(letters, size=8, replace=TRUE), collapse="")
     randomText(new.word)
     })

   output$basicWidget <- renderBasicWidget({
     printf("rendering text for basicWidget")
     basicWidget(message=randomText())
     })

   output$textWidget <- renderText({
     toupper(randomText())
     })

} # server
#----------------------------------------------------------------------------------------------------
runApp(shinyApp(ui = ui, server = server), port=9876)

