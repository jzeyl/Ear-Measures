#calculate 3D distance for perimeter
shiftedone<-rbind(RWcurve[2:dim(RWcurve)[1],],RWcurve[1,])# vector shifted by one to measure distance
curveDist<-(RWcurve-shiftedone)^2
totaldistRWcurve<-sqrt(curveDist[,1]+curveDist[,2]+curveDist[,3])
totaldistRWcurve<-as.data.frame(totaldistRWcurve)#final variable
remove(curveDist)
remove(shiftedone)

#compute centroid
RWcentroid<-as.data.frame(cbind(mean(RWcurve[,1]),mean(RWcurve[,2]),mean(RWcurve[,3])))#calculate centroid

#repeat centroid n x length of curve for euclidean distance measurements
RWcentroid<-RWcentroid[rep(seq_len(nrow(RWcentroid)), each=dim(RWcurve)[1]),]
#row.names(RWcentroid)<-seq(1:dim(RWcurve)[1])# make row names integers

#calculate distance from each perimeter point to centroid
DisttoRWCentroid<-(RWcurve-RWcentroid)^2
totaldisttoRWCentroid<-sqrt(DisttoRWCentroid[,1]+DisttoRWCentroid[,2]+DisttoRWCentroid[,3])
totaldisttoRWCentroid<-as.data.frame(totaldisttoRWCentroid) #final variable
remove(DisttoRWCentroid)

#Shift by one element the to get other side of triangle
shiftdisttoRWcentroid<-as.data.frame(totaldisttoRWCentroid[c(2:nrow(totaldisttoRWCentroid)),])
shiftdisttoRWcentroid[nrow(totaldisttoRWCentroid),]<-totaldisttoRWCentroid[1,]

#bind all together into one
lengths<-cbind(totaldistRWcurve,totaldisttoRWCentroid,totaldisttoRWCentroid)

#Heron's triangle formula:
#s<-(a+b+c)/2
#area<-sqrt(s*(s-a)*(s-b)*(s-c))
s<-(lengths[,1]+lengths[,2]+lengths[,3])/2
areaeachtriangle<-sqrt(s*(s-lengths[,1])*(s-lengths[,2])*(s-lengths[,3]))
areaeachtriangle<-as.data.frame(areaeachtriangle)
RWtotalarea<-sum(areaeachtriangle)

RWcentroidsingle<-as.data.frame(cbind(mean(RWcurve[,1]),mean(RWcurve[,2]),mean(RWcurve[,3])))#calculate centroid

#############################################################plotting
#insert centroid every other line for line plot:
# double all rows 
RWcentroiddoubled <- RWcurve[rep(1:nrow(RWcurve),1,each=2),]
#row.names(RWcentroiddoubled)<- seq(1:38)
#row.names(RWcentroiddoubled)

# replace all duplicates with blank cells
RWcentroiddoubled[seq(2, dim(RWcentroiddoubled)[1], by=2), ] <- RWcentroid[1,]
RWcentroideveryother<-as.data.frame(RWcentroiddoubled)
#lines3d(centroideveryother[,1],centroideveryother[,2],centroideveryother[,3])

#addto original to 'every other' for correct plotting lineplot
fullRW<-rbind(RWcentroideveryother,RWcurve,RWcurve[1,])

