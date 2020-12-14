# import libraries
library(Morpho)#read.mpp function
library(geomorph)#digit curves function
library(rgl)#plotting

#####################################
######################################LOAD DATA

#
index<-1
#Volume<- "C"
#batch<- "Sept 27_2020"
#inputfolder<- paste0(Volume,":/Input/",batch)


setwd("C:/Users/jeffz/Desktop/New folder (2)/Ear-measures/Scan_measurements")
inputfolder<-paste0(getwd(),"/input")

#dir.create(paste0(Volume,":/Outputs/Singlevalues/",batch))#do only once at beginning
#check files are all there for calculations
source("checkfiles.R")
lengths

setwd("C:/Users/jeffz/Desktop/New folder (2)/Ear-measures/Scan_measurements")

#####################################RUN CALCULATIONS
source("run calculations.R")
#####################################
#

#####################3
#################### CHECK WIREFRAME PLOTS
#plot wireframe diagram of ear based input corrdinates. Will prompt for the 3D *.stl file for the columella
#setwd(paste0(Volume,":/0earmeasures/Scan_measurements/"))
source("plot_ear_auto_STL.R")

##################EXPORT#############
Volume<-"C:/Users/jeffz/Desktop/out"
dir.create(paste0(Volume,"/Outputs/"))
dir.create(paste0(Volume,"/Outputs/Singlevalues"))
dir.create(paste0(Volume,"/Outputs/TM angles"))
dir.create(paste0(Volume,"/Outputs/Coordinates"))
dir.create(paste0(Volume,"/Outputs/Snapshots"))
dir.create(paste0(Volume,"/Outputs/FCSVs"))
dir.create(paste0(Volume,"/Outputs/STLs"))


####CHECK OUTPUT PATH DRIVE IS GOING TO CORRECT USB/ HARD DRIVE"
#set output paths for saving the computed values
outputpathsingles<-paste0(Volume,"/Outputs/Singlevalues/")#calculated values
outputpathangles<-paste0(Volume,"/Outputs/TM angles/")#angles for all 
outputpathcoords<-paste0(Volume,"/Outputs/Coordinates/")# all computed coordinates on a single csv file
snapshotpath<-paste0(Volume,"/Outputs/Snapshots/")#directory for wirefram snapshots
outputfcsv<-paste0(Volume,"/Outputs/FCSVs/")
STLpath<-paste0(Volume,"/Outputs/STLs/")

#Save the computations and coordinates
setwd(paste0(Volume,":/0earmeasures/Scan_measurements/"))
source("outputs.R")
ID
#for (i in seq_along(stl)){
#file.copy(from = stl[i], to = paste0(outputfcsv,ID,"/"))
#}


