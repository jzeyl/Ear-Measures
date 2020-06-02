# import libraries
library(Morpho)#read.mpp function
library(geomorph)#digit curves function
library(rgl)#plotting

#####################################
######################################LOAD DATA

inputfolder<- "D:/Input/Jun2_2020"
Volume<- "D"

index<-13

for (i in 1:2){
d_ID<-list.dirs(inputfolder, full.names = FALSE)#list folders with specimens
d_direct<-list.dirs(inputfolder)#list folder directories, 1 folder per specimen
direct<-setwd(d_direct[index])#go through directories
ID<-paste0(d_ID[index],"")#go through IDs paste note if necessary
}
#list.files(direct)
TM<-list.files(direct, pattern = " TM.fcsv", recursive = TRUE, full.names = TRUE)
EC<-list.files(direct, pattern = " EC.fcsv", recursive = TRUE, full.names = TRUE)
FP<-list.files(direct, pattern = "points", recursive = TRUE, full.names = TRUE)
RW<-list.files(direct, pattern = "RW.fcsv", recursive = TRUE, full.names = TRUE)
CA<-list.files(direct, pattern = "CA.fcsv", recursive = TRUE, full.names = TRUE)
stl<-list.files(direct, pattern = "stl", recursive = TRUE, full.names = TRUE)
col<-grep("col", stl, value = TRUE)

lengths<-c(length(TM),length(EC),length(FP),length(RW),length(CA),length(TM),length(col))
lengths

#####################################
######################################RUN CALCULATIONS

#load coordinate files in this order: TM, EC, FP (pp), RW, CA
TMperimeter<-read.fcsv(TM)
ECpoints<-read.fcsv(EC)
FPperimeter<-read.mpp(FP)#read landmarks from meshlab
RWperimeter<-read.fcsv(RW)
CAperimeter<-read.fcsv(CA)

#convert point curves to equidistance points using digit curves function from geomorph
TMcurve<-as.data.frame(digit.curves(start = TMperimeter[1,], curve = TMperimeter, nPoints = 15, closed = TRUE))#make equidistant points
ECpoints<-as.data.frame(ECpoints)
FPcurve<-as.data.frame(digit.curves(start = FPperimeter[1,], curve = FPperimeter, nPoints = 15, closed = TRUE))#make equidistant points
RWcurve<-as.data.frame(digit.curves(start = RWperimeter[1,], curve = RWperimeter, nPoints = 15, closed = TRUE))#make equidistant points
CAcurve<-as.data.frame(digit.curves(start = CAperimeter[1,], curve = CAperimeter, nPoints = 15, closed = TRUE))#make equidistant points

#run calculation scripts
calculationfiles<-list.files(paste0(Volume,":/0earmeasures/Scan_measurements/calculations"), pattern = "*.R", full.names = TRUE)#########check dir here
sapply(calculationfiles,source,.GlobalEnv)# run the calculations from the R scripts
#source(calculationfiles[4])


#####################3
#################### CHECK WIREFRAME PLOTS
#plot wireframe diagram of ear based input corrdinates. Will prompt for the 3D *.stl file for the columella
setwd(paste0(Volume,":/0earmeasures/Scan_measurements/"))
source("plot_ear_auto_STL.R")

##################EXPORT#############

####CHECK OUTPUT PATH DRIVE IS GOING TO CORRECT USB/ HARD DRIVE"
#set output paths for saving the computed values
outputpathsingles<-paste0(Volume,":/Outputs/Singlevalues/")#calculated values
outputpathangles<-paste0(Volume,":/Outputs/TM angles/")#angles for all 
outputpathcoords<-paste0(Volume,":/Outputs/Coordinates/")# all computed coordinates on a single csv file
snapshotpath<-paste0(Volume,":/Outputs/Snapshots/")#directory for wirefram snapshots
outputfcsv<-paste0(Volume,":/Outputs/FCSVs/")
STLpath<-paste0(Volume,":/Outputs/STLs/")

#Save the computations and coordinates
setwd(paste0(Volume,":/0earmeasures/Scan_measurements/"))
source("outputs.R")
ID
#for (i in seq_along(stl)){
#file.copy(from = stl[i], to = paste0(outputfcsv,ID,"/"))
#}


