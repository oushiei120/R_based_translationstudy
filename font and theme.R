library(showtext)
font_add("SourceHanSerif",regular = "/Library/Fonts/SourceHanSerif-Regular.ttc",
         bold="SourceHanSerif-Bold.ttc")
par(family = "SourceHanSerif")
showtext_auto()

#==========
# set my theme 
#==========
theme_ou <- function(){ 
  font <- "SourceHanSerif"   #assign font family up front
  theme_minimal() %+replace%    #replace elements we want to change
    theme(
      panel.grid.major = element_blank(),    #strip major gridlines
      panel.grid.minor = element_blank(),    #strip minor gridlines
      axis.ticks = element_blank(),          #strip axis ticks
      plot.title = element_text(             #title
        family = font,            #set font family
        size = 20,                #set font size
        face = 'bold',            #bold typeface
        hjust = 0,                #left align
        vjust = 0),               #raise slightly
      plot.subtitle = element_text(          #subtitle
        family = font,            #font family
        size = 14),               #font size
      plot.caption = element_text(           #caption
        family = font,            #font family
        size = 9,                 #font size
        hjust = 1),               #right align
      axis.title = element_text(             #axis titles
        family = font,            #font family
        size = 15,
        face='bold'),               #font size
      axis.text = element_text(              #axis text
        family = font,            #axis famuly
        size = 15),                #font size
      axis.text.x = element_text(            #margin for axis text
        margin=margin(5, b = 10)),
      legend.text = element_text(size=10,
                                 family = font)
      
    )
}

