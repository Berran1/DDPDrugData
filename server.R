library(shiny)
library(rCharts)
library(ggplot2)

shinyServer(function(input, output) {
        
        dataset <- reactive({
                prodDng[prodDng$year %in% input$years&prodDng$Products %in% input$products,]
        })
        output$myChart <- renderChart({
                n1 <- nPlot(Sales ~ year, group = "Products", type = "multiBarChart", 
                                data=dataset())
                n1$set(dom = "myChart")
                n1$yAxis( axisLabel = "Sales (US$ Million)", width = 40 )
                n1$xAxis(axisLabel = "Year")
                return(n1)
        })
        output$myPlot <- renderPlot({
                myPlot <- qplot(year, Sales, data=prodDng, colour=Products,
                                geom="line")
                return(myPlot)
        })
        output$table <- renderTable(
                xtabs(Sales ~ Products + year, data=dataset(), drop.unused.levels=T))
        
})
        