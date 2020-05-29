Greatshearwater<-"E:/0backof head analyses/3_Dec 12 crp export/09 great shearwater/earcrp"
Bankcorm<-"E:/0backof head analyses/2_Oct 30 earregion expt/6_BC-01-2019/earcrp"
Canary<-"E:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_02 Can-01-20/Stack/earcrp"
WCPion<-"E:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_08 WCPion-01-2020/Stack/earcrp"
Goldf01<-"E:/0backof head analyses/1_Oct 17export/1_GoldF01/earcropped"
CSB<-"E:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_01 CSB-01-2019/Stack/earcrp"
SHen<-"E:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_09 SHen-01-2020/Stack/earcrp"
Hoopoe<-"E:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_05 HP-01-2020/Stack/earcrp"
GH01<-"E:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/24032020_04 GH-01-2020/Stack/earcrp"
Ctiel<- "E:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_07 Ctiel-01-2020/Stack/earcrp"
Eparr<-"E:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/24032020_03 Eparr-01-2020/Stack/earcrp"
BSW<-"E:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_03 BSW-01-2020/Stack/earcrp"
Hcrow<-"E:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/24032020_01 Hcrow/Stack/earcrp"

directs<-c(Bankcorm,  BSW  ,          Canary    ,      CSB         ,    Ctiel ,          Eparr  ,        
           GH01    ,       Goldf01    ,     Greatshearwater, Hcrow    ,       Hoopoe    ,      SHen  ,         
           WCPion)
#list files
d<-list.files(BSW, full.names = TRUE)
(d)[[10]]#filename
file.info((d)[[10]])$size#file size
df<-file.info(d)#df of file size


#list tiff files in the directory

threedir<-c(Hcrow,GH01,Eparr)
lapply(threedir, getbigtif)


output <- matrix(nrow=length(directs),ncol = 2)#create matrix to populate

getbigtif<- function(dir){

filename
num_files
}

for (i in 1:length(directs)){
  d<-list.files(directs[i], pattern = ".tif", recursive = FALSE, full.names = TRUE)
  dtif<-file.info(d)
  dtif$name<-row.names(dtif)
  dtif$sizekb<-dtif$size/1000
  filename<-(dtif[dtif$sizekb>50000,"name"])#get tif files biget than 50 MB. should be only one!
  num_files<-length(dtif[dtif$sizekb>100000,"name"])
  output[i,1]<- filename
  output[i,2]<- num_files
}
############check that the second colum only pulls up one patch per directory

volumestocopy<-output[,1]#

folders<-c("Bankcorm",  "BSW"  ,          "Canary"    ,      "CSB"         ,    "Ctiel" ,          "Eparr"  ,        
           "GH01"    ,       "Goldf01"    ,     "Greatshearwater", "Hcrow"    ,       "Hoopoe"    ,      "SHen"  ,         
           "WCPion")

outputdir<-"C:/Users/jeffzeyl/Desktop/copyoutput"
#directories to copy to
outputfolders<-list.dirs(outputdir, full.names = FALSE)[2:length(
  list.dirs("C:/Users/jeffzeyl/Desktop/copyoutput", full.names = FALSE))]

#setdiff(folders,outputfolders)
#setdiff(outputfolders,folders)
#setequal(outputfolders,folders)
#
#folders %in% outputfolders

#check that folders match
folders == outputfolders

for(i in seq_along(volumestocopy)){
file.copy(volumestocopy[i],paste0(outputdir,"/",outputfolders[i]))
}
