####list files in folder
files<-list.files("C:/Users/jeffzeyl/Desktop/pca_files/aug2020", 
                  pattern = "*.pca",
                  full.names = TRUE, recursive = TRUE)

#check the number of occurances
characters<- c("VoxelSizeX=","VoxelSizeY=","NumberImages=","Voltage=",
               "Current=",  "TimingVal=","Avg=", "Skip=","Filter=","RotationSector")

########fill dataframe with lines containing matches
output <- matrix(nrow=length(files),ncol = 35)#create matrix to populate
for (i in 1:length(files)){
  output[i,1]<- files[i]
  output[i,2]<- grep("VoxelSizeX=",readLines(files[i]), value=FALSE)#indices of the line
  output[i,3]<- grep("VoxelSizeX=",readLines(files[i]), value=TRUE)#indices of the line
  output[i,4]<- grep("VoxelSizeY=",readLines(files[i]), value=FALSE)#indices of the line
  output[i,5]<- grep("VoxelSizeY=",readLines(files[i]), value=TRUE)#indices of the line
  output[i,6]<- grep("NumberImages=",readLines(files[i]), value=FALSE)[1]#2 types
  output[i,7]<- grep("NumberImages=",readLines(files[i]), value=TRUE)[1]#2 types
  output[i,8]<- grep("NumberImages=",readLines(files[i]), value=FALSE)[2]#2 types
  output[i,9]<- grep("NumberImages=",readLines(files[i]), value=TRUE)[2]#2 type
  output[i,10]<- grep("Voltage=",readLines(files[i]), value=FALSE)[1]#2 types
  output[i,11]<- grep("Voltage=",readLines(files[i]), value=TRUE)[1]#2 type
  output[i,12]<- grep("Voltage=",readLines(files[i]), value=FALSE)[2]#2 types
  output[i,13]<- grep("Voltage=",readLines(files[i]), value=TRUE)[2]#2 type
  output[i,14]<- grep("Current=",readLines(files[i]), value=FALSE)[1]#2 types
  output[i,15]<- grep("Current=",readLines(files[i]), value=TRUE)[1]#2 types
  output[i,16]<- grep("Current=",readLines(files[i]), value=FALSE)[2]#2 types
  output[i,17]<- grep("Current=",readLines(files[i]), value=TRUE)[2]#2 types
  output[i,18]<- grep("Current=",readLines(files[i]), value=FALSE)[3]#2 types
  output[i,19]<- grep("Current=",readLines(files[i]), value=TRUE)[3]#2 types
  output[i,20]<- grep("TimingVal=",readLines(files[i]), value=FALSE)#2 types
  output[i,21]<- grep("TimingVal=",readLines(files[i]), value=TRUE)#2 types
  output[i,22]<- grep("Avg=",readLines(files[i]), value=FALSE)[1]#2 types
  output[i,23]<- grep("Avg=",readLines(files[i]), value=TRUE)[1]#2 types
  output[i,24]<- grep("Avg=",readLines(files[i]), value=FALSE)[2]#2 types
  output[i,25]<- grep("Avg=",readLines(files[i]), value=TRUE)[2]#2 types
  output[i,26]<- grep("Skip=",readLines(files[i]), value=FALSE)[1]#2 types
  output[i,27]<- grep("Skip=",readLines(files[i]), value=TRUE)[1]#2 types
  output[i,28]<- grep("Skip=",readLines(files[i]), value=FALSE)[2]#2 types
  output[i,29]<- grep("Skip=",readLines(files[i]), value=TRUE)[2]#2 types
  output[i,30]<- grep("Skip=",readLines(files[i]), value=FALSE)[3]#2 types
  output[i,31]<- grep("Skip=",readLines(files[i]), value=TRUE)[3]#2 types
  output[i,32]<- grep("Filter=",readLines(files[i]), value=FALSE)#2 types
  output[i,33]<- grep("Filter=",readLines(files[i]), value=TRUE)#2 types
  output[i,34]<- grep("RotationSector=",readLines(files[i]), value=FALSE)#2 types
  output[i,35]<- grep("RotationSector=",readLines(files[i]), value=TRUE)#2 types
}
output<-as.data.frame(output)#convert to df
outputclean<-output[,seq(1, length(colnames(output)), 2)]#remove columens which show line numbers

colnm<-c("names",
         characters[1],
         characters[2],
         rep(characters[3],2),#number images
rep(characters[4],2),#voltage
rep(characters[5],3),#current
characters[6],
rep(characters[7],2),#avg
rep(characters[8],3),#skip
characters[9],
characters[10])
colnames(outputclean)<-colnm

#convert factor to character for regex
outputclean[,1:18] <- sapply(outputclean[,1:18],as.character)
str(outputclean)

#extract values after the equals signs
outputclean2<-outputclean
for (i in 1:(nrow(outputclean))){
  for (j in (2:ncol(outputclean))){
  outputclean2[i,j]<-strsplit(outputclean[i,j],"=")[[1]][2]
  }
}
#strsplit(outputclean[2,3],"=")[[1]][2]
str(outputclean2)
names
outputclean2[,2:18] <- sapply(outputclean2[,2:18],as.numeric)



write.csv(outputclean2, "C:/Users/jeffzeyl/Desktop/pca_files/scanresolutions aug 2020.csv", row.names = FALSE)
