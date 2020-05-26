
for(n in 5:10){
inputfolder<- "D:/Input/may25_2019"
Volume<- "D"

index<-n

for (i in 1:2){
  d_ID<-list.dirs(inputfolder, full.names = FALSE)#list folders with specimens
  d_direct<-list.dirs(inputfolder)#list folder directories, 1 folder per specimen
  direct<-setwd(d_direct[index])#go through directories
  ID<-paste0(d_ID[index],"Correct_")#go through IDs
}
stl<-list.files(direct, pattern = "stl", recursive = TRUE, full.names = TRUE)

outputfcsv<-paste0(Volume,":/Outputs/FCSVs/")

for (i in seq_along(stl)){
  file.copy(from = stl[i], to = paste0(outputfcsv,ID,"/"))
}
}