#set directory
setwd("D:/Datarun/dataset/map") # Changes the wd

#R map package
#install.packages("cartography")
library(cartography)
library(sf)

#read shp file
mik<-st_read("Indonesia/kab/indokab_sp2010.shp")
mik <- mik[-c(51, 243), ] #delete duplicates in row 51 and 243

#merge district level data
indokab<-read.csv("Indonesia/kab/Indokab.csv")
mik <- merge(mik, indokab, by="IDSP2010")

#map visualization-multi color
cols<-carto.pal(pal1="multi.pal", n1=4)
choroLayer(x=mik, var="RIF", col=cols, method="quantile", border="grey80", lwd = 0.01, colNA="grey80",legend.title.txt=NULL)
choroLayer(x=mik, var="RIF", col=cols, method="quantile", border="white", lwd = 0.01, colNA="grey80",legend.title.txt=NULL)

#map visualization-sand color
cols<-carto.pal(pal1="sand.pal", n1=2)
choroLayer(x=mik, var="RIF", col=cols, border = "grey80", lwd = 2, legend.title.txt=NULL)
labelLayer(x=mik, txt="kabkot")

#map visualization-empty plot
plot(st_geometry(mik))
plot(mik, col = "grey80", border = "grey80", lwd=0.1, add=TRUE)
