# 1) file with computed values  
# 2) file with a summary of all coordinates
# 3) file with all the angles of the TM perimeter
# 4)take a snapshot of the plotted wireframe diagram

#SINGLE VALUE Outputs:

#distance from umbo to TM plane
#extracolumella length
#columella length (uses centroid of footplate)
#tympanic membrane area
#footplate area
#Cochlear aqueduct area
#round window area
#mean angle
#added stdev TM-umbo angle
#addedangle between TM plane and footplate plane
#added ECD length
#added distance from coltip to TMplane

singlevallist<-c("Umbo_distancetoTMplane",
"coltip_distancetoTMplane",
"totalEClength",
"totalcollength",
"totalECDlength",
"meanTMangle",
"sdTMangle",
"angle_FP_TM",
"angle_Col_EC",
"TMtotalarea",
"FPtotalarea",
"CAtotalarea",
"RWtotalarea",
"dis_coltip_TMcentroid")

#if one of the measurements isn't there/can't be measured, replace the value with 'NA'
for (i in singlevallist){
  if(exists(i)== FALSE){
    assign(i,NA)
  }
}

singlevals<-as.data.frame(rbind(Umbo_distancetoTMplane,
coltip_distancetoTMplane,
totalEClength,
totalcollength,
totalECDlength,
meanTMangle,
sdTMangle,
angle_FP_TM,
angle_Col_EC,
TMtotalarea,
FPtotalarea,
CAtotalarea,
RWtotalarea,
dis_coltip_TMcentroid
))
colnames(singlevals)<-ID
singlevals$measures<-paste(ID,rownames(singlevals), sep = "_")
singlevals <- singlevals[c(2,1)]#reorder columns
rownames(singlevals)<-c()#remove row names

#write file with the single value measurements
#write.csv(singlevals,paste(ID,"Singlevals summary.csv", sep = "_"))
write.csv(singlevals,paste(outputpathsingles,ID,"Singlevals summary.csv", sep = "_"))

#COORDINATES OUTPUTS
#add TM centroid to coordinates output
#planecoefficients
rownames(TMcurve)<-paste(ID,"TMcurve",make.names(rownames(TMcurve), unique = TRUE),sep = "_")
rownames(FPcurve)<-paste(ID,"FPcurve",make.names(rownames(FPcurve), unique = TRUE),sep = "_")
rownames(CAcurve)<-paste(ID,"CAcurve",make.names(rownames(CAcurve), unique = TRUE),sep = "_")
rownames(RWcurve)<-paste(ID,"RWcurve",make.names(rownames(RWcurve), unique = TRUE),sep = "_")
rownames(ECpoints)<-paste(ID,"ECpoints",make.names(rownames(ECpoints), unique = TRUE),sep = "_")

#rownames(CAcentroidsingle)<-paste(ID,"CAcentroidsingle",make.names(rownames(CAcentroidsingle), unique = TRUE),sep = "_")
#rownames(RWcentroidsingle)<-paste(ID,"RWcentroidsingle",make.names(rownames(RWcentroidsingle), unique = TRUE),sep = "_")
#rownames(FPcentroidsingle)<-paste(ID,"FPcentroidsingle",make.names(rownames(FPcentroidsingle), unique = TRUE),sep = "_")
#rownames(TMcentroid)<-paste(ID,"TMcentroid",make.names(rownames(TMcentroid), unique = TRUE),sep = "_")

coordlist<-c("TMcurve","FPcurve","CAcurve", "RWcurve", "ECpoints")

for (i in coordlist){
  if(exists(i)== FALSE){
    assign(i,NA)
  }
}

#bind all coordinates
rawcoords<-rbind(TMcurve,FPcurve,CAcurve, RWcurve, ECpoints)

landmarkslist<-c("TMtipsingle",
                 "TMcentroid",
             "Coltip",
             "FPcentroidsingle",
             "RWcentroidsingle",
             "CAcentroidsingle",
             "ECDtip")

for (i in landmarkslist){
  if(exists(i)== FALSE){
    assign(i,NA)
  }
}

landmarks<-rbind(TMtipsingle,
                 TMcentroid,
                 Coltip,
                 FPcentroidsingle,
                 RWcentroidsingle,
                 CAcentroidsingle,
                 ECDtip)

landmarknames<-c("TMtipsingle",
              "TMcentroid",
              "Coltip",
              "FPcentroidsingle",
              "RWcentroidsingle",
              "CAcentroidsingle",
              "ECDtip")
LMnameswithID<-paste(ID,landmarknames, sep = "_")
row.names(landmarks)<-LMnameswithID

allcoords<-rbind(landmarks,rawcoords)
#write coordinates file
#write.csv(allcoords, paste(ID,"Coordinates summary.csv", sep = ""))
write.csv(allcoords, paste(outputpathcoords,ID,"Coordinates summary.csv", sep = ""))


#ANGLES OUTPUT
#write TM angles file
rownames(angles)<-paste(ID,"angles",make.names(rownames(angles), unique = TRUE),sep = "_")
write.csv(angles, paste(outputpathangles,ID,"Angles summary.csv", sep = ""))

#write.csv(angles, paste(ID,"Angles summary.csv", sep = "_"))



writeSTL(paste(STLpath,ID,".stl"))

#snapshot output
planes3d(TMa, TMb, TMc, TMd, alpha = 0.5, color = "blue")#plot plane of tympanic membrane
planes3d(FPa, FPb, FPc, FPd, alpha = 0.5, color = "blue")#plot plane of footplate
rgl.snapshot(paste(snapshotpath,ID,".png",sep = ""),  top = TRUE )



#individual FCSV and stl wireframe output
dir.create(paste0(outputfcsv,"/",ID))
#RW
write.fcsv(fullRW,paste0(outputfcsv,ID, "/_RW.fcsv"))
rgl.clear()
lines3d(fullRW[,1],fullRW[,2],fullRW[,3], col = "green", lwd = 3)#plot round window
writeSTL(paste0(outputfcsv,ID, "/",ID,"_RW.stl"))

#CA
write.fcsv(fullCA,paste0(outputfcsv,ID, "/_CA.fcsv"))
rgl.clear()
lines3d(fullCA[,1],fullCA[,2],fullCA[,3], col = "green", lwd = 3)#plot round window
writeSTL(paste0(outputfcsv,ID, "/",ID,"_CA.stl"))

#FP
write.fcsv(fullFP,paste0(outputfcsv,ID, "/_FP.fcsv"))
rgl.clear()
lines3d(fullFP[,1],fullFP[,2],fullFP[,3], col = "green", lwd = 3)#plot round window
writeSTL(paste0(outputfcsv,ID, "/",ID,"_FP.stl"))

#TM
TMFULL<-rbind(fullperimeter,EStapTipeveryother)
write.fcsv(TMFULL,paste0(outputfcsv,ID, "/_TM.fcsv"))
rgl.clear()
lines3d(fullperimeter[,1],fullperimeter[,2],fullperimeter[,3], color = "red", lwd = 3)#plot curve perimeter
lines3d(EStapTipeveryother[,1],EStapTipeveryother[,2],EStapTipeveryother[,3], color = "red", lwd = 3)#plot TM connections to umbo
writeSTL(paste0(outputfcsv,ID, "/",ID,"_TM.stl"))

#TMplane
rgl.clear()
lines3d(fullperimeter[,1],fullperimeter[,2],fullperimeter[,3], color = "red", lwd = 3)#plot curve perimeter
lines3d(EStapTipeveryother[,1],EStapTipeveryother[,2],EStapTipeveryother[,3], color = "red", lwd = 3)#plot TM connections to umbo
lines3d(TMpoint[,1],TMpoint[,2],TMpoint[,3], col = "green", lwd = 3)
planes3d(TMa, TMb, TMc, TMd, alpha = 0.5, color = "blue")#plot plane of tympanic membrane
writeSTL(paste0(outputfcsv,ID, "/",ID,"_TMplane.stl"))

#coldisttoTMplane
write.fcsv(colTMpoint,paste0(outputfcsv,ID, "/",ID,"_distoTMplane.fcsv"))
rgl.clear()
lines3d(colTMpoint[,1],colTMpoint[,2],colTMpoint[,3], col = "green", lwd = 3)
writeSTL(paste0(outputfcsv,ID, "/",ID,"_distoTMplane.stl"))

#UmbotoTMplane
write.fcsv(TMpoint,paste0(outputfcsv,ID, "/",ID,"_umbotoTMplane.fcsv"))
rgl.clear()
lines3d(TMpoint[,1],TMpoint[,2],TMpoint[,3], col = "green", lwd = 3)
writeSTL(paste0(outputfcsv,ID, "/",ID,"_umbotoTMplane.stl"))

#Disttocentroid
write.fcsv(coltoTMcentroid,paste0(outputfcsv,ID, "/",ID,"_coltoTMcentroid.fcsv"))
rgl.clear()
lines3d(coltoTMcentroid[,1],coltoTMcentroid[,2],coltoTMcentroid[,3], col = "green", lwd = 3)
writeSTL(paste0(outputfcsv,ID, "/",ID,"_coltoTMcentroid.stl"))

#ECD length
write.fcsv(TMpoint,paste0(outputfcsv,ID, "/",ID,"_ECDlength.fcsv"))
rgl.clear()
lines3d(FP_ECD[,1],FP_ECD[,2],FP_ECD[,3], col = "purple", lwd = 3)#plot endosseous cochlear duct
writeSTL(paste0(outputfcsv,ID, "/",ID,"_ECDlength.stl"))




