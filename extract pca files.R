
direct<-("G:/Dec 12")
direct<-"G:/Oct 17 nano small birds"
direct<-"G:/Oct 30"

dec12pca<-list.files(direct, pattern = ".pca", recursive = TRUE, full.names = TRUE)
Oct17<-list.files(direct, pattern = ".pca", recursive = TRUE, full.names = TRUE)
Oct30<-list.files(direct, pattern = ".pca", recursive = TRUE, full.names = TRUE)

dir.create("G:/pca_files/Oct30")

#Loop through the file list to COPY FILES to the desired folder:
for (i in Oct30){
  file.copy(i, "G:/pca_files/Oct30", copy.date = TRUE)
}