direct<-"E:"
scandays<-list.dirs(direct, recursive = F)[2:3]
scandaysshort<-list.dirs(direct, recursive = F, full.names = F)[2:3]#[1:7]

#find scene files
for (i in 1:length(scandays)){
scenefiles<-list.files(scandays[i], pattern = "Scene.mrml", recursive = TRUE, full.names = TRUE)
scenefileinfo<-file.info(scenefiles)
scenefileinfo$scandate<-rep(scandays[i], nrow(scenefileinfo))
scenefileinfo$files<-row.names(scenefileinfo)
basicinfo<-scenefileinfo[,c("scandate","files","mtime")]
basicinfosorted<-basicinfo[order(basicinfo$mtime, decreasing = TRUE),]

write.csv(basicinfosorted, paste0("C:/Users/jeffzeyl/Desktop/file locations/Seagate Aug 2020/scene files/",scandaysshort[i],".csv"))
}


#find vgl files (air volume)
for (i in 1:length(scandays)){
  vglfiles<-list.files(scandays[i], pattern = "vgl", recursive = TRUE, full.names = TRUE)
  vglfileinfo<-file.info(vglfiles)
  vglfileinfo$scandate<-rep(scandays[i], nrow(vglfileinfo))
  vglfileinfo$files<-row.names(vglfileinfo)
  basicinfo<-vglfileinfo[,c("scandate","files","mtime")]
  basicinfosorted<-basicinfo[order(basicinfo$mtime, decreasing = TRUE),]
  
  write.csv(basicinfosorted, paste0("C:/Users/jeffzeyl/Desktop/file locations/Seagate 3/vgl files/",scandaysshort[i],".csv"))
}

#sort by last modified
vglinfo$mtime[order(vglinfo$mtime, decreasing = TRUE)]
vgldatesorted<-vglinfo[order(vglinfo$mtime, decreasing = TRUE),]
































