#purpose:
#1) calculate plane of best fit of tympanic membrane perimeter
#2) calculate plane of best fit of columella footplate
#3) calculate angle between these two planes


#1 - Z
#tympanic membrane plane
#fit 3D plane. z~ x + y
fitTM1<- lm(TMcurve[,3]~TMcurve[,1]+TMcurve[,2])
summary(fitTM1)
#extract coefficients of plane 
coefsTM<- coef(fitTM1)
TM1a <- unname(coefsTM["TMcurve[, 1]"])
TM1b <- unname(coefsTM["TMcurve[, 2]"])
TM1c <- -1
TM1d <- unname(coefsTM["(Intercept)"])


#2 - X
###################fit 3D plane. x~ y + z
fitTM2<- lm(TMcurve[,1]~TMcurve[,2]+TMcurve[,3])
summary(fitTM2)
#extract coefficients of plane 
coefsTM<- coef(fitTM2)
TM2a <- -1
TM2b <- unname(coefsTM["TMcurve[, 2]"])
TM2c <- unname(coefsTM["TMcurve[, 3]"])
TM2d <- unname(coefsTM["(Intercept)"])

#3 - Y
###################fit 3D plane. y~ x + z
fitTM3<- lm(TMcurve[,2]~TMcurve[,1]+TMcurve[,3])
summary(fitTM3)
#extract coefficients of plane 
coefsTM<- coef(fitTM3)
TM3a <- unname(coefsTM["TMcurve[, 1]"])
TM3b <- -1
TM3c <- unname(coefsTM["TMcurve[, 3]"])
TM3d <- unname(coefsTM["(Intercept)"])

Z<-summary(fitTM1)$r.squared
X<-summary(fitTM2)$r.squared
Y<-summary(fitTM3)$r.squared

#select the fit with the greatest R2
if (Z > X & Y){
  #extract coefficients of plane 
  coefsTM<- coef(fitTM1)
  TMa <- unname(coefsTM["TMcurve[, 1]"])
  TMb <- unname(coefsTM["TMcurve[, 2]"])
  TMc <- -1
  TMd <- unname(coefsTM["(Intercept)"])
} else if (X < Z & Y){
  coefsTM<- coef(fitTM2)
  TMa <- -1
  TMb <- unname(coefsTM["TMcurve[, 2]"])
  TMc <- unname(coefsTM["TMcurve[, 3]"])
  TMd <- unname(coefsTM["(Intercept)"])
} else if (Y < X & Y){
  coefsTM<- coef(fitTM3)
  TMa <- unname(coefsTM["TMcurve[, 1]"])
  TMb <- -1
  TMc <- unname(coefsTM["TMcurve[, 3]"])
  TMd <- unname(coefsTM["(Intercept)"])
}

#check the different planes by plotting:
#lines3d(fullperimeter[,1],fullperimeter[,2],fullperimeter[,3], color = "red", lwd = 3)#plot curve perimeter
#planes3d(TM3a, TM3b, TM3c, TM3d, alpha = 0.5, color = "blue")
#planes3d(TM2a, TM2b, TM2c, TM2d, alpha = 0.5, color = "blue")
#planes3d(TM1a, TM1b, TM1c, TM1d, alpha = 0.5, color = "blue")
#planes3d(TMa, TMb, TMc, TMd, alpha = 0.5, color = "blue")

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


