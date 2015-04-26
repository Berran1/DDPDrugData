library(shiny)
library(rCharts)
library(ggplot2)

shinyUI(pageWithSidebar(
        headerPanel('Sales of Leading Drugs 2008-2014'),
        sidebarPanel(
                h2('Drug Sales Data'),
               p('A chance to explore the Top 20 Drug brands by global sales value in 2014, 2013, and 2012 - with sales back to 2008. Source is 
IMS Health Institute.'),
                checkboxGroupInput('years', 'Years to Show:',
                                   unique(prodDng$year), selected = c("2008", "2009", "2010", "2011", "2012", "2013", "2014")),
                checkboxGroupInput('products', 'Products to Show:',
                                   levels(prodDng$Products), selected = levels(prodDng$Products)[levels(prodDng$Products) %in% latest$Products]),
                submitButton("Update View")
        ),
       mainPanel(
                tabsetPanel(type="tabs",
                         tabPanel("Plot", showOutput("myChart", "Nvd3")), 
                        tabPanel("StaticPlot", plotOutput("myPlot")), 
                        tabPanel("Table", tableOutput("table"))
                )
        )))
                        
                        