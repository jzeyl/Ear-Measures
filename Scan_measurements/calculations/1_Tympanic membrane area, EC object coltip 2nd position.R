#Purpose: calculate tympanic membrane area and 
#convert data into a useable form useable for wireframe plotting

#Make umbo(TMtip), columella tip, coordinate objects
TMtipsingle<-ECpoints[1,]#umbo is first landmark
Coltip<-ECpoints[2,]#note here order of landmarks matters<-----------------------------------------
TMtip<-ECpoints[1,]

#Calculate total 3D distance BETWEEN TM perimeter points
shiftedone<-rbind(TMcurve[2:dim(TMcurve)[1],],TMcurve[1,])# vector shifted by one element
curveDist<-(TMcurve-shiftedone)^2#intermediate calculation - subtract points and square
totaldistTMcurve<-sqrt(curveDist[,1]+curveDist[,2]+curveDist[,3])#take square root
totaldistTMcurve<-as.data.frame(totaldistTMcurve)#<-df with euclidean distance between subsequent points on perimeter
remove(curveDist)
remove(shiftedone)

#Calculate distance measurements BETWEEN each perimeter curve point and UMBO
TMtip<-TMtip[rep(seq_len(nrow(TMtip)), each=dim(TMcurve)[1]),] #repeat the umbo n x length of curve perimeter
#row.names(TMtip)<-seq(1:dim(TMcurve)[1])# make row names integers
DisttoTMtip<-(TMcurve-TMtip)^2#intermediate calculation - subtract points and square
totaldisttoTMtip<-sqrt(DisttoTMtip[,1]+DisttoTMtip[,2]+DisttoTMtip[,3])#take square root
totaldisttoTMtip<-as.data.frame(totaldisttoTMtip) #df with distance from each point to umbo
remove(DisttoTMtip)

#Shift the preceding distance calculations by one element the to get other side of each triangle
shiftdisttoTMtip<-as.data.frame(totaldisttoTMtip[c(2:nrow(totaldisttoTMtip)),])
shiftdisttoTMtip[nrow(totaldisttoTMtip),]<-totaldisttoTMtip[1,]
shiftdisttoTMtip<-as.data.frame(shiftdisttoTMtip)#df with distance from each point to umbo, with order shifted by one

#bind all lengths of internal triangles together 
#into one dataframe
#(distance between perimeter points, distances between each perimeter point and TM tip)
lengths<-cbind(totaldistTMcurve,totaldisttoTMtip,shiftdisttoTMtip)

#Heron's method for area of triangle using 3 lengths of triangle is:
# 1) s<-(a+b+c)/2, where a, b, and s are the lengths of the triangles
# 2) Triangle area<-sqrt(s*(s-a)*(s-b)*(s-c)) 
s<-(lengths[,1]+lengths[,2]+lengths[,3])/2
areaeachtriangle<-sqrt(s*(s-lengths[,1])*(s-lengths[,2])*(s-lengths[,3]))
areaeachtriangle<-as.data.frame(areaeachtriangle)#dataframe with area of each triangle
TMtotalarea<-sum(areaeachtriangle)#total area is the sum of all triangle areas
TMtotalarea

#calculate centroid of TM curve
TMcentroid<-as.data.frame(cbind(mean(TMcurve[,1]),
                                mean(TMcurve[,2]),
                                mean(TMcurve[,3])))#calculate centroid

############plotting wireframe diagrams############
#insert columella tip every other line for line plot:
ECdoubled <- ECpoints[rep(1:nrow(ECpoints),1,each=2),]# double all rows 
ECdoubled<-as.data.frame(ECdoubled)

# replace the duplicates rows with the columella tip point
ECdoubled[seq(2, dim(ECdoubled)[1], by=2), ] <- ECpoints[2,]#ensure correct order of landmarks<-----------------------------------------
ECdoubled<-ECdoubled[-c(9,10),]#remove ECD tip for plotting
ColTipeveryother<-as.data.frame(ECdoubled)#dataframe for plotting extracolumella with 3 processes

#TMcurve to EC tip line plot
#insert colummela tip every other line for line plot:
TMcurvedoubled <- TMcurve[rep(1:nrow(TMcurve),1,each=2),]# double all rows 
TMcurvedoubled<-as.data.frame(TMcurvedoubled)

TMcurvedoubled[seq(2, dim(TMcurvedoubled)[1], by=2), ] <- ECpoints[1,]# replace all duplicates with extracolumella tip point
EStapTipeveryother<-as.data.frame(TMcurvedoubled)#<-dataframe for plotting TM