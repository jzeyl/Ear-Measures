D:\0backof head analyses\Feb23 crops\23022020 CT Scans

direct<-"D:/0backof head analyses/Feb23 crops/23022020 CT Scans"
allfolders<-list.dirs(direct)
allfoldersstk<-grep("Stack",allfolders, value = TRUE)
allfoldersstk<-allfoldersstk[-6]

allfoldersstk<-grep("earcrp",allfolders, value = TRUE)


#create directories
for (i in seq_along(allfoldersstk)){
dir.create(paste0(allfoldersstk[[i]],"/earcrp"), recursive = TRUE)
}
  


dec12pca<-list.files(direct, pattern = ".pca", recursive = TRUE, full.names = TRUE)
Oct17<-list.files(direct, pattern = ".pca", recursive = TRUE, full.names = TRUE)
Oct30<-list.files(direct, pattern = ".pca", recursive = TRUE, full.names = TRUE)

dir.create("G:/pca_files/Oct30")

#Loop through the file list to COPY FILES to the desired folder:
for (i in Oct30){
  file.copy(i, "G:/pca_files/Oct30", copy.date = TRUE)
}

###################################IMAGE J MACRO
#import image. INPUT INPUT DIRECTORY HERE
run("Image Sequence...", "open=[E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_05 HP-01-2020/Stack/earcrp/Substack (377-1209)0000.tif] sort");
run("Image Sequence...", "open=[E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_01 CSB-01-2019/Stack/Stack0000.tif] sort");

#crop
#makeRectangle(308, 90, 514, 416);
run("Crop");
run("Make Substack...", "  slices=71-114");
#keep substack

#save to disk new image sequence. INPUT OUTPUT DIRECTORY HERE
run("Image Sequence... ", "format=TIFF save=[E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_01 CSB-01-2019/Stack/earcrp/Substack (470-1200)0000.tif]");###################################IMAGE J MACRO

INPUT:
allfoldersstk_1stfile<-paste0(allfoldersstk,"/Stack0000.tif")
Output:

#open file
run("Image Sequence...", "open=[E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_02 Can-01-20/Stack/Stack0000.tif] sort");
#select rectangle area
run("Crop");
#select3D region
run("Make Substack...", "  slices=1224-1620")
run("Make Substack...", "  slices=479-1053")
#ctrl+J open interactive compiler in imageJ
#ctrl+shift+x = crop

#allfoldersstk:
#[1] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_01 CSB-01-2019/Stack"   
#run("Image Sequence...", "open=[E:/0backof head analyses/Feb23 crops/23022020 CT Scans/24032020_01 Hcrow/Stack/Stack0000.tif] sort")
run("Image Sequence...", "open=[E:/0backof head analyses/Feb23 crops/23022020 CT Scans/24032020_04 GH-01-2020/Stack/Stack0000.tif] sort")


allfoldersstk_1stfile: hashtag means this one has been cropped already
#[1] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_01 CSB-01-2019/Stack/Stack0000.tif"   
#[2] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_02 Can-01-20/Stack/Stack0000.tif"     
#[3] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_03 BSW-01-2020/Stack/Stack0000.tif"   
#[4] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_04 CRChat-01-2020/Stack/Stack0000.tif"
#[5] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_05 HP-01-2020/Stack/Stack0000.tif"    
#[6] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_06 Acrake-01-2020/Stack/Stack0000.tif"
#[7] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_07 Ctiel-01-2020/Stack/Stack0000.tif" 
#[8] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_08 WCPion-01-2020/Stack/Stack0000.tif"
#[9] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/23032020_09 SHen-01-2020/Stack/Stack0000.tif"  
#[10] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/24032020_01 Hcrow/Stack/Stack0000.tif"         
#[11] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/24032020_02 RN-02-2019/Stack/Stack0000.tif"    
#[12] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/24032020_03 Eparr-01-2020/Stack/Stack0000.tif" 
#[13] "E:/0backof head analyses/Feb23 crops/23022020 CT Scans/24032020_04 GH-01-2020/Stack/Stack0000.tif" 

TO CROP
-sooty shearwater, crowned cormorant
#"F:/0CT Scans/1_Jan 2019/17012019_03 Sooty shearwater/sootybac of head 17b/v0021000.tif"
#"F:/0CT Scans/3_Jul19 2019/19072019_03 CRC003/ear extracted oct 17/oct 170000.tif"

run("Image Sequence...", "open=[E:/0backof head analyses/3_Dec 12 crp export/05 st007/ternback000.tif] sort")
run("Make Substack...", "  slices=172-595")


TO CROP

todo<-c("F:/0CT Scans/2_Apr26 2019/26042019_04 Double-Collared Sunbird1/16bexport oct17/dcsb16b export000.tif",
"F:/0CT Scans/2_Apr26 2019/26042019_05 Orange breasted Sunbird 1/OBSBback of head/OBSB back of head000.tif",
"F:/0CT Scans/4_Cambridge Jul 2019/AP-01-2011 [2019-07-23 09.42.20]/16Bearcrp Nov 27/Substack (865-1612)0000.tif",
"F:/0CT Scans/4_Cambridge Jul 2019/SPS-02-BAS [2019-07-23 11.42.04]/SPS-02-BAS_01/SPS-02- .... BAS_0001.tif")

for(i in seq_along(todo)){
dir[i]<-gsub(pattern = "([^\\/]+$)", "", todo[i], perl = TRUE)#note R uses two backslashes for escape character
}
for (i in seq_along(dir)){
dir.create(paste0(dir[i],"earcrp"))
}

#todo<-c("E:/0backof head analyses/3_Dec 12 crp export/05 st007/ternback000.tif",
#"E:/0backof head analyses/3_Dec 12 crp export/06 LF-01-2019/lanner falcon back of head0000.tif",
#"E:/0backof head analyses/5_Feb7crops/CFranc-01-2019/cfranc-01-2019 backofhead0000.tif",
#"E:/0backof head analyses/5_Feb7crops/Cparr-02-2019/Cparr-02-2019backofhead0000.tif",
#"E:/0backof head analyses/5_Feb7crops/TO003/TO003backofhead0000.tif",
#"E:/0backof head analyses/6_Feb12crops/LD-01-2019/LD012019backofhead0000.tif",
#"E:/0backof head analyses/6_Feb12crops/STch-01-2019/STch-01-2019backhead0000.tif",
#"E:/0backof head analyses/6_Feb12crops/FTdrong-01-2019/Ftdrong-01-2019backofhead0000.tif",
#"E:/0backof head analyses/6_Feb12crops/KTC-01-2020/KTC-01-20200000.tif",
#"E:/0backof head analyses/6_Feb12crops/LB/LBbackofhead0000.tif",
#"E:/0backof head analyses/6_Feb12crops/Bouc-01-2020/Bcouc-01-2020 backofhead0042.tif",
#"E:/0backof head analyses/6_Feb12crops/BCL-01-2019/BCL-01-2019 black capped lory0000.tif",
#"E:/0backof head analyses/6_Feb12crops/Cfisc-01-2019/Cfisc-01-2019backofhead0000.tif",
#"E:/0backof head analyses/6_Feb12crops/Othrush-01-2019/Othrush-01-2019backofhead0000.tif")

run("Image Sequence...", "open=[E:/0backof head analyses/6_Feb12crops/STch-01-2019/STch-01-2019backhead0000.tif] sort")
run("Make Substack...", "  slices=94-1000")
