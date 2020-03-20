
#main dataframe
df<-read.csv(file.choose())
df<-df[1:119,]
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

#df$Umbo_distancetoTMplane<-as.numeric(df$Umbo_distancetoTMplane)

#the rows that have matching codes between new values and the main DF:
match(dfadding$Code,df$Code)# gives the row numbers present in the larger, df

#update specific rows based on matching codes
df$Umbo_distancetoTMplane[match(dfadding$Code,df$Code)]<-dfadding$Umbo_distancetoTMplane#for each row of dfrepmeasure, gives the row numbers that match in the larger df
df$coltip_distancetoTMplane[match(dfadding$Code,df$Code)]<-dfadding$coltip_distancetoTMplane
df$totalEClength[match(dfadding$Code,df$Code)]<-dfadding$totalEClength
df$totalcollength[match(dfadding$Code,df$Code)]<-dfadding$totalcollength
df$totalECDlength[match(dfadding$Code,df$Code)]<-dfadding$totalECDlength
df$meanTMangle[match(dfadding$Code,df$Code)]<-dfadding$meanTMangle
df$sdTMangle[match(dfadding$Code,df$Code)]<-dfadding$sdTMangle
df$angle_FP_TM[match(dfadding$Code,df$Code)]<-dfadding$angle_FP_TM
df$angle_Col_EC[match(dfadding$Code,df$Code)]<-dfadding$angle_Col_EC
df$TMtotalarea[match(dfadding$Code,df$Code)]<-dfadding$TMtotalarea
df$FPtotalarea[match(dfadding$Code,df$Code)]<-dfadding$FPtotalarea
df$CAtotalarea[match(dfadding$Code,df$Code)]<-dfadding$CAtotalarea
df$RWtotalarea[match(dfadding$Code,df$Code)]<-dfadding$RWtotalarea
df$dis_coltip_TMcentroid[match(dfadding$Code,df$Code)]<-dfadding$dis_coltip_TMcentroid

write.csv(df,"D:/earmeasures Mar16batchadded.csv")

rbound<-rbind(dfclean,dfrepmeasures)
df<-cbind(df,rbound)

df$Umbo_distancetoTMplane[match(dfrepmeasures$Code,df$Code)]<-if(df$Code %in% dfrepmeasures$Code ==TRUE){
which(any(dfrepmeasures$Code) == df$Code)
  which('a' == v)
}
dfrepmeasures$Code<-as.character(dfrepmeasures$Code)
str(df$Code)
is.value(match(df$Code,dfrepmeasures$Code){
  
if( ==TRUE){
  df[match(dfrepmeasures$Code,df$Code),#matching rows
            c(47:60)]<-dfrepmeasures[4:17]
}  
}

ifelse(df$Code %in% dfrepmeasures$Code = TRUE,"a","b")

str(df$Code %in% dfrepmeasures$Code)

#cells to update with observations:
updated<-df
#columns 

dim(updated[match(dfrepmeasures$Code,df$Code),#matching rows
c(47:60)])
dim(dfrepmeasures[4:17])

#cells to use to update  
dfrepmeasures[4:17]


setdiff(df$Umbo_distancetoTMplane[match(dfrepmeasures$Code,df$Code)],dfrepmeasures$Umbo_distancetoTMplane)


#affect these rowsof main df:
dfclean[match(dfrepmeasures$Code,df$Code,),]

dfupdated<-df
codes<-dfrepmeasures$Code

for (i in codes){
  if(i)
}
if (df$Code ==)