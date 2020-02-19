
#Input the directories to check for files 
adeliepenguin<-"G:/0CT Scans/4_Cambridge Jul 2019/ADP-01-2019 [2019-07-23 13.19.23]/ADP-01-2019_01/crpears"
razorbill<-"G:/0CT Scans/4_Cambridge Jul 2019/Razorbill [2019-07-22 12.22.36]/Razorbill_01/earcrp/Nov 26 16bit"
southgeorgiashag<-"G:/0CT Scans/4_Cambridge Jul 2019/SGS-01-2017 [2019-07-23 12.42.20]/SGS-01-2017_01/earregion"
flamingo<-"G:/0CT Scans/1_Jan 2019/17012019_02 Flamingo/flamingo back of head oct17/earcrp"
SGpintail<-"G:/0CT Scans/4_Cambridge Jul 2019/SGPT-01-1994 [2019-07-22 15.41.43]/SGPT-01-1994_01/colaug13"
sheathbill<-"G:/0CT Scans/0_JZ microCT scans/sheathbill/sheathbill test march/sheahbill data/05032018_02 Sheathbill dry/stack/earcrp"
bluepetrel<-"G:/0CT Scans/4_Cambridge Jul 2019/BP-01-2011 [2019-07-23 14.15.05]/BP-01-2011_01/colaug12"
hadedaibis<- "F:/Oct 30 earregion expt/7_HI-02-2019"
WCP<-"G:/0CT Scans/0_JZ microCT scans/petral2 and 3 repeat/12102018_03 Petrel3 no filter/backofhead export oct 17"
olivepigeon<-"F:/Oct 17export/5_OP"
SGdivingpetrel<-"G:/0CT Scans/4_Cambridge Jul 2019/SGDP-01-2014 [2019-07-23 10.01.00]/SGDP-01-2014_01/earcrp"
RD4<-"F:/0CT Scans/5_Aug 20 2019/20082019_05 RD-04-2019/sept2/earcrp"
RD3<-"F:/0CT Scans/5_Aug 20 2019/20082019_08 RD-03-2019/earregion 16b/earcrp"
RD2<-"F:/0CT Scans/Dec 12 crp export/03 RD-02-2019/backofheadall/earcrp"
RD8<-"F:/backof head analyses/feb6crops/RD082019/earregion"
RD9<-"F:/backof head analyses/Feb7crops/RD09/earcrp"
RD10<-"F:/backof head analyses/feb6crops/RD102019/earcrp"
SAL01<-"F:/backof head analyses/feb6crops/SAL01/earregion"
SAL03<-"F:/backof head analyses/feb6crops/SAL03backofhead/earcrp"
SAL04<-"F:/backof head analyses/feb6crops/SAL04/earcrp"
SAL07<-"F:/backof head analyses/feb6crops/SAL07/earcrp"
chicken01<-"F:/0CT Scans/1_Jan 2019/17012019_05 Chicken/chicken back of head 16b/earcrp"
Ch01 <-"F:/0CT Scans/Dec 12 crp export/07 Ch-01-2019/earcrp"
Ch02 <-"F:/0CT Scans/Dec 12 crp export/08 Ch-02-2019"

#make a list of directories to check for files
directs<-(c(RD8,RD9,RD10,SAL01,SAL03,SAL04,SAL07))
directs<-c(chicken01,Ch01,Ch02)
directs<- c(razorbill, flamingo, adeliepenguin, 
            southgeorgiashag,SGpintail,sheathbill,
            bluepetrel, hadedaibis,WCP,olivepigeon, SGdivingpetrel)
directs

#Make objects with list the files of different file types. Recursive indicates checking subfolders
filelist_fcsv<-list.files(directs, pattern = ".fcsv", recursive = TRUE, full.names = TRUE)
filelist_pp<-list.files(directs, pattern = ".pp", recursive = TRUE, full.names = TRUE)
filelist_stl<-list.files(directs, pattern = ".stl", recursive = TRUE, full.names = TRUE)
#filelistply<-list.files("G:/0CT Scans", pattern = ".ply", recursive = TRUE)


#You can subset the list as desired#
library(stringr)
filelist_stl_cols<-str_subset(filelist_stl, "col")
rw<- str_subset(filelist, "RW") 
ca<- str_subset(filelist, "CA") 
ca<- str_subset(filelist, "CA") 


#Loop through the file list to COPY FILES to the desired folder:
for (i in filelist_fcsv){
  file.copy(i, "I:/Feb18repeatability", copy.date = TRUE)
}

for (i in filelist_stl){
  file.copy(i, "I:/Feb18repeatability", copy.date = TRUE)
}

for (i in filelist_pp){
  file.copy(i, "J:/Nov28batch", copy.date = TRUE)
}

#create folders
setwd("I:/Feb18repeatability")
folders<-c("RD08","RD09","RD10","SAL01","SAL03","SAL04","SAL07")
for (i in folders){
  dir.create(i)
}


 

