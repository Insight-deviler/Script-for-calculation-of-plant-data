#Enables the library for doing the job
library("stats")
library("readxl")
library("writexl")
#get the file location in the follwoing format  "C:\Users\Documents\NAME_OF_FILE.xlsx"
excelFile=read_excel(readline(prompt = "Location of Excel file: "))
dataFrame = data.frame(excelFile)
lenght=nrow(dataFrame)
final=sqrt(lenght)
#calculate the mean
mean1=mean(dataFrame$Flowering)
mean2=mean(dataFrame$Plantheight)
mean3=mean(dataFrame$Headdiameter)
mean4=mean(dataFrame$Totalnoseeds)
mean5=mean(dataFrame$Filledseeds)
mean6=mean(dataFrame$Fillingpercent)
mean7=mean(dataFrame$X100seedwt)
#calculate the sd
sd1=sd(dataFrame$Flowering)
sd2=sd(dataFrame$Plantheight)
sd3=sd(dataFrame$Headdiameter)
sd4=sd(dataFrame$Totalnoseeds)
sd5=sd(dataFrame$Filledseeds)
sd6=sd(dataFrame$Fillingpercent)
sd7=sd(dataFrame$X100seedwt)
#calculate the standard error
se1=sd1/final
se2=sd2/final
se3=sd3/final
se4=sd4/final
se5=sd5/final
se6=sd6/final
se7=sd7/final
#pcv calculation
pcv1=(sd1/mean1)*100
pcv2=(sd2/mean2)*100
pcv3=(sd3/mean3)*100
pcv4=(sd4/mean4)*100
pcv5=(sd5/mean5)*100
pcv6=(sd6/mean6)*100
pcv7=(sd7/mean7)*100
#gcv calculation
gcv1=((sd1-se1)/mean1)*100
gcv2=((sd2-se2)/mean2)*100
gcv3=((sd3-se3)/mean3)*100
gcv4=((sd4-se4)/mean4)*100
gcv5=((sd5-se5)/mean5)*100
gcv6=((sd6-se6)/mean6)*100
gcv7=((sd7-se7)/mean7)*100
Characters<-c("Flowering","Plant Height", "Head Diameter", "Total Seeds","Filled Seeds","Filling%","100 Seed Weight")
Mean<-c(mean1,mean2,mean3,mean4,mean5,mean6,mean7)
Standard_Deviation<-c(sd1,sd2,sd3,sd4,sd5,sd6,sd7)
Standard_Error<-c(se1,se2,se3,se4,se5,se6,se7)
PCV<-c(pcv1,pcv2,pcv3,pcv4,pcv5,pcv6,pcv7)
GCV<-c(gcv1,gcv2,gcv3,gcv4,gcv5,gcv6,gcv7)
df<-data.frame(Characters,Mean,Standard_Deviation,Standard_Error,PCV,GCV)
print(df)
#saving the data in excel format if necessary
saves=readline(prompt = "Save the results as excel? Type yes/no: ")
Savecmd=as.character("yes")
if(saves==Savecmd){
  write_xlsx(df,"cal.xlsx")
  print("Saved in working directory")
}else{
  #Do NOTHING
}
