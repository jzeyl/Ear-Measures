library(dplyr)
library(readr)
Volume<-"D"
folder<- "May26 batch"
writeto<-


#list the files in a certain file path
dir.create(paste0(Volume, ":/Outputs/Singlevalues/",folder))
singlevalsdir<-paste0(Volume, ":/Outputs/Singlevalues/",folder)
file_names<-list.files(singlevalsdir, full.names = TRUE)

#read files and bind together into single datafrmae
df<- file_names %>% lapply(read_csv) %>% bind_cols

#select duplicated columns
library(stringr)
No_x<-str_subset(names(df),c("X"))#list columns with X
m<-str_subset(names(df),c("measures"))#columns with variables and IDs repeated
remove<-c(No_x,m)#list of names of redundant columns to remove

#clean the dataframe
clean<-df[,setdiff(names(df), remove)]#select dataframe columns lacking those redundant columnswithout these columns
clean$measures<-df$measures#add in measures column

clean$measures<-gsub("CDP01Correct_","",clean$measures)#remove unique ID from column 

clean2<-as.data.frame(t(clean))#transpose
colnames(clean2)<-clean$measures#add column names
clean2<-clean2[-nrow(clean2),]#remove last row
clean2$ID<-row.names(clean2)#switch row names to an ID column

write.csv(clean2, paste0(Volume,":/singledfsinglevals/",folder,".csv"))
