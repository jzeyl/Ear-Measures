#calculate 3D distance for perimeter
shiftedone<-rbind(CAcurve[2:dim(CAcurve)[1],],CAcurve[1,])# vector shifted by one to measure distance
curveDist<-(CAcurve-shiftedone)^2
totaldistCAcurve<-sqrt(curveDist[,1]+curveDist[,2]+curveDist[,3])
totaldistCAcurve<-as.data.frame(totaldistCAcurve)#final variable
remove(curveDist)
remove(shiftedone)

#compute centroid
CAcentroid<-as.data.frame(cbind(mean(CAcurve[,1]),mean(CAcurve[,2]),mean(CAcurve[,3])))#calculate centroid

#repeat centroid n x length of curve for euclidean distance measurements
CAcentroid<-CAcentroid[rep(seq_len(nrow(CAcentroid)), each=dim(CAcurve)[1]),]
#row.names(CAcentroid)<-seq(1:dim(CAcurve)[1])# make row names integers

#calculate distance from each perimeter point to centroid
DisttoCACentroid<-(CAcurve-CAcentroid)^2
totaldisttoCACentroid<-sqrt(DisttoCACentroid[,1]+DisttoCACentroid[,2]+DisttoCACentroid[,3])
totaldisttoCACentroid<-as.data.frame(totaldisttoCACentroid) #final variable
remove(DisttoCACentroid)

#Shift "distance to centroid"by one element the to get other side of triangle
shiftdisttoCAcentroid<-as.data.frame(totaldisttoCACentroid[c(2:nrow(totaldisttoCACentroid)),])
shiftdisttoCAcentroid[nrow(totaldisttoCACentroid),]<-totaldisttoCACentroid[1,]

#bind all together into one
lengths<-cbind(totaldistCAcurve,totaldisttoCACentroid,totaldisttoCACentroid)

#Heron's triangle formula:
#s<-(a+b+c)/2
#area<-sqrt(s*(s-a)*(s-b)*(s-c))
s<-(lengths[,1]+lengths[,2]+lengths[,3])/2
areaeachtriangle<-sqrt(s*(s-lengths[,1])*(s-lengths[,2])*(s-lengths[,3]))
areaeachtriangle<-as.data.frame(areaeachtriangle)
CAtotalarea<-sum(areaeachtriangle)

CAcentroidsingle<-as.data.frame(cbind(mean(CAcurve[,1]),mean(CAcurve[,2]),mean(CAcurve[,3])))#calculate centroid


#############################################################plotting
#insert centroid every other line for line plot:
# double all rows 
CAcentroiddoubled <- CAcurve[rep(1:nrow(CAcurve),1,each=2),]

# replace all duplicates with blank cells
CAcentroiddoubled[seq(2, dim(CAcentroiddoubled)[1], by=2), ] <- CAcentroid[1,]
CAcentroideveryother<-as.data.frame(CAcentroiddoubled)
#lines3d(centroideveryother[,1],centroideveryother[,2],centroideveryother[,3])

#addto original to 'every other' for correct plotting lineplot
fullCA<-rbind(CAcentroideveryother,CAcurve,CAcurve[1,])


