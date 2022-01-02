setwd("D:/MEL-Datarun/dataset/map") # Changes the wd
#install.packages("cartography")
library(cartography)
library(sf)
mik<-st_read("Indonesia/indokab_sp2010.shp")
mik <- mik[-c(51, 243), ] #delete duplicates in row 51 and 243

indokab<-read.csv("Indonesia/Indokab.csv")
mik <- merge(mik, indokab, by="IDSP2010")

cols<-carto.pal(pal1="multi.pal", n1=4)
choroLayer(x=mik, var="RIF", col=cols, method="quantile", border="white", lwd = 0.01, colNA="grey80",legend.title.txt=NULL)
choroLayer(x=mik, var="RIF", col=cols, method="quantile", border="grey80", lwd = 0.01, colNA="grey80",legend.title.txt=NULL)


cols<-carto.pal(pal1="sand.pal", n1=2)
choroLayer(x=mik, var="RIF", col=cols, border = "grey80", lwd = 2, legend.title.txt=NULL)

plot(st_geometry(mik))
plot(mik, col = "grey80", border = "grey80", lwd=0.1, add=TRUE)

labelLayer(x=mtq, txt="kabkot")
