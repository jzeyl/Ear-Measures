
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

#check that there is one of each file in the folder
lengths<-c(length(TM),length(EC),length(FP),length(RW),length(CA),length(col))
lengths
