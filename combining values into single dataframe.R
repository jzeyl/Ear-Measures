library(dplyr)
library(readr)

#list the files in a certain file path
singlevalsdir<-"E:/0measure RW,CA/RWCA/Outputs/Singlevalues/Feb20"
file_names<-list.files(singlevalsdir, full.names = TRUE)
file_names_short<-list.files(singlevalsdir, full.names = FALSE)

#read files and bind together
df<- file_names %>% lapply(read_csv) %>% bind_cols

#select duplicated columns
library(stringr)
No_x<-str_subset(names(df),c("X"))#columns with X
m<-str_subset(names(df),c("measures"))#columns with variables and IDs repeated
remove<-c(No_x,m)

#clean the dataframe
clean<-df[,setdiff(names(df), remove)]#select dataframe without these columns
clean$measures<-df$measures#add in measures column
clean$measures<-gsub("RD01r1-2019_","",clean$measures)#remove ID from column 

clean2<-as.data.frame(t(clean))#transpose
colnames(clean2)<-clean$measures#add column names
clean2<-clean2[-nrow(clean2),]#remove last row
clean2$ID<-row.names(clean2)#switch row names to an ID column
write.csv(clean2, "Feb20_Rdretests.csv")
getwd()