# import libraries
library(Morpho)#read.mpp function
library(geomorph)#digit curves function
library(rgl)#plotting

setwd("F:/repeatability tests/Feb20retests/RDretests1/RD03r1")#####check dir here
getwd()

ID<-"test4"#set the specimen code to be used in naming files

#load coordinate files in this order: TM, EC, FP (pp), RW, CA
TMperimeter<-read.fcsv(file.choose())
ECpoints<-read.fcsv(file.choose())
FPperimeter<-read.mpp(file.choose())#read landmarks from meshlab
RWperimeter<-read.fcsv(file.choose())
CAperimeter<-read.fcsv(file.choose())

#convert point curves to equidistance points using digit curves function from geomorph
TMcurve<-as.data.frame(digit.curves(start = TMperimeter[1,], curve = TMperimeter, nPoints = 15, closed = TRUE))#make equidistant points
ECpoints<-as.data.frame(ECpoints)
FPcurve<-as.data.frame(digit.curves(start = FPperimeter[1,], curve = FPperimeter, nPoints = 15, closed = TRUE))#make equidistant points
RWcurve<-as.data.frame(digit.curves(start = RWperimeter[1,], curve = RWperimeter, nPoints = 15, closed = TRUE))#make equidistant points
CAcurve<-as.data.frame(digit.curves(start = CAperimeter[1,], curve = CAperimeter, nPoints = 15, closed = TRUE))#make equidistant points

#run calculation scripts
calculationfiles<-list.files("F:/earmeasures/Scan_measurements/calculations", pattern = "*.R", full.names = TRUE)#########check dir here
sapply(calculationfiles,source,.GlobalEnv)# run the calculations from the R scripts
#source(calculationfiles[4])

#plot wireframe diagram of ear based input corrdinates. Will prompt for the 3D *.stl file for the columella
setwd("F:/earmeasures/Scan_measurements/")
source("plot_ear_auto_STL.R")

#set output paths for saving the computed values
outputpathsingles<-"E:/0measure RW,CA/RWCA/Outputs/Singlevalues/"#calculated values
outputpathangles<-"E:/0measure RW,CA/RWCA/Outputs/TM angles/"#angles for all 
outputpathcoords<-"E:/0measure RW,CA/RWCA/Outputs/Coordinates/"# all computed coordinates on a single csv file
snapshotpath<-"F:/0measure RW,CA/RWCA/Outputs/Snapshots/"#directory for wirefram snapshots
STLpath<-"F:/0measure RW,CA/RWCA/Outputs/STLs/"

#Save the computations and coordinates
source("outputs.R")




