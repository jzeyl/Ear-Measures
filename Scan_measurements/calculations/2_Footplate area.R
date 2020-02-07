#calculate 3D distance for perimeter
shiftedone<-rbind(FPcurve[2:dim(FPcurve)[1],],FPcurve[1,])# vector shifted by one to measure distance
curveDist<-(FPcurve-shiftedone)^2
totaldistFPcurve<-sqrt(curveDist[,1]+curveDist[,2]+curveDist[,3])
totaldistFPcurve<-as.data.frame(totaldistFPcurve)#final variable
remove(curveDist)
remove(shiftedone)

#Compute centroid of footplate perimeter
FPcentroid<-as.data.frame(cbind(mean(FPcurve[,1]),mean(FPcurve[,2]),mean(FPcurve[,3])))#calculate centroid

#repeat centroid n x length of curve for euclidean distance measurements
FPcentroid<-FPcentroid[rep(seq_len(nrow(FPcentroid)), each=dim(FPcurve)[1]),]

#calculate distance from each perimeter point to centroid
DisttoFPCentroid<-(FPcurve-FPcentroid)^2
totaldisttoFPCentroid<-sqrt(DisttoFPCentroid[,1]+DisttoFPCentroid[,2]+DisttoFPCentroid[,3])
totaldisttoFPCentroid<-as.data.frame(totaldisttoFPCentroid) #final variable

#Shift "distance to centroid"by one element the to get other side of triangle
shiftdisttocentroid<-as.data.frame(totaldisttoFPCentroid[c(2:nrow(totaldisttoFPCentroid)),])
shiftdisttocentroid[nrow(totaldisttoFPCentroid),]<-totaldisttoFPCentroid[1,]

#bind all together into one
lengths<-cbind(totaldistFPcurve,totaldisttoFPCentroid,shiftdisttocentroid)

#Heron's triangle formula:
#s<-(a+b+c)/2
#area<-sqrt(s*(s-a)*(s-b)*(s-c))
s<-(lengths[,1]+lengths[,2]+lengths[,3])/2
areaeachtriangle<-sqrt(s*(s-lengths[,1])*(s-lengths[,2])*(s-lengths[,3]))
areaeachtriangle<-as.data.frame(areaeachtriangle)
FPtotalarea<-sum(areaeachtriangle)

FPcentroidsingle<-as.data.frame(cbind(mean(FPcurve[,1]),mean(FPcurve[,2]),mean(FPcurve[,3])))#calculate centroid


###############plotting#########
#insert centroid every other line for wireframeline plot:
# double all rows 
FPcentroiddoubled <- FPcurve[rep(1:nrow(FPcurve),1,each=2),]
# replace all dupliFPtes with blank cells
FPcentroiddoubled[seq(2, dim(FPcentroiddoubled)[1], by=2), ] <- FPcentroid[1,]
FPcentroideveryother<-as.data.frame(FPcentroiddoubled)

#addto original to 'every other' for correct plotting lineplot
fullFP<-rbind(FPcentroideveryother,FPcurve,FPcurve[1,])


