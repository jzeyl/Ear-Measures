#CALCULATIONS FOR PLOTTING 
#Calculate the points on the TM base plane that is
#on the shortest line connected to the umbo and col tip

#1) shortest distance from umbo to plae
#2) shortest distance from columella tip to plane
#umbo coordinate = TMtipsingle
#plane coordinates = TMa, TMb, TMc, TMd

#solve for t, that point on the plane and the line at the same time

#TMa(TMa(t)+TMtipsingl[1,1]) + TMb(TMbt+TMtipsingle[,2]) + TMc(TMbt+TMtipsingle[,3]) + TMd = 0
#rerrange:
#(TMa*TMa*t)+(TMa*TMtipsingle[,1])+
#(TMb*TMb*t)+(TMb*TMtipsingle[,2])+
#(TMc*TMc*t)+(TMa*TMtipsingle[,3]) +TMd = 0

#rearrange
#(TMa*TMa*t)+(TMb*TMb*t)+(TMc*TMc*t) = -(TMa*TMtipsingle[,1])-(TMb*TMtipsingle[,2])(TMc*TMtipsingle[,3])- TMd
#-(TMa*TMa*t)-(TMb*TMb*t)-(TMc*TMc*t) = (TMa*TMtipsingle[,1])+(TMb*TMtipsingle[,2])+(TMc*TMtipsingle[,3])+ TMd

#(TMa*TMtipsingle[,1])+(TMb*TMtipsingle[,2])+(TMc*TMtipsingle[,3])+ TMd = -(TMa*TMa)t-(TMb*TMb)t-(TMc*TMc)t
#(TMa*TMtipsingle[,1])+(TMb*TMtipsingle[,2])+(TMc*TMtipsingle[,3])+ TMd = (-(TMa*TMa)-(TMb*TMb)-(TMc*TMc))*t

#solve for t
t = (-(TMa*TMtipsingle[,1])-(TMb*TMtipsingle[,2])-(TMc*TMtipsingle[,3])-
       TMd)/(sum(TMa^(2)+TMb^(2)+TMc^(2)))

#plug t into plane equation
TMx<-TMtipsingle[,1]+(TMa*t)
TMy<-TMtipsingle[,2]+(TMb*t)
TMz<-TMtipsingle[,3]+(TMc*t)
TMpoint<-as.data.frame(cbind(TMx,TMy,TMz))
TMpoint[2,]<-TMtipsingle[1,]
#rgl.points(TMpoint[,1],TMpoint[,2],TMpoint[,3], col = "black", lwd = 3)
#rgl.points(TMtipsingle[,1],TMtipsingle[,2],TMtipsingle[,3], col = "black", lwd = 50)


#solve for h
h = (-(TMa*Coltip[,1])-(TMb*Coltip[,2])-(TMc*Coltip[,3])-
       TMd)/(sum(TMa^(2)+TMb^(2)+TMc^(2)))

#plug t into plane equation
TMcolx<-Coltip[,1]+(TMa*h)
TMcoly<-Coltip[,2]+(TMb*h)
TMcolz<-Coltip[,3]+(TMc*h)
colTMpoint<-as.data.frame(cbind(TMcolx,TMcoly,TMcolz))
colTMpoint[2,]<-Coltip[1,]
#rgl.points(colTMpoint[,1],colTMpoint[,2],colTMpoint[,3], col = "black", lwd = 3)
#rgl.points(Coltip[,1],Coltip[,2],Coltip[,3], col = "black", lwd = 3)


