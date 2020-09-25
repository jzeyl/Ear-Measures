
direct<-("G:/Dec 12")
direct<-"G:/Oct 17 nano small birds"
direct<-"G:/Oct 30"
direct<-"D:/August scans backup"


dec12pca<-list.files(direct, pattern = ".pca", recursive = TRUE, full.names = TRUE)
Oct17<-list.files(direct, pattern = ".pca", recursive = TRUE, full.names = TRUE)
Oct30<-list.files(direct, pattern = ".pca", recursive = TRUE, full.names = TRUE)
aug<-list.files(direct, pattern = ".pca", recursive = TRUE, full.names = TRUE)


dir.create("G:/pca_files/Oct30")

#Loop through the file list to COPY FILES to the desired folder:
for (i in aug){
  file.copy(i, "C:/Users/jeffzeyl/Desktop/pca_files/aug2020", copy.date = TRUE)
}