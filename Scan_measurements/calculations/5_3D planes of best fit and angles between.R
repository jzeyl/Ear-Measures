#purpose:
#1) calculate plane of best fit of tympanic membrane perimeter
#2) calculate plane of best fit of columella footplate
#3) calculate angle between these two planes


#tympanic membrane plane
#fit 3D plane. z~ x + y
fitTM<- lm(TMcurve[,3]~TMcurve[,1]+TMcurve[,2])

#extract coefficients of plane 
coefsTM<- coef(fitTM)
TMa <- unname(coefsTM["TMcurve[, 1]"])
TMb <- unname(coefsTM["TMcurve[, 2]"])
TMc <- -1
TMd <- unname(coefsTM["(Intercept)"])

#fit footplate
#fit 3D plane. z~ x + y
fitFP<- lm(FPcurve[,3]~FPcurve[,1]+FPcurve[,2])

coefsFP<- coef(fitFP)
FPa <- unname(coefsFP["FPcurve[, 1]"])
FPb <- unname(coefsFP["FPcurve[, 2]"])
FPc <- -1
FPd <- unname(coefsFP["(Intercept)"])

#plot plane of best fit of footplate plane
#planes3d(FPa, FPb, FPc, FPd, alpha = 0.5, color = "blue")

####angle between TM and footplate PLANES####
#cos(angle) = abs(top/bottom)
#top <-(a1*a2)+(B1*B2)+(C1*C2)
#bottom<- sqrt((a1^2)+(b1^2)+(c1^2))*sqrt((a2^2)+(b2^2)+(c2^2))
TM_FP_top <-abs((TMa*FPa)+(TMb*FPb)+(FPc*FPc))
TM_FP_bottom<- sqrt((TMa^2)+(TMb^2)+(TMc^2))*sqrt((FPa^2)+(FPb^2)+(FPc^2))
TM_FP_cosangle<- abs(TM_FP_top/TM_FP_bottom)
angle_FP_TM<-acos(TM_FP_cosangle)*180/pi# convert radians to degrees

#The trigonometric functions in R use radians, not degrees, e.g. 360 degrees is 2pi radians. 
#Converting from and to radians:
#deg2rad = function(deg) {
#  return((pi * deg) / 180)
#}

#rad2deg = function(rad) {
#  return((180 * rad) / pi)
#}


