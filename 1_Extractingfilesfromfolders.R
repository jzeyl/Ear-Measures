#step 1 - make directories and list of folders to create, based on the same object names

#create folder and add files to these
inputdirect<-"E:/Input/Sept 25_2020"
dir.create(inputdirect)

##############################create separate folders for each specimen
for (i in seq_along(folders)){
  dir.create(paste0(inputdirect,"/",folders[i]))
}

#FCSV - put lists of files for each species into a master list of lists
fcsvmasterlist<-list()
for (i in seq_along(directs)){
  fcsvmasterlist[[i]]<-list.files(directs[i], pattern = ".fcsv", recursive = FALSE, full.names = TRUE)
}


#FCSV - place the files directly in the folders assigned to them
for (i in seq_along(fcsvmasterlist)){
  for (j in seq_along(1:10)){
    file.copy(fcsvmasterlist[[i]][j], paste0(inputdirect,"/",folders[i]), copy.date = TRUE)
  }
}

#STL - put lists of files for each species into a master list of lists
stlmasterlist<-list()
for (i in seq_along(directs)){
  stlmasterlist[[i]]<-list.files(directs[i], pattern = ".stl", recursive = FALSE, full.names = TRUE)
}

#STL - place the files directly in the folders assigned to them
for (i in seq_along(stlmasterlist)){
  for (j in seq_along(1:10)){
    file.copy(stlmasterlist[[i]][j], paste0(inputdirect,"/",folders[i]), copy.date = TRUE)
  }
}



writeClipboard(ls())
directs<-c(Ngannet,TD01)
folders<-c("Ngannet","TD01")

directs<-Ngannet
folders<-"Ngannet"


directs<-LD01
folders<-"LD01"

KP01MA<- "D:/August scans backup/Aug 26/KP01MA/earcrp"
MP01<- "D:/August scans backup/Aug 26/MP01/earcrp"
WA01<- "D:/August scans backup/Aug 26/WA01/earcrp"
BBA01<-"D:/August scans backup/Aug 26/BBA01/earcrp"
ASEO02<-"D:/August scans backup/Aug 26/ASEO02/earcrp"
GRSH01<-"D:/August scans backup/Aug 27/GRSH01/earcrp"
SWG01<-"D:/August scans backup/Aug 26/SWG01/earcrp"
Ngannet<-"F:/0morphosource witmer/northerngannet/OUVC_10995_M42184-76028/crp aug 5"
TD01<-"F:/0CT Scans/3_Jul19 2019/19072019_06 TD01 rescan/earcrp Aug 5 2020"
LD01<-"D:/0backof head analyses/6_Feb12crops/LD-01-2019/crpcorrectAug5"


writeClipboard(ls())
directs<- c(ASEO02,
            BBA01,
            GRSH01,
            KP01MA,
            MP01,
            SWG01,
            WA01)
folders<- c("ASEO02", "BBA01" , "GRSH01", "KP01MA", "MP01" ,  "SWG01" , "WA01" )


list.dirs("D:/August scans backup/Aug 24", full.names = F, recursive = F)

YNA <-  "D:/August scans backup/Aug 24/1 YNA/earcrp/"
WBC  <-  "D:/August scans backup/Aug 24/2 WBC/earcrp/"
FE<-    "D:/August scans backup/Aug 24/3 FE/earcrp"
SA01 <-"D:/August scans backup/Aug 24/SA-01-2019/earcrp/"
VE01<-"D:/August scans backup/Aug 24/VE-01-2019/earcrp/"

directs<-c(FE     ,   SA01   ,     VE01  ,      WBC  ,       YNA )
folders<-c("FE" , "SA01"  ,      "VE01"    ,    "WBC"    ,     "YNA" )       


#directories Jun 24
D001<-"E:/0backof head analyses/3_Dec 12 crp export/04D001 2019/crp"
directs<-D001
folders<-"D001"

ADP01<-'F:/0CT Scans/4_Cambridge Jul 2019/ADP-01-2019 [2019-07-23 13.19.23]/ADP-01-2019_01/crpears/adpcrop'
GPeng01<-'F:/0CT Scans/4_Cambridge Jul 2019/GP-01-2019 [2019-07-23 12.22.30]/GP-01-2019_01/GP col aug12'
Puffin01<-'F:/0CT Scans/4_Cambridge Jul 2019/Puffin [2019-07-22 10.03.02]/Puffin_01/16bit'
Eider01<-'F:/0CT Scans/4_Cambridge Jul 2019/Eider [2019-07-22 13.01.21]/Eider_01/correct may 21'
AP253<-"F:/0CT Scans/1_Jan 2019/17012019_07 AP253/AP253 back of head/earcrp"
CP01<-"F:/0CT Scans/4_Cambridge Jul 2019/CP-01-2019 [2019-07-23 10.21.12]/CP-01-2019_01/earregion"

folders<- c("ADP01"  ,  "AP253",    "CP01"  ,   "Eider01",  "GPeng01" , "Puffin01")
directs<- c(ADP01,    AP253,    CP01,     Eider01,  GPeng01,  Puffin01)


#directories jun 17
Acrake01_2020<- "D:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_06 Acrake-01-2020/Stack/earcrp"
BCouc01_2020<- "D:/0backof head analyses/6_Feb12crops/Bcouc-01-2020/ear_Crp"
Othrush01_2019<- "D:/0backof head analyses/6_Feb12crops/Othrush-01-2019/earcrp"
#MDuck_01_2020<- "D:/0_Open data/TIFFS bird skulls/aquatic/shallow dabblers/Anas platyrhynchos digi/Anas platyrhynchos/8bit/crp"
KTC_01_2020<- "D:/0backof head analyses/6_Feb12crops/KTC-01-2020/earcrp"
Stch_01_2019<- "D:/0backof head analyses/6_Feb12crops/STch-01-2019/earcrp"
RCL_01_2019<- "D:/0backof head analyses/2_Oct 30 earregion expt/1_RCL-01-2019/earcrp"
Apip_02_2019<- "D:/0backof head analyses/2_Oct 30 earregion expt/2_Apip-02-2019/earcrp"
CLC_01_2019<- "D:/0backof head analyses/2_Oct 30 earregion expt/3_CLC-01-2019/earcrp"

folders<-c("Acrake01_2020",  "Apip_02_2019" ,  "BCouc01_2020" ,  "CLC_01_2019" ,   "KTC_01_2020"   ,
   "Othrush01_2019", "RCL_01_2019",    "Stch_01_2019"  )
directs<-c(Acrake01_2020,  Apip_02_2019 ,  BCouc01_2020 ,  CLC_01_2019 ,   KTC_01_2020   ,
            Othrush01_2019, RCL_01_2019,    Stch_01_2019  )


BFAlb_01_2020<- "F:/0morphosource witmer/albatross/OUVC_10905_M44786-81307/WitmerLab_Black-footed_albatross_OUVC_10905_diceCT_TIFF/crp"
AtordaWitmer_01_2019<- "F:/0morphosource witmer/alca torda/atorda/crpear"
CternWitmer_01_2020<- "F:/0morphosource witmer/caspiantern/OUVC_11504_M42995-77562/WitmerLab_Caspian-tern_OUVC11504_prescan_DICOM/crp"
NgannetWitmer01_2020<- "F:/0morphosource witmer/northerngannet/OUVC_10995_M42184-76028/earregion"
CC209_2019<- "F:/0CT Scans/1_Jan 2019/17012019_01 CC209/oct19 export 16b/earcrp"

folders<-c("AtordaWitmer_01_2019", "BFAlb_01_2020" ,       "CC209_2019"    ,      
 "CternWitmer_01_2020",  "NgannetWitmer01_2020")
directs<-c(AtordaWitmer_01_2019, BFAlb_01_2020 ,       CC209_2019    ,      
           CternWitmer_01_2020,  NgannetWitmer01_2020)

#directories jun10
BO_02<-"F:/0CT Scans/5_Aug 20 2019/20082019_03 BO-02-2019/barn owl ear export/earcpfull ECDmar13"
RC<-"F:/0CT Scans/3_Jul19 2019/19072019_02 RC001/reed cormorant16B ear"
RZB<-"F:/0CT Scans/4_Cambridge Jul 2019/Razorbill [2019-07-22 12.22.36]/Razorbill_01/earcrp/Nov 26 16bit"
Guill<-"F:/0CT Scans/4_Cambridge Jul 2019/Guillemot [2019-07-22 12.01.41]/Guillemot_01/cropp with both ears"
Ostrich01<-"F:/0CT Scans/2_Apr26 2019/26042019_07 Ostrich 1/ostrich back of head 16b/ost"

directs<-c(BO_02  ,     Guill   , Ostrich01  , RC  ,        RZB )  
folders<-c("BO_02"  ,     "Guill"   , "Ostrich01"  , "RC"  ,        "RZB" )       








#directories Jun 5 2020
DCSB<-"F:/0CT Scans/2_Apr26 2019/26042019_04 Double-Collared Sunbird1/16bexport oct17/earcrp"
OBSB<-"F:/0CT Scans/2_Apr26 2019/26042019_05 Orange breasted Sunbird 1/OBSBback of head/earcrp"
TO002<-"F:/0CT Scans/3_Jul19 2019/19072019_01 TO_02/oct17 back of head 16b/earcrp"
SPP<-"F:/0CT Scans/3_Jul19 2019/19072019_07 SPP-01/export oct 17 ear/earcrp"
GHB<-"F:/0CT Scans/2_Apr26 2019/26042019_02 Ground Hornbill 1/Ear export oct 17/earcrp"
BSH<-"F:/0CT Scans/5_Aug 20 2019/20082019_06 BSH-01-2019/earcrp Mar3 2020"
RED<-"F:/0CT Scans/5_Aug 20 2019/20082019_07 RED-01-2019/earregionsept2/earcrp"
ARP<-"F:/0CT Scans/6_Sept 2 2019/02092019_02 ARP-01-2019/earcrp CAF/earcrp"
PFalcon<-"F:/0CT Scans/5_Aug 20 2019/20082019_02 PF-01-2019/earregion sep2 CAF/earcropped"

directs<-c( ARP     ,    BSH  ,       DCSB   ,     GHB   ,     OBSB    ,   
            PFalcon  ,   RED   ,      SPP ,        TO002) 
folders<-c( "ARP"     ,    "BSH"  ,       "DCSB"    ,    "GHB"  ,  "OBSB"  ,     
 "PFalcon"    , "RED"  ,       "SPP"  ,       "TO002") 


Pcrow<-"D:/0backof head analyses/2_Oct 30 earregion expt/5_Pcrow-1-2019/crowbetter/earregion"
LFalc<-"D:/0backof head analyses/3_Dec 12 crp export/06 LF-01-2019/earcrp"
ST007<-"D:/0backof head analyses/3_Dec 12 crp export/05 st007/earcrp"
TO003<-"D:/0backof head analyses/5_Feb7crops/TO003/earcrp"
LBird<-"D:/0backof head analyses/6_Feb12crops/LB/earcrp"
RNeck<-"D:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/24032020_02 RN-02-2019/Stack/earcrp"
Cparr<-"D:/0backof head analyses/5_Feb7crops/Cparr-02-2019/earcrp"

directs<- c(Cparr, LBird, LFalc, Pcrow, RNeck, ST007, TO003)
folders<- c("Cparr", "LBird", "LFalc", "Pcrow", "RNeck", "ST007", "TO003")


#directories Jun 2 2020
Clapwing<-"D:/0backof head analyses/1_Oct 17export/6_CL/earcropped"
BSK<-"D:/0backof head analyses/1_Oct 17export/7_BSK/earregionexpt/earcropped"
AGP01<-"D:/0backof head analyses/1_Oct 17export/9_african grey parrot/earregion/earcrop"
CRChat<-"D:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_04 CRChat-01-2020/Stack/earcrp"
BCLory<-"D:/0backof head analyses/6_Feb12crops/BCL-01-2019/earcrp"
CFranc<-"D:/0backof head analyses/5_Feb7crops/CFranc-01-2019/earcrp"
CFisc<-"D:/0backof head analyses/6_Feb12crops/Cfisc-01-2019/earcrp"
FTDrongo<-"D:/0backof head analyses/6_Feb12crops/FTdrong-01-2019/earcrp"

directs<-c(AGP01,    BCLory,   BSK,      CFisc,    CFranc ,  Clapwing, CRChat,   FTDrongo)
folders<-c("AGP01",    "BCLory",   "BSK" ,     "CFisc" ,   "CFranc" ,  "Clapwing", "CRChat",   "FTDrongo")

CMH<-"F:/0CT Scans/6_Sept 2 2019/02092019_04 CMH-01-2019/cmhear/crp"
WSP<-"F:/0CT Scans/4_Cambridge Jul 2019/WSP-01-.... BAS [2019-07-23 16.15.17]/WSP-01-.... BAS_01/colaug12"
SPS<-"F:/0CT Scans/4_Cambridge Jul 2019/SPS-02-BAS [2019-07-23 11.42.04]/SPS-02-BAS_01/earcrp"
AP<-"F:/0CT Scans/4_Cambridge Jul 2019/AP-01-2011 [2019-07-23 09.42.20]/16Bearcrp Nov 27"
LBBG<-"F:/0CT Scans/4_Cambridge Jul 2019/Lesser black backed gull [2019-07-23 15.37.12]/Lesser black backed gull_01/earregion crped"
Brownskua<-"F:/0CT Scans/3_Jul19 2019/19072019_08 BS-01 SANCCOB/BS01 back of head oct 17"
Kittiwake<-"F:/0CT Scans/4_Cambridge Jul 2019/Kittiwake [2019-07-22 10.40.37]/Kittiwake_01/colaug13"

directs<-c(AP ,       Brownskua ,CMH ,      Kittiwake, LBBG ,     SPS ,      WSP )
folders<-c("AP" ,       "Brownskua" ,"CMH" ,      "Kittiwake", "LBBG" ,     "SPS" ,      "WSP" ) 
  
#directs may 28 2020

Greatshearwater<-"D:/0backof head analyses/3_Dec 12 crp export/09 great shearwater/earcrp"
Bankcorm<-"D:/0backof head analyses/2_Oct 30 earregion expt/6_BC-01-2019/earcrp"
Canary<-"D:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_02 Can-01-20/Stack/earcrp"
WCPion<-"D:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_08 WCPion-01-2020/Stack/earcrp"
Goldf01<-"D:/0backof head analyses/1_Oct 17export/1_GoldF01/earcropped"
CSB<-"D:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_01 CSB-01-2019/Stack/earcrp"
SHen<-"D:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_09 SHen-01-2020/Stack/earcrp"
Hoopoe<-"D:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_05 HP-01-2020/Stack/earcrp"
GH01<-"D:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/24032020_04 GH-01-2020/Stack/earcrp"
Ctiel<- "D:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_07 Ctiel-01-2020/Stack/earcrp"
Eparr<-"D:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/24032020_03 Eparr-01-2020/Stack/earcrp"
BSW<-"D:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/23032020_03 BSW-01-2020/Stack/earcrp"
Hcrow<-"D:/0backof head analyses/7_Feb23 crops/23022020 CT Scans/24032020_01 Hcrow/Stack/earcrp"

directs<-c(Bankcorm,  BSW  ,          Canary    ,      CSB         ,    Ctiel ,          Eparr  ,        
GH01    ,       Goldf01    ,     Greatshearwater, Hcrow    ,       Hoopoe    ,      SHen  ,         
WCPion)
#folder names must be in exact same orderas directs!!!
folders<-c("Bankcorm",  "BSW"  ,          "Canary"    ,      "CSB"         ,    "Ctiel" ,          "Eparr"  ,        
           "GH01"    ,       "Goldf01"    ,     "Greatshearwater", "Hcrow"    ,       "Hoopoe"    ,      "SHen"  ,         
           "WCPion")

#create folders
cat(ls(),sep = "','")



  
<<<<<<< HEAD
CDP01<-"F:/0CT Scans/4_Cambridge Jul 2019/CDP-01-2019 [2019-07-22 17.08.11]/CDP-01-2019_01/test cropped from raw"
Gimmer01<-"F:/0morphosource witmer/gavia/measuresmay21"
Eider01<-"F:/0CT Scans/4_Cambridge Jul 2019/Eider [2019-07-22 13.01.21]/Eider_01/correct may 21"

CRC01<-"F:/0CT Scans/3_Jul19 2019/19072019_03 CRC003/ear extracted oct 17/earcrp"
SSW01<-"F:/0CT Scans/1_Jan 2019/17012019_03 Sooty shearwater/sootybac of head 17b/earcrp"
K151<-"F:/0CT Scans/1_Jan 2019/18012018_09 K151/k151 oct17 16bbackofhead/earcrp"

SGdivingpetrel<-"F:/0CT Scans/4_Cambridge Jul 2019/SGDP-01-2014 [2019-07-23 10.01.00]/SGDP-01-2014_01/earcrp"
flamingo<-"F:/0CT Scans/1_Jan 2019/17012019_02 Flamingo/flamingo back of head oct17/earcrp"
WCP3<-"F:/0CT Scans/0_JZ microCT scans/petral2 and 3 repeat/12102018_03 Petrel3 no filter/backofhead export oct 17"

directs<- c(CDP01,Gimmer01,Eider01,CRC01,SSW01,K151,SGdivingpetrel,flamingo,WCP3)

Bankcorm<-
Greatshearwater

pastee(direct,)
folders<-c("CDP01","Gimmer01","Eider01","CRC01","SSW01","K151","SGdivingpetrel","flamingo","WCP3")


#OLD, LESS PRECISE METHOD THAT DUMPS ALL INTO ONE LIST:
#Make objects with list the files of different file types. Recursive indicates checking subfolders
#filelist_fcsv<-list.files(directs, pattern = ".fcsv", recursive = FALSE, full.names = TRUE)
#filelist_pp<-list.files(directs, pattern = ".pp", recursive = FALSE, full.names = TRUE)
#filelist_stl<-list.files(directs, pattern = ".stl", recursive = FALSE, full.names = TRUE)

stlmasterlist2nd<-stlmasterlist[c(9:13)]
folders2nd<-folders[c(9:13)]
#STL - place the files directly in the folders assigned to them
for (i in seq_along(stlmasterlist2nd)){
  for (j in seq_along(folders2nd)){
    file.copy(stlmasterlist2nd[[i]][j], paste0(inputdirect,"/",folders2nd[i]), copy.date = TRUE)
  }
}


dir.create("D:/Input/may25_2019")
setwd("D:/Input/may25_2019")
##############################create folders
for (i in folders){
  dir.create(i)
}
#Loop through the file list to COPY FILES to the desired folder:
for (i in filelist_fcsv){
  file.copy(i, "D:/Input/may25_2019", copy.date = TRUE)
}

for (i in filelist_stl){
  file.copy(i, "D:/Input/may25_2019", copy.date = TRUE)
}



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

#re-tests for repeatability
RD01r1<-"I:/0CT Scans/2_Apr26 2019/26042019_06 Rock Dove 1/rep1"
RD02r1<-"G:/backof head analyses/Dec 12 crp export/03 RD-02-2019/backofheadall/earcrp"
RD03r1<-"I:/0CT Scans/5_Aug 20 2019/20082019_08 RD-03-2019/earregion 16b/earcrp"
RD04r1<-"I:/0CT Scans/5_Aug 20 2019/20082019_05 RD-04-2019/sept2/earcrp"
RD08r1<-"G:/backof head analyses/feb6crops/RD082019/rep1"
RD09r1<-"G:/backof head analyses/Feb7crops/RD09/rep1"
RD10r1<-"G:/backof head analyses/feb6crops/RD102019/rep1"
  
#Sal replicates
SAL01r1<-"G:/backof head analyses/feb6crops/SAL01/rep1"
SAL03r1<-"G:/backof head analyses/feb6crops/SAL03backofhead/rep1"
SAL04r1<-"G:/backof head analyses/feb6crops/SAL04/rep1"
SAL07r1<-"G:/backof head analyses/feb6crops/SAL07/rep1"
SAL13<-"G:/backof head analyses/Dec 12 crp export/02 SAL13-2019/earcrp"
SAL13r1<-"G:/backof head analyses/Dec 12 crp export/02 SAL13-2019/rep1"
SAL05<-"G:/backof head analyses/Feb7crops/SAL05/earcrp"
SAL05r1<-"G:/backof head analyses/Feb7crops/SAL05/rep1"

razorbill<-"G:/0CT Scans/4_Cambridge Jul 2019/Razorbill [2019-07-22 12.22.36]/Razorbill_01/earcrp/Nov 26 16bit"

#directories Mar 3, 2020
ZF01<-"E:/0backof head analyses/Dec 12 crp export/01 ZF-01-2019/crp"
D001<-"E:/0backof head analyses/Dec 12 crp export/04D001 2019/crp"
RZB01<-"G:/0CT Scans/4_Cambridge Jul 2019/Razorbill [2019-07-22 12.22.36]/Razorbill_01/earcrp/Nov 26 16bit"
GF01<-"G:/0CT Scans/6_Sept 2 2019/02092019_01 GF-02-2019/earregionCAF"
SGDP01<-"G:/0CT Scans/4_Cambridge Jul 2019/SGDP-01-2014 [2019-07-23 10.01.00]/SGDP-01-2014_01/earcrp"
STK01<-"G:/0CT Scans/5_Aug 20 2019/20082019_01 STK-01-2019/stk16b"
RWS01<-"G:/0CT Scans/6_Sept 2 2019/02092019_03 RWS-01-2019/rwsexport"
Ch01 <-"E:/0backof head analyses/Dec 12 crp export/07 Ch-01-2019/earcrp"
Ch02 <-"E:/0backof head analyses/Dec 12 crp export/08 Ch-02-2019"
GBBG01<-"G:/0CT Scans/4_Cambridge Jul 2019/Great black backed gull [2019-07-23 16.36.41]/Great black backed gull_01/col aug12"

directs<-c(ZF01,D001,RZB01,GF01,SGDP01,STK01,RWS01,Ch01,Ch02,GBBG01)

#directories mar 4, 2020
SGPT01<-"G:/0CT Scans/4_Cambridge Jul 2019/SGPT-01-1994 [2019-07-22 15.41.43]/SGPT-01-1994_01/colaug13"
SGS01<-"G:/0CT Scans/4_Cambridge Jul 2019/SGS-01-2017 [2019-07-23 12.42.20]/SGS-01-2017_01/earregion"
Puffin01<-"G:/0CT Scans/4_Cambridge Jul 2019/Puffin [2019-07-22 10.03.02]/Puffin_01/16bit"#wd
HI01<- "E:/0backof head analyses/Oct 30 earregion expt/7_HI-02-2019"
OP01<-"E:/0backof head analyses/Oct 17export/5_OP"
OWP01<-"G:/0CT Scans/2_Apr26 2019/26042019_08 Olive Woodpecker/oWP back of head crop oc 17/earcrp"
NGP01<-"G:/0CT Scans/2_Apr26 2019/26042019_01 Giant Petrel 1/giant petrel01/earcrp"
SB01<-"G:/0CT Scans/0_JZ microCT scans/sheathbill/sheathbill test march/sheahbill data/05032018_02 Sheathbill dry/stack/earcrp"
EG01<-"G:/0CT Scans/3_Jul19 2019/19072019_04 EG001/EG back of head oct 17"

directs<-c(SGPT01,SGS01,Puffin01,HI01,OP01,OWP01,NGP01,SB01,EG01)
#Mar 16, 2020


H414_2019<-"G:/0CT Scans/1_Jan 2019/17012019_04 H414/backofhead export oc 17/earcrp"
BO_02_2019<-"G:/0CT Scans/5_Aug 20 2019/20082019_03 BO-02-2019/barn owl ear export/earcpfull ECDmar13"
Ostrich01_2019<-"G:/0CT Scans/2_Apr26 2019/26042019_07 Ostrich 1/ostrich back of head 16b/ost"
ADP01_2019<-"G:/0CT Scans/4_Cambridge Jul 2019/ADP-01-2019 [2019-07-23 13.19.23]/ADP-01-2019_01/crpears"
BP_01_2019<-"G:/0CT Scans/4_Cambridge Jul 2019/BP-01-2011 [2019-07-23 14.15.05]/BP-01-2011_01/colaug12"
AP253_2019<-"G:/0CT Scans/1_Jan 2019/17012019_07 AP253/AP253 back of head/earcrp"

directs<-c(H414_2019,         BO_02_2019,       Ostrich01_2019,       ADP01_2019,
             BP_01_2019,           AP253_2019)

directs<-c(Ch01,Ch02)

#May 1 2020
SAL01r2_2019<-"E:/0backof head analyses/feb6crops/SAL01/rep2"
SAL03r2_2019<-"E:/0backof head analyses/feb6crops/SAL03backofhead/rep2"
SAL04r2_2019<-"E:/0backof head analyses/feb6crops/SAL04/rep2"
SAL07r2_2019<-"E:/0backof head analyses/feb6crops/SAL07/rep2"
SAL05r2_2019<-"E:/0backof head analyses/Feb7crops/SAL05/rep2"
SAL13r2_2019<-"E:/0backof head analyses/Dec 12 crp export/02 SAL13-2019/rep2"
directs<-(c(SAL01r2_2019,
            SAL03r2_2019,
            SAL04r2_2019,
            SAL07r2_2019,
            SAL05r2_2019))
directs<-SAL13r2_2019

D:\0backof head analyses\Dec 12 crp export\03 RD-02-2019\backofheadall\rep 2
#may 3 2020
RD02r2_2019<-"D:/0backof head analyses/Dec 12 crp export/03 RD-02-2019/backofheadall/rep 2"
RD08r2_2019<-"D:/0backof head analyses/feb6crops/RD082019/rep2"
RD10r2_2019<-"D:/0backof head analyses/feb6crops/RD102019/rep2"
RD09r2_2019<-"D:/0backof head analyses/Feb7crops/RD09/rep2"
directs<-c(RD02r2_2019,
           RD08r2_2019,
           RD10r2_2019,
           RD09r2_2019)
directs<-RD08r2_2019

RD01r2_2019<-"F:/0CT Scans/2_Apr26 2019/26042019_06 Rock Dove 1/rep2"
RD03r2_2019<-"F:/0CT Scans/5_Aug 20 2019/20082019_08 RD-03-2019/earregion 16b/rep2"
RD04r2_2019<-"F:/0CT Scans/5_Aug 20 2019/20082019_05 RD-04-2019/sept2/rep2"
directs<-c(RD01r2_2019,
           RD03r2_2019,
           RD04r2_2019)
folders<-c("RD01r2_2019",
           "RD03r2_2019",
           "RD04r2_2019")

#make a list of directories to check for files
directs<-(c(SAL01r1,SAL03r1,SAL04r1,SAL05,SAL05r1,SAL07r1,SAL13,SAL13r1))
          
directs<-(c(RD8,RD9,RD10,SAL01,SAL03,SAL04,SAL07))
directs<-(c(RD01r1,RD02r1,RD03r1,RD04r1,RD08r1,RD09r1,RD10r1))
directs<-c(chicken01,Ch01,Ch02)
directs<- c(razorbill, flamingo, adeliepenguin, 
            southgeorgiashag,SGpintail,sheathbill,
            bluepetrel, hadedaibis,WCP,olivepigeon, SGdivingpetrel)
directs

#Make objects with list the files of different file types. Recursive indicates checking subfolders
filelist_fcsv<-list.files(directs, pattern = ".fcsv", recursive = FALSE, full.names = TRUE)
filelist_pp<-list.files(directs, pattern = ".pp", recursive = FALSE, full.names = TRUE)
filelist_stl<-list.files(directs, pattern = ".stl", recursive = FALSE, full.names = TRUE)
#filelist_vtk<-list.files(directs, pattern = ".vtk", recursive = FALSE, full.names = TRUE)

#filelistply<-list.files("G:/0CT Scans", pattern = ".ply", recursive = TRUE)


#You can subset the list as desired#
library(stringr)
filelist_stl_cols<-str_subset(filelist_stl, "col")
rw<- str_subset(filelist, "RW") 
ca<- str_subset(filelist, "CA") 
ca<- str_subset(filelist, "CA") 

dir.create("D:/Input/may25_2019")
setwd("D:/Input/may25_2019")
##############################create folders
for (i in folders){
  dir.create(i)
}

#Loop through the file list to COPY FILES to the desired folder:
for (i in filelist_fcsv){
  file.copy(i, "E:/Input/may3rd", copy.date = TRUE)
}

for (i in filelist_stl){
  file.copy(i, "E:/Input/may3rd", copy.date = TRUE)
}

for (i in filelist_pp){
  file.copy(i, "E:/Input/may3rd", copy.date = TRUE)
}

#create folders
setwd("E:/Input/may3rd")

folders<-c("RD02r2_2019",
           "RD08r2_2019",
           "RD10r2_2019",
           "RD09r2_2019")
#folders<-c("RD01r1","RD02r1","RD03r1","RD04r1","RD08r1","RD09r1","RD10r1")
folders<-c("SAL01r2_2019",
"SAL03r2_2019",
"SAL04r2_2019",
"SAL07r2_2019",
"SAL05r2_2019")
folders<-"SAL13r2_2019"

folders<-c("ZF01","D001","RZB01","GF01","SGDP01","STK01","RWS01","Ch01","Ch02","GBBG01")
  
folders<-c("SGPT-01-2019","SGS-01-2019","Puffin01-2019","HI-01-2019","OP-01-2019","OWP-01-2019","NGP-01-2019","SB-01-2019","EG-01-2019")

folders<-c("H414_2019",         "BO_02_2019",       "Ostrich01_2019",       "ADP01_2019",
  "BP_01_2019",           "AP253_2019")

##############################create folders
for (i in folders){
  dir.create(i)
}
getwd()


#Nov 13 batch
length(list.files("F:/0measure RW,CA/Coordinate input/Nov 13 batch/Atpet-01-2019"))
length(list.files("F:/0measure RW,CA/Coordinate input/Nov 13 batch/Bcrane-01-2019"))
length(list.files("F:/0measure RW,CA/Coordinate input/Nov 13 batch/BG-01-2019"))
length(list.files("F:/0measure RW,CA/Coordinate input/Nov 13 batch/CP-01-2019"))
length(list.files("F:/0measure RW,CA/Coordinate input/Nov 13 batch/EG-01-2019"))
length(list.files("F:/0measure RW,CA/Coordinate input/Nov 13 batch/GP-01-2019"))
length(list.files("F:/0measure RW,CA/Coordinate input/Nov 13 batch/OY002 SANCCOB-2019"))
length(list.files("F:/0measure RW,CA/Coordinate input/Nov 13 batch/RC-01-2019"))
length(list.files("F:/0measure RW,CA/Coordinate input/Nov 13 batch/RK-01-2019"))
length(list.files("F:/0measure RW,CA/Coordinate input/Nov 13 batch/RTTB-01-2019"))
length(list.files("F:/0measure RW,CA/Coordinate input/Nov 13 batch/SP-01-2019"))

#Oct 24-25 batch
length(list.files("F:/0measure RW,CA/Coordinate input/Oct24_25batch/G045"))
length(list.files("F:/0measure RW,CA/Coordinate input/Oct24_25batch/Guil01"))
length(list.files("F:/0measure RW,CA/Coordinate input/Oct24_25batch/MB-01-2019"))
length(list.files("F:/0measure RW,CA/Coordinate input/Oct24_25batch/PC-01-2019"))
length(list.files("F:/0measure RW,CA/Coordinate input/Oct24_25batch/PS-01-2019"))

#batch sept 17
dirstoadd<-c("AP253-2019","BO-01-2019","BSH-01-2019","CC209-01-2019","CDP-01-2019","chicken01-2019",
  "CMH-01-2019","ED-01-2019","Gimmer-01-2019","GBBG-01-2019","Ostrich-01-2019","Puffin-01-2019","STK-01-2019")

for (i in dirstoadd){
  dir.create(paste("F:/0measure RW,CA/Coordinate input/Sept 17/",i))
}
 

=======

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


 

>>>>>>> 2bc5e0440142f1297d5369e528cf231698d09414
