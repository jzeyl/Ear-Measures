
#main dataframe
df<-read.csv(file.choose())
df<-df[1:145,]
str(df)
#names(df)
#names(df)[c(9,47:60)]
#dfclean<-df[,c(9,47:60)]
#names(dfrepmeasures)
#dfrepmeasures<-dfrepmeasures[,-c(1,2,18)]
#setdiff(names(dfclean),names(dfrepmeasures))
#setdiff(names(dfrepmeasures),names(dfclean$Code))


#dataframe with measurements to add
dfadding<-read.csv(file.choose())
str(dfadding)

#colnames(dfadding)[5:19]<-c(
#"Umbo_distancetoTMplane",  "coltip_distancetoTMplane", "totalEClength" ,          
#"totalcollength"        ,  "totalECDlength"          , "meanTMangle"   ,          
#"sdTMangle"             ,  "angle_FP_TM"             , "angle_Col_EC"  ,          
# "TMtotalarea"          ,   "FPtotalarea"            ,  "CAtotalarea"  ,           
# "RWtotalarea"          ,   "dis_coltip_TMcentroid")

#the rows that have matching codes between new values and the main DF:
match(dfadding$Codematchingmaindf,df$Code)# gives the row numbers present in the larger, df

#update specific rows in each column based on matching codes
df$Umbo_distancetoTMplane[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$Umbo_distancetoTMplane#for each row of dfrepmeasure, gives the row numbers that match in the larger df
df$coltip_distancetoTMplane[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$coltip_distancetoTMplane
df$totalEClength[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$totalEClength
df$totalcollength[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$totalcollength
df$totalECDlength[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$totalECDlength
df$meanTMangle[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$meanTMangle
df$sdTMangle[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$sdTMangle
df$angle_FP_TM[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$angle_FP_TM
df$angle_Col_EC[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$angle_Col_EC
df$TMtotalarea[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$TMtotalarea
df$FPtotalarea[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$FPtotalarea
df$CAtotalarea[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$CAtotalarea
df$RWtotalarea[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$RWtotalarea
df$dis_coltip_TMcentroid[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$dis_coltip_TMcentroid

df$Columella.length.mm[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$length
df$Columella.volume.mm3[match(dfadding$Codematchingmaindf,df$Code)]<-dfadding$Volume

write.csv(df,"D:/0Earmeasurements/earmeasurements/Sept23batchadded.csv")

