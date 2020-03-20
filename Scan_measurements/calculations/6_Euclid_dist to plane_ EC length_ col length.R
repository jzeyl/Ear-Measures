#Measures:
#1) height of TM conical projection (orthogonal distance from umbo to TM plane)
#2) orthogonal distance from columella tip to TM plane
#3) extracolumella length (umbo to col tip)
#4) columella length (col tip to FP centroid)
#5) distance from columella tip to TM Centroid
#6) endosseous cochlear duct length (ECD length)

#Formula for distance from point to plane:
#plane = Ax+By+Cz+D = 0
#distance = abs(ax+by+cz+d)/sqrt((a^2)+(b^2)+(c^2))

#1) distance from umbo to plane of best fit
Umbo_distancetoTMplane<-abs((TMa*TMtipsingle[,1])+(TMb*TMtipsingle[,2])+(TMc*TMtipsingle[,3])+TMd)/
  sqrt(((TMa^2)+(TMb^2)+(TMc^2)))
Umbo_distancetoTMplane<-unname(Umbo_distancetoTMplane)

#2) distance from columella tip to plane of best fit
coltip_distancetoTMplane<-abs((TMa*Coltip[,1])+(TMb*Coltip[,2])+(TMc*Coltip[,3])+TMd)/
  sqrt(((TMa^2)+(TMb^2)+(TMc^2)))
coltip_distancetoTMplane<-unname(coltip_distancetoTMplane)

#3) EC length
EClength<-(TMtipsingle-Coltip)^2
totalEClength<-sqrt(EClength[,1]+EClength[,2]+EClength[,3])

#4) collength
FPcentroidsingle<-as.data.frame(cbind(mean(FPcurve[,1]),mean(FPcurve[,2]),mean(FPcurve[,3])))#calculate centroid
collength<-(Coltip-FPcentroidsingle)^2
totalcollength<-sqrt(collength[,1]+collength[,2]+collength[,3])

#5) dist_coltip_TMcentroid
dis_coltip_TMcentroid<-(TMcentroid-Coltip)^2
dis_coltip_TMcentroid<-sqrt(dis_coltip_TMcentroid[,1]+dis_coltip_TMcentroid[,2]+dis_coltip_TMcentroid[,3])
coltoTMcentroid<-rbind(TMcentroid,Coltip)

#6) endosseous cochlear duct ECDlength
FPcentroidsingle<-as.data.frame(cbind(mean(FPcurve[,1]),mean(FPcurve[,2]),mean(FPcurve[,3])))#calculate centroid
ECDtip<-(ECpoints[5,])#note***
ECDlength<-(ECDtip-FPcentroidsingle)^2
totalECDlength<-sqrt(ECDlength[,1]+ECDlength[,2]+ECDlength[,3])
FP_ECD<-rbind(FPcentroidsingle,ECDtip)