#n is the number of folders in the 'inputdirect' directory to check for stls to copy

for(n in 2:14){
inputdirect<-"E:/Input/may28_2020"
Volume<- "E"

index<-n

for (i in 1:2){
  d_ID<-list.dirs(inputdirect, full.names = FALSE)#list folders with specimens
  d_direct<-list.dirs(inputdirect)#list folder directories, 1 folder per specimen
  direct<-setwd(d_direct[index])#go through directories
  ID<-paste0(d_ID[index],"Correct_")#go through IDs
}
stl<-list.files(direct, pattern = "stl", recursive = TRUE, full.names = TRUE)

#where the stls will be copied to
outputfcsv<-paste0(Volume,":/Outputs/FCSVs/")

for (i in seq_along(stl)){
  file.copy(from = stl[i], to = paste0(outputfcsv,ID,"/"))
}
}