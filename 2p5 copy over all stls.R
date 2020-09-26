#n is the number of folders in the 'inputdirect' directory to check for stls to copy

inputdirect<-"D:/Input/Jun25_2020"
Volume<- "D"
numfolders<- length(list.dirs(inputdirect))

#where the stls will be copied to
#outputfcsv<-paste0(Volume,":/Outputs/FCSVs/")#note subfolders are indicated in the loops
output<-"C:/Users/jeffzeyl/Desktop/copyoutput/Sept 11/"###############<-input folder here
#dir.create(output)

for(n in 2:numfolders){#note first folder is "", lack of folder
index<-n
#assign the ID folder
for (i in 1:2){
  d_ID<-list.dirs(inputdirect, full.names = FALSE)#list folders with specimens
  d_direct<-list.dirs(inputdirect)#list folder directories, 1 folder per specimen
  direct<-setwd(d_direct[index])#go through directories
  ID<-paste0(d_ID[index])#go through IDs
}
stl<-list.files(direct, pattern = "stl", recursive = TRUE, full.names = TRUE)

for (i in seq_along(stl)){
  file.copy(from = stl[i], to = paste0(output,ID,"/"))
}
}