*shape file location
gl peta "D:\MEL-Datarun\dataset\map"

*set working directories
cd "$peta"

set more off

shp2dta using "$peta\Indonesia\kab\indokab_sp2010", database(indb) coordinates(incoord) genid(id)
use indb, clear
rename IDSP2010 idsp2010
destring idsp2010, replace

**in case there are double district id
*sort idkab
*gen h_doubleidkab=idkab==idkab[_n-1]
*drop if h_doubleidkab==1	

*merge with any spatial data or district level dataset
merge m:m idsp2010 using "$peta\Indonesia\kab\social_dist.dta"

*to show district variation on certain index 
spmap index using incoord, id(id) fcolor(Pastel1) ocolor(none) ndfcolor(gs10) ndocolor(gs10) clmethod(custom) clbreaks(0.9 1.9 2.9 3.9 4.9 5.9)

*eliminate border
spmap index  using incoord, id(id) fcolor(Terrain) ndfcolor(gs12) ndocolor(gs12) mopattern(blank)
spmap index  using incoord, id(id) fcolor(Pastel1) ndfcolor(gs12) ndocolor(gs12) mopattern(blank)


