##### IMPORT LIBRARIES#####
library(Morpho)#read.mpp function
library(geomorph)#digit curves function
library(rgl)#plotting


######################################LOAD DATA#########

#set working directory to where the R scripts are located
repositorypath<-"C:/Users/jeffz/Desktop/New folder (2)/Ear-measures/Scan_measurements"
setwd(repositorypath)


#indicate main folder where data are located
#Each speci all in a subfolder of a main folder. 
#Index indicates which subfolder to process.
inputfolder<-"C:/Users/jeffz/Desktop/New folder"
listdirs(inputfolder)
index<-3

#set the ID code for the specimen
ID<-"test2"

#check files are all there for calculations
setwd("C:/Users/jeffz/Desktop/New folder (2)/Ear-measures/Scan_measurements")
source("checkfiles.R")#checks that all the needed files are present in the folder.
lengths
#'lengths' should be a sequence of 6 1s. If not, a file is missing, or there are extra files

setwd(repositorypath)
#####################################RUN CALCULATIONS##########
source("run calculations.R")

setwd(repositorypath)
#####################3
#################### CHECK WIREFRAME PLOTS###############
#plot wireframe diagram of ear based input corrdinates. Will prompt for the 3D *.stl file for the columella
source("plot_ear_auto_STL.R")

##################EXPORT#############
Volume<-"C:/Users/jeffz/Desktop/out"# set base path for file exporting
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
setwd(repositorypath)
source("outputs.R")
ID
#for (i in seq_along(stl)){
#file.copy(from = stl[i], to = paste0(outputfcsv,ID,"/"))
#}


