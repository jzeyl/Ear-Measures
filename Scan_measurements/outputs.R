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

#snapshot output
rgl.snapshot(paste(snapshotpath,ID,".png",sep = ""),  top = TRUE )

