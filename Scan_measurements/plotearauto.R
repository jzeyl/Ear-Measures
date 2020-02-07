snapshotpath<-"J:/0measure RW,CA/RWCA/Outputs/Snapshots/"#directory for wirefram shots

#plotting in rgl package
fullperimeter<-rbind(TMcurve,TMcurve[1,])#draw perimeter of tympanic membrane
#mfrow3d(2,2)
#tympanic membrane and other areas
lines3d(fullperimeter[,1],fullperimeter[,2],fullperimeter[,3], color = "red", lwd = 3)#plot curve perimeter
lines3d(EStapTipeveryother[,1],EStapTipeveryother[,2],EStapTipeveryother[,3], color = "red", lwd = 3)#plot TM connections to umbo
lines3d(ColTipeveryother[,1],ColTipeveryother[,2],ColTipeveryother[,3], color = "blue", lwd = 3)#plot extracolumella
lines3d(fullRW[,1],fullRW[,2],fullRW[,3], col = "green", lwd = 3)#plot round window
lines3d(fullCA[,1],fullCA[,2],fullCA[,3], col = "orange", lwd = 3)#plot cochlear aqueduct
lines3d(fullFP[,1],fullFP[,2],fullFP[,3], col = "black", lwd = 3)#plot footplate
lines3d(FP_ECD[,1],FP_ECD[,2],FP_ECD[,3], col = "purple", lwd = 3)#plot endosseous cochlear duct
lines3d(TMpoint[,1],TMpoint[,2],TMpoint[,3], col = "green", lwd = 3)
lines3d(colTMpoint[,1],colTMpoint[,2],colTMpoint[,3], col = "green", lwd = 3)

planes3d(TMa, TMb, TMc, TMd, alpha = 0.5, color = "blue")#plot plane of tympanic membrane
planes3d(FPa, FPb, FPc, FPd, alpha = 0.5, color = "blue")#plot plane of footplate

colmodel<-readSTL(file.choose())#add columella stl model
axes3d()#axes
#label ID
#rgl.texts(TMtip[1,1], TMtip[1,2],TMtip[1,3],ID, col = "black", size = 10)
