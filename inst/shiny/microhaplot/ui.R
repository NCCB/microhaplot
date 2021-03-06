library(shiny)
library(shinyBS)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    style = "padding-top: 180px;z-index: -1;", #180
    # Application title
    #titlePanel("Haplotype Viewer"),
    absolutePanel(
      style = "z-index:10",
      top = 0,
      left = 0,
      right = 0,
      fixed = TRUE,
      div(style = "padding: 10px 4px 0px 4px; border-bottom: 0px solid #CCC; margin-bottom: 0px; background: #F3FCFF",
          fluidRow(
            #         column(2,
            #                column(8,offset=2,"HapPLOType",style="margin-top:5%;font-family:helvetica; font-size:400%"),
            #                column(2)),

            column(12,
                   tabsetPanel(
                     tabPanel("> field selection",
                   #bsCollapse(id = "collapseFilter", open = "+ microhaplotype filter:",
                              #bsCollapsePanel("> select group, individuals, loci:",



            column(
              12,
              column(
                6,
                column(2,
                       "Group:", style = "margin-top:21px;font-weight:bold; padding-left:0px",
                       offset = 0),
                column(
                  8,
                  selectInput("selectGroup", label = "", "", selected = ""),
                  style = "margin-top:-10px;margin-bottom:-10px;"
                ),
                # column(
                #   1,
                #   actionButton("groupBack", label = "<", width = "80%"),
                #   style = "margin-top:10px; padding: 0 0% 0 0%",
                #   offset = 0
                # ),
                # column(1, actionButton(
                #   "groupFor", label = ">", width = "80%"
                # ),
                # style = "margin-top:10px;padding:0 0% 0 0%; margin-left: 0px;"),
                style = "padding-left:0px"
              ),
              column(
                6,
                column(2, "Indiv:", style = "margin-top:21px;font-weight:bold; padding-left:0px"),
                column(
                  8,
                  selectInput("selectIndiv", label = "", "", selected = ""),
                  style = "margin-top:-10px;margin-bottom:-10px;"
                ),
                column(1,
                       actionButton(
                         "indivBack", label = "<", width = "80%"
                       ),
                       style = "margin-top:10px; padding: 0 0% 0 0%"),
                column(1, actionButton(
                  "indivFor", label = ">", width = "80%"
                ),
                style = "margin-top:10px;padding:0 0% 0 0%; margin-left: 0px;"),
                style = "padding-left:0px"
              ),
              column(10,
              column(2, "Locus:", style = "margin-top:22px;font-weight:bold; padding-left:0px"),
                column(
                  6,
                  selectInput("selectLocus", label = "", "", selected = "", width = "100%"),
                  style = "margin-top:-10px;margin-bottom:-10px; margin-left: -5%;padding-left:0px"
                ),
              column(2,
                     column(
                       5,
                       actionButton("locusBack", label = "<", width = "80%"),
                       style = "margin-top:10px; padding: 0 0% 0 0%",
                       offset = 0
                     ),
                     column(5, actionButton(
                       "locusFor", label = ">", width = "80%"
                     ),
                     style = "margin-top:10px;padding:0 0% 0 0%; margin-left: 0px;"),
                     style = "padding-left:0px"
              ),

              style = "padding-left:0px"

              ),
              #style= "margin-bottom:10px"
              style="background:#F7F7F7; padding-top:8px;padding-bottom:10px"
            ),#,
            #column(12,div(style = "padding:0.5px; background:white; margin-top: 10px; margin-bottom:10px")),
            #style = "primary"),

            style="padding-bottom:20px"
                     ),
            #bsCollapse(id = "collapseFilter", open = "+ microhaplotype filter:",
           #            bsCollapsePanel("+ microhaplotype filter:",
                                       tabPanel("+ read criteria",
            column(
              12,
              column(
                6,
                #column(3, "Filter (per indiv) " ,style = "margin-top:35px;font-weight:bold;padding-left:25px;"),
                #column(4, "Filter (per indiv)", style = "padding-left:25px; margin-top:3%;font-weight:light"),
                column(6, numericInput(#sliderInput(
                  "coverageMin",
                  "Minimal Read Depth",
                  min = 0,
                  #max = 200,
                  value = 0
                ),style = "margin-top:10px;text-align:center"),
                #column(1, "and",style = "margin-top:35px;padding-left:15px;font-weight:bold"),
                #column(2, "Min. allelic ratio:", style = "margin-top:4%;padding-left:2%;font-weight:light"),
                column(6, sliderInput(
                  "minAlleleRatio",
                  "Minimal Allelic Ratio",
                  min = 0,
                  max = 1.000,
                  value = 0
                ),style = "margin-top:10px;text-align:center"),
                style = "padding: 0 0 0 0; margin: -1% 0 0 0;"
              ),
              column(
                2,
                #column(4, actionButton("updateFilter", label="Update"), style="margin-top:5%; padding-right: 0px;"),
                #                       column(1,checkboxInput("filterCheck", label = "", value = FALSE),
                #                       style="margin-top:10px;"),
                #                       column(8,textInput("filter", label = "", value = "Enter filter...")),
                column(10, verticalLayout(actionButton("updateFilter", label = "apply",
                                                       width="100%",
                                                       style="text-align:center"),
                                          actionButton(
                                            "filterSave",
                                            "save",
                                            #icon("hdd-o"),
                                            width="100%",
                                            style = "margin-top:10px; text-align:center"
                                          )), style =
                         "margin-top:5px; padding-right: 0px;")
              ),
              #column(12, "Keep only top two common reads",style="margin-top:10px;font-weight:bold"),
              #column(12, h5("Post Filtered Table:"),downloadButton('downloadData', 'Download'), align="center",
              #offset=0,
              #style="padding: 0 0 0 0; margin: -3% 0 0 0;",
              #tags$style(type='text/css', "#downloadData { vertical-align:center; height: 40px;margin-top:0px;font-size:20px}")),
              #style="padding: 0 0 0 0; margin: 0% 0 0 0;")
              column(
                4,
                checkboxGroupInput("filterOpts", label = "", choices=list("keeps only top two haplotypes (per indiv)"=1)),

                style = "margin-top:-13px;"
              ),
              style="background:#F7F7F7; padding-top:10px")#,style = "primary")))
            #style="margin-bottom:10px"
                                       ),
           tabPanel("+ locus annotation",
                    column(12,
                    column(
                      5,
                      column(3, "Locus:", style ="margin-top:21px;font-weight:bold; padding-left:0px"),
                      column(9, textOutput("locusSelect1"), style =
                               "margin-left: 0px; color:grey; margin-top:21px;padding-left: 0px")
                    ),
                    column(5,
                    column(2, "status:",style = "margin-top:23px;font-weight:normal; padding-left:0px"),
                    column(4,
                           selectInput("locusAccept",
                                       "",
                                       choices=c("Accept","Reject","NA"),
                                      selected="NA"),
                           style = "margin-top:-8px; margin-bottom:0px"
                    ),
                    column(5,
                           checkboxInput("rewriteFilter", label = "save crit. cutoff", value = TRUE),
                           style = "margin-top:10px; margin-bottom:0px",
                           offset=1
                    )
                    ),

                    column(2,
                    actionButton(
                      "annotateSave",
                      "save",
                      icon("hdd-o"),
                      style = "margin-top:10px; padding-right: 0px; text-align:center",
                      width = "90%"
                    ),
                    offset=0
                    ),

                    column(12,
                    column(1, "Note:", style ="margin-top:5px; padding-left:0px"),
                    column(11,
                           textInput("locusComment", label = "", value = "", width="100%"),
                           style = "margin-top:-20px;padding-top:0px;padding-right: 0px;padding-left:0px")),
                    #style = "border-bottom: 1px double #d9d9d9;  margin-bottom: 40px; padding-top:15px; padding-bottom:20px"
                    style="background:#F7F7F7; padding-top:2px;padding-left:0px; margin-left:0px"
                    )
           )
           ))#,
           #column(2, h5(" haPLOT "), style="text-align: right")

          ))
    ),
    #hr(),
    #selectInput("selectLocus", label = "",
    #            choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
    #           selected = 1),
    #column(12, h1("")),
    bsAlert("alert"),
    navbarPage(
      "",
      tabPanel("Panel",
               fluidRow(column(
                 12,
                 column(
                   10,
                   selectInput(
                     "selectDB",
                     label = "Select PANEL:",
                     "",
                     selected = NULL,
                     width = "80%"
                   ),
                   style = "padding-left:0px;margin-top:10%;margin-bottom:-10px;",
                   offset = 1
                 )
               ))),

      # group label panel
      navbarMenu("Summary Info",
                 tabPanel(h5("by Group"),
                          # fluidRow(column(
                          #   4,
                          #   column(3, h5("Group:")),
                          #   column(9, h5(textOutput("groupSelect")), style =
                          #            "margin-left: 0px; color:grey")
                          # ),
                          # style = "border-bottom: 2px dashed #d9d9d9;  margin-bottom: 10px; padding-top:5px"),
                          fluidRow(
                            #column(3, plotOutput("nIndivByGroupPlot", height = "auto")),
                            column(5, plotOutput("fIndivByGroupPlot", height =
                                                   "auto")),
                            #column(3, plotOutput("nLociByGroupPlot", height =
                            #                       "auto")),
                            column(5, plotOutput("fLociByGroupPlot", height =
                                                   "auto"))
                          ),
                          fluidRow(
                            div(style = "padding: 40px; border-bottom: 20px solid white; background: white")
                          )
                          ),





                 tabPanel(
                   h5("by Individual"),
                   fluidRow(
                     #column(
                     #  4,
                     #  column(3, h5("Indiv:"), offset = 0),
                     #  column(9, h5(textOutput("indivSelect")), style =
                     #           "margin-left: 0px; color:grey")
                    # ),

                     #column(4,  column(3, h5("By Indiv:"), offset=0),
                     #       column(9, h6(textOutput("indivSelect")), style="margin-left: 0px; color:grey")),
                     column(4, column(
                       12,
                       column(7, h6("Display (indiv/pg) : ")),
                       column(
                         5,
                         selectInput(
                           "indivPerDisplay",
                           label = NULL,
                           choices = list(
                             "15" = 15,
                             "30" =
                               30,
                             "60" =
                               60,
                             "ALL" =
                               100
                           ),
                           selected =
                             15
                         )
                       )#,
                       #column(3,h6("indiv/pg"))
                     )),
                     column(4, column(
                       12,
                       column(1, h6("Page:")),
                       column(
                         5,
                         numericInput(
                           "indivPage",
                           label = NULL,
                           value = 1,
                           min = 1,
                           step = 1
                         ),
                         offset = 1
                       ),
                       column(1, h6("of ")),
                       column(1, h6(textOutput("maxIndivPage")))#,
                       # column(
                       #   2,
                       #   actionButton("updateIndivSizeDisplay", label = "refresh"),
                       #   offset = 1
                       # )
                     )),
                     column(4,column(4,h6("Height:")),
                            column(8,
                                   selectInput(
                                     "indivHeight",
                                     label = NULL,
                                     choices = list(
                                       "50%" = 0.5,
                                       "100%" =
                                         1,
                                       "150%" =
                                         1.5,
                                       "200%" =
                                         2,
                                       "500%" =
                                         5
                                     ),
                                     selected =
                                       1
                                   )
                                   )),
                     style = "border-bottom: 1px double #d9d9d9;  margin-bottom: 20px; padding-top:15px"
                   ),
                   #border-top: 2px dashed #d9d9d9;
                   fluidRow(
                     column(
                       5,
                       plotOutput(
                         "AlleleRatioByIndiv",
                         height = "auto",
                         dblclick = dblclickOpts(id = "plot_dblclick"),
                         brush = brushOpts(
                           id = "plot_brush",
                           direction = "y",
                           resetOnNew = TRUE
                         )
                       )
                     ),
                     column(2, plotOutput("numUniqHapByIndiv", height =
                                            "auto")),
                     column(2, plotOutput("fracHaploPlot", height = "auto")),
                     #    column(2,plotOutput("meanReadDepthByIndiv",height="auto")),
                     column(3, plotOutput("readDepthByIndiv", height =
                                            "auto"))
                   ),
                   #   column(4,plotOutput("distPlot",
                   #                       dblclick = dblclickOpts(
                   #                         id = "plot1_dblclick"),
                   #                       brush = brushOpts(
                   #                         id = "plot1_brush",
                   #                         direction = "y",
                   #                         resetOnNew = TRUE))),



                   column(12, h1("")),
                   br(),
                   fluidRow(
                     div(style = "padding: 10px; border-bottom: 8px solid white; background: white")
                   )
                 ),
                 tabPanel(
                   h5("by Locus"),
                   fluidRow(
                     #column(
                     #  4,
                     #  column(3, h5("Locus:"), offset = 0),
                     #  column(9, h5(textOutput("locusSelect")), style =
                     #           "margin-left: 0px; color:grey")
                     #),

                     #            column(5,column(12,
                     #                            column(2,h5("Locus:"),style="margin-top:0%;font-weight:bold"),
                     #                            column(8,selectInput("selectLocus", label ="","ALL",selected = "ALL", width="90%"),
                     #                                   style="padding-right: 0px; margin-top:-4%;padding-left:0%; padding-right: 0px;"),
                     #                            column(1,actionButton("locusBack", label="<", width="80%"),
                     #                                   style="margin-top:0px; padding: 0 0% 0 0%", offset=0),
                     #                            column(1,actionButton("locusFor", label=">", width="80%"),
                     #                                   style="margin-top:0px;padding:0 0% 0 0%; margin-left: 0px;"))),
                     #style="padding-right: 0px;padding-left:0px; padding-right: 0px;margin: -3% 0 0 0;")),
                     column(4, column(
                       12,
                       column(7, h6("Display (loci/pg) : ")),
                       column(
                         5,
                         selectInput(
                           "locusPerDisplay",
                           label = NULL,
                           choices = list(
                             "15" = 15,
                             "30" =
                               30,
                             "60" =
                               60,
                             "ALL" =
                               100
                           ),
                           selected =
                             15
                         )
                       )
                     )),
                     column(4, column(
                       12,
                       column(1, h6("Page:")),
                       column(
                         5,
                         numericInput(
                           "locusPage",
                           label = NULL,
                           value = 1,
                           min = 1,
                           step = 1
                         ),
                         offset = 1
                       ),
                       column(1, h6(" of ")),
                       column(1, h6(textOutput("maxlocusPage")))#,
                       # column(
                       #   2,
                       #   actionButton("updateLocusSizeDisplay", label = "refresh"),
                       #   offset = 1
                       # )
                     )),
                     column(4,column(4,h6("Height:")),
                            column(8,
                                   selectInput(
                                     "lociHeight",
                                     label = NULL,
                                     choices = list(
                                       "50%" = 0.5,
                                       "100%" =
                                         1,
                                       "150%" =
                                         1.5,
                                       "200%" =
                                         2,
                                       "500%" =
                                         5
                                     ),
                                     selected =
                                       1
                                   )
                            )),
                     style = "border-bottom: 1px double #d9d9d9;  margin-bottom: 20px; padding-top:15px"
                   ),
                   fluidRow(
                     column(
                       5,
                       plotOutput(
                         "haplDensityPlot",
                         height = "auto",
                         dblclick = dblclickOpts(id = "plotH_dblclick"),
                         brush = brushOpts(
                           id = "plotH_brush",
                           direction = "y",
                           resetOnNew = TRUE
                         )
                       )
                     ),
                     column(2, plotOutput("numHapPlot", height = "auto")),
                     column(2, plotOutput("fracIndivPlot", height = "auto")),
                     column(3, plotOutput("readDepthPerLocus", height =
                                            "auto"))
                   ),
                   fluidRow(
                     div(style = "padding: 40px; border-bottom: 20px solid white; background: white")
                   )
                 )
      ),

      navbarMenu("Filter Analysis",

                 # table panel
                 tabPanel(
                   h5("Broad Summary"),
                   fluidRow(
                     column(12, plotOutput("RDnARplot", height = "auto"))
                   )
                 ),

                 tabPanel(
                   h5("Criteria Breakdown"),
                   fluidRow(
                     column(5, plotOutput("allReadDepth", height = "auto",
                                          # hover = hoverOpts(
                                          #                 id = "RDplot_hover",
                                          #                 delay = 500,
                                          #                 delayType = "debounce"
                                          #               ),
                                          dblclick = dblclickOpts(id = "RDplot_dblclick")),
                            offset=2),
                     column(5, plotOutput("allAllelicRatio", height = "auto",
                                          # hover = hoverOpts(
                                          #   id = "ARplot_hover",
                                          #   delay = 500,
                                          #   delayType = "debounce"
                                          # ),
                                          dblclick = dblclickOpts(id = "ARplot_dblclick")
                     ))#,
                     #column(12, h4("Microhaplotypes that pass the critera:"))
                   ),
                   bsAlert("cutoffhapAlert"),
                   fluidRow(
                     column(2, plotOutput("haplabel", height = "auto"),
                                          style="padding-left:0px; padding-right:0px"
                            ),
                     column(5, plotOutput("hapReadDepth", height = "auto",
                                          click = "hapRDClick")),
                     column(5, plotOutput("hapAllelicRatio", height = "auto",
                                          click = "hapARClick"))
                   ),
                   fluidRow(
                     div(style = "padding: 20px; border-bottom: 8px solid white; background: white")
                   )
                 ),


      #locus assessement panel

      tabPanel(
        h5("Microhap Summaries"),
        fluidRow(
          bsAlert("hapAlert")
        ),
        fluidRow(
          column(12,
          column(6, htmlOutput("hapFreqClicked")),
          column(6, htmlOutput("hwClicked"))),
          column(6, plotOutput("hapFreq",
                               height ="auto",
                               click = "hapFreqPlotClick",
                               hover=hoverOpts(id="hapFreqPlotHover",
                                               delay=300,
                                               delayType = "throttle")),
                 style="padding-right:0px"),
          column(6, plotOutput("PairWiseHap", height =
                                 "auto",
                               click = "HWplotClick",
                               hover=hoverOpts(id="HWPlotHover",
                                               delay=300,
                                               delayType = "throttle")),
                 style="padding-left:0px"),
          column(12, htmlOutput("hapByGroupPlotClicked")),
          column(12, plotOutput("hapByGroupPlot", height =
                                  "auto",
                                click = "hapByGroupPlotClick",
                                hover=hoverOpts(id="hapByGroupPlotHover",
                                                delay=300,
                                                delayType = "throttle"))),
          column(12, plotOutput("hapSeq", height = "auto"))
        ),
        fluidRow(
          div(style = "padding: 20px; border-bottom: 8px solid white; background: white")
        )
      )
      ),

      tabPanel(
        "Inferential Analysis",
        "SrMicroHap is sensitive only to the changes in \"Locus\" selector tab\n",
        wellPanel(fluidRow(
          column(
            12,
            column(
              2,
              numericInput(
                "gibbIter",
                "Num of Iter:",
                min = 1,
                value = 1000,
                step=1)
            ),
            column(
              2,
              numericInput(
                "fracBurn",
                "% for Burn-in",
                min = 0,
                max = 99,
                value = 0
              )
            ),
            column(
              2,
              numericInput(
                "randomSeed",
                label = "Random Seed",
                value = 34532,
                min = 1,
                step = 1
              ),
              offset=1
            ),
            column(
              2,
              selectInput(
                "selectPrior",
                label = "Prior Model",
                c("uniform", "empirical"),
                selected = "empirical"
              )
            ),
            column(
              2,
              actionButton(
                "submitSrMicroHap",
                "Submit",
                icon("random"),
                style = "margin-top:20px; padding-right: 0px;",
                width = "100%"
              ),
              offset=1
            )
          ),
          column(12, "Parameters define the characteristic of true haplotypes:"),
          column(12,
                 column(3, numericInput(
                   "minRDsr",
                   label = "min read depth (total indiv)",
                   value = 10,
                   min = 1,
                   step = 1
                 )),
                 column(3, numericInput(
                   "minARsr",
                   "min allelic ratio",
                   min = 0,
                   max = 1,
                   value = 0.2,
                   step=0.01
                 ))
          ))),
        fluidRow(column(
          12, plotOutput("indivHapPosPlot", height = "auto")
        ),
        #column(12, plotOutput("allHapFreqPlot", height = "auto")),
        column(
          12, plotOutput("HapFreqByGroupPlot", height = "auto")
        )),
        fluidRow(
          div(style = "padding: 20px; border-bottom: 8px solid white; background: white")
        )
      ),
      # table panel
      tabPanel(
        "Output",
        fluidRow(
          column(
          6,
          column(4, h5("Select Table:"), offset =
                   0),
          column(
            8,
            selectInput(
              "selectTbl",
              label = "",
              c("observed variants (unfiltered)","observed variants (filtered)",
                "reported indiv haplotype", "SNP report", "locus annotation"),
              selected = "observed variants (unfiltered)"
            ),
            style = "padding-right: 0px; margin-top:-20px;margin-bottom:-20px;padding-left:0%; padding-right: 0px;"
          )
        ),
        column(6, column(
          12,
          #column(6, actionButton('updateTable', 'Update')),
          column(4, downloadButton('downloadData', 'Download'))
          #column(8, "* tbl is sensitve to field selection")
        )),
        style = "border-bottom: 1px double #d9d9d9;  margin-bottom: 40px; padding-top:15px; padding-bottom:20px"),

        #style = "border-bottom: 2px dashed #d9d9d9; border-top: 2px dashed #d9d9d9; margin-bottom: 5px; margin-top: 10px; padding-bottom: 15px; padding-top:15px"),



        column(12, DT::dataTableOutput('haploTbl'),
               style = "padding-bottom: 40px; border-bottom: 8px solid white; background: white"),
        fluidRow(
          div(style = "padding: 20px; border-bottom: 8px solid white; background: white")
        )
      ),

      tabPanel(
        "About",
        column(12,
        column(8,
               htmlOutput("about"),
               offset=2
        ))#,
        # column(12,
        #        column(8,
        #               "Contact & Citation:",
        #               offset=2
        #        ))
      ),

      position = "fixed-bottom"
    ),
    #tags$style(type="text/css", "navbar-static-top{z-index: -1}")),
    #,style="border-right:2px solid grey;"),
    #column(5, DT::dataTableOutput('haploFreqTbl'), offset=2),
    #column(12),
    #div(
    #  style="padding: 10px; border-bottom: 8px solid white; background: white"
    #),
    #column(4, DT::dataTableOutput('haploSummary')),
    titlePanel("", windowTitle = "HapPLOType: a view to your haplotypes")

  )
)
