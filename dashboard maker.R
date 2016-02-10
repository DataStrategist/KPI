library(googleVis)

## Set wd
setwd("your folder")

df <- data.frame(thing=paste("Item",1:15),
                 measure=round(runif(15,max=10),2),
                 target=round(runif(15,max=10),2))

## unimpresive dashboard
plot(gvisTable(df))

## Make more interesting one... first set target thresholds
Threshold1 <- 0.8
Threshold2 <- 0.5

## Now do measure/target and compare against Thresholds
## high trigger
df$graphic[df$measure/df$target > Threshold1] <- 
  '<img src="green.gif">'

## low trigger
df$graphic[df$measure/df$target < Threshold2] <- 
  '<img src="red.gif">'

## medium trigger
df$graphic[is.na(df$graphic)] <- 
  '<img src="yellow.gif">'

plot(gvisTable(df))
## won't work on local... push to an html file and all will be good.


##--- Make html ----
ObsRep <- gvisTable(df)
# plot(ObsRep)
cat(paste("<html><head></head><body>",
          "<h1>Best Dashborde!!!1!</h1>",sep=""),
    ObsRep$html$header,
    ObsRep$html$chart,
    "</body></html>",
    file="AnimatedKPIdashboard.html")
browseURL("AnimatedKPIdashboard.html")

## Decent, but add one last trigger:

Threshold3 <- 0.2
## lowlowlowlowlow trigger
df$graphic[df$measure/df$target < Threshold3] <- 
  '<img src="redFlashing.gif">'

##--- Make html again ----
ObsRep <- gvisTable(df)
# plot(ObsRep)
cat(paste("<html><head></head><body>",
          "<h1>Best Dashborde!!!1!</h1>",sep=""),
    ObsRep$html$header,
    ObsRep$html$chart,
    "</body></html>",
    file="AnimatedKPIdashboard.html")
browseURL("AnimatedKPIdashboard.html")
