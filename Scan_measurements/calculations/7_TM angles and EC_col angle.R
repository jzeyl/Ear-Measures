#Calculate angle of tympanic membrane perimeter points relative to the plane
#of best fit of the tympanic membrane
#2) angle columella relative to extrastapedius

#1a)calculate line vectors connecting perimeter points to umbo
linedirectionvector<-TMcurve-TMtip
colnames(linedirectionvector)<-c("u1","u2","u3")
planecoefficents<-as.data.frame(cbind(TMa,TMb,TMc))
colnames(planecoefficents)<- c("A","B","C")
planecoefficientrepeated<-planecoefficents[rep(1:nrow(planecoefficents),1,each=nrow(linedirectionvector)),]
all<-cbind(linedirectionvector,planecoefficientrepeated)
rownames(all)<-seq(1:nrow(linedirectionvector))

#1b) calculate angle between line and tympanic membrane plane
top<-abs((all$A*all$u1)+(all$B*all$u2)+(all$C*all$u3))
bottom<-sqrt((all$A^2)+(all$B^2)+(all$C^2))*sqrt((all$u1^2)+(all$u2^2)+(all$u3^2))
angles<-as.data.frame(asin(top/bottom))*180/pi#convert from degrees to radians
meanTMangle<-mean(angles$`asin(top/bottom)`)
sdTMangle<-sd(angles$`asin(top/bottom)`)

#2) angle columella relative to extrastapedius
linedirectionvector_col<-FPcentroidsingle-Coltip
linedirectionvector_EC<-TMtipsingle-Coltip
top <-abs((linedirectionvector_col[1,1]*linedirectionvector_EC[1,1])+
            (linedirectionvector_col[1,2]*linedirectionvector_EC[1,2])+
            (linedirectionvector_col[1,3]*linedirectionvector_EC[1,3]))
bottom<- sqrt((linedirectionvector_col[1,1]^2)+(linedirectionvector_col[1,2]^2)+(linedirectionvector_col[1,3]^2))*
  sqrt((linedirectionvector_EC[1,1]^2)+(linedirectionvector_EC[1,2]^2)+(linedirectionvector_EC[1,3]^2))
cosangle<- abs(top/bottom)
angle_Col_EC<-acos(cosangle)*180/pi


