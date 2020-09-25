
run("Raw...", "open=[D:/August scans backup/Aug 24/1 YNA/24082020_01 YNA-01-2019-PR.vol] 
    image=[16-bit Unsigned] width=1612 height=1433 number=1977 little-endian");
run("Make Substack...", "  slices=71-114");
saveAs("Tiff", "D:/August scans backup/Aug 24/1 YNA/earcrp/24082020_01 YNA-01-2019-PR.tif");



direct<-"E:/August scans backup/Aug 27"
allfolders<-list.dirs(direct, recursive = F)

#create directories
for (i in seq_along(allfolders)){
  dir.create(paste0(allfolders[[i]],"/earcrp"), recursive = TRUE)
}

fileindex<-4
writeopen(fileindex)
writesave(fileindex)

  
writeopen<-function(fileindex){
#volume file
l1<-paste0("open=[",list.files(allfolders[fileindex], pattern = ".vol", full.names = T),"]")
l1
#writeClipboard(l1)

#vgi file
d<-list.files(allfolders[[fileindex]], pattern = ".vgi", full.names = T)
k<-readLines(d)[3]
writeClipboard(readLines(d)[3])
split<-strsplit(k, " ")
imagesize<-paste0(" image=[16-bit Unsigned] ",
           "width=",split[[1]][3], " height=",split[[1]][4], " number=",split[[1]][5],
           " little-endian")
d
imagesize
writeClipboard(paste0(l1,imagesize))
}
writesave<-function(fileindex){
#save
out<-paste0(allfolders[[fileindex]],"/earcrp/", list.files(allfolders[[fileindex]], pattern = ".vol"),".tif")
out<-gsub(".vol","",out)
out
writeClipboard(out)
}


run("Make Substack...", "  slices=263-872");
run("Make Substack...", "  slices=221-724");
run("Make Substack...", "  slices=388-925");
run("Make Substack...", "  slices=138-798");
run("Make Substack...", "  slices=599-1106");
run("Make Substack...", "  slices=387-967");
run("Make Substack...", "  slices=768-1105");
run("Make Substack...", "  slices=340-672");
run("Make Substack...", "  slices=252-677");
run("Make Substack...", "  slices=1025-1256");
run("Make Substack...", "  slices=148-445");
run("Make Substack...", "  slices=446-899");
run("Make Substack...", "  slices=1038-1246");




run("Make Substack...", "  slices=498-940");
run("Make Substack...", "  slices=338-830");
run("Make Substack...", "  slices=276-926");
run("Make Substack...", "  slices=372-809");
run("Make Substack...", "  slices=534-1043");



writeClipboard(l1)
writeClipboard(imagesize)
writeClipboard(out)
"D:/August scans backup/Aug 25/CV01"  
run("Raw...", "open=[D:/August scans backup/Aug 25/CV01/25082020_03 CV-01-2019.vol]
    image=[16-bit Unsigned] width=1658 height=1401 number=2021 little-endian");
#run("Make Substack...", "  slices=");
saveAs("Tiff", "D:/August scans backup/Aug 25/CV01/earcrp/25082020_03 CV-01-2019.tif");



"D:/August scans backup/Aug 25/EMU01"
"D:/August scans backup/Aug 25/JB01" 
"D:/August scans backup/Aug 25/SGHB" 
"D:/August scans backup/Aug 25/SI02"

