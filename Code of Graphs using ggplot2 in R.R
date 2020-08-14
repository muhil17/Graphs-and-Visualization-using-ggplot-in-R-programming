#To import data from the system
#data1 is the variable name which holds the dataset 

#Download the data set
data1<-read.csv("Enter ur path here")
#Enter ur path at which the dataset is available. Ex - "E:/coding_folder/R_folder/dataset_folder/Dataset_Mba.csv"
str(data1)

#ggplot2 is the library to use graphs
library(ggplot2)
library(graphics)

#use '?' then the function to get help of that function
?ggplot()

#to plot graph use ggplot and geom
ggplot(data1,aes(data1$Percentage_in_10_Class))+geom_dotplot()
ggplot(data1,aes(data1$Percentage_in_10_Class))+geom_histogram()

#histogram is the best option to measure single scale variable and continuous data

ggplot(data1,aes(data1$Percentage_in_Under_Graduate))+geom_histogram()
ggplot(data1,aes(data1$percentage_MBA))+geom_histogram()
ggplot(data1,aes(data1$pre_score))+geom_histogram()
ggplot(data1,aes(data1$post_score))+geom_histogram()

#use geom_density to see skewness and kurtosis
ggplot(data1,aes(data1$Percentage_in_Under_Graduate))+geom_density()

#to compare 2 variables using geom_point
ggplot(data1,aes(data1$Percentage_in_10_Class, data1$Percentage_in_12_Class))+geom_point()
ggplot(data1,aes(data1$Percentage_in_10_Class,data1$Percentage_in_Under_Graduate))+geom_point()
ggplot(data1,aes(data1$Percentage_in_Under_Graduate,data1$percentage_MBA))+geom_point()

#use geom_smooth 
ggplot(data1,aes(data1$Percentage_in_10_Class, data1$Percentage_in_12_Class))+geom_smooth()+geom_point()
ggplot(data1,aes(data1$percentage_MBA, data1$Percentage_in_12_Class))+geom_smooth()+geom_point()

#use geom_bar to see categorical variable and for discrete data
ggplot(data1,aes(data1$Specialization))+geom_bar()
ggplot(data1,aes(data1$STATE))+geom_bar()

#u cannot use comma for bar 2 variables instead use fill
ggplot(data1,aes(data1$Previous_Degree,fill=data1$Specialization))+geom_bar()
ggplot(data1,aes(data1$Marital_status,fill=data1$Specialization))+geom_bar() #wecannot conclude from this graph as the size is very small
ggplot(data1,aes(data1$Gender,fill=data1$Specialization))+geom_bar(position="dodge")


ggplot(data1,aes(data1$Gender,fill=data1$Specialization))+geom_bar(position="stack") #default graph
ggplot(data1,aes(data1$Gender,fill=data1$Specialization))+geom_bar(position="fill")


#Bar graph plot discrete data , Histogram plot continuous data
ggplot(data1,aes(data1$Specialization,fill=data1$perceived.Job.Skill:data1$Gender))+geom_bar()

#Facetgrid draws multiple instances of the same plot on different subsets of your dataset.
#if u want to use facet grid u have to use ~
ggplot(data1,aes(data1$Specialization,fill=data1$perceived.Job.Skill))+geom_bar()+facet_grid(~Gender)
ggplot(data1,aes(data1$Specialization,fill=data1$perceived.Job.Skill))+geom_bar()+facet_wrap(~Gender)

# to use many variables use +
ggplot(data1,aes(data1$Specialization,fill=data1$perceived.Job.Skill))+geom_bar()+facet_grid(~Gender+STATE)
ggplot(data1,aes(data1$Specialization,fill=data1$perceived.Job.Skill))+geom_bar()+facet_grid(~Gender+STATE+Marital_status)

# u can add any number of variables to the facet grid
ggplot(data1,aes(data1$Specialization,fill=data1$perceived.Job.Skill))+geom_bar()+facet_grid(Gender~Marital_status~STATE)
ggplot(data1,aes(data1$Specialization,fill=data1$perceived.Job.Skill))+geom_bar()+facet_grid(Previous_Degree+Gender+Marital_status~Place_you_belong_to)
ggplot(data1,aes(data1$Specialization,fill=data1$perceived.Job.Skill))+geom_bar()+facet_grid(Previous_Degree+Gender~Marital_status+Place_you_belong_to)
#~ makes two variables on one side and two on other side for better vizualisation

#boxplot is used to check the distribution of data and also to find outliers
ggplot(data1,aes(Gender, Percentage_in_10_Class))+geom_boxplot()
?boxplot()
ggplot(data1,aes(Gender, Percentage_in_10_Class))+geom_col()
ggplot(data1,aes(Gender, Percentage_in_10_Class))+geom_bin2d()
ggplot(data1,aes(Gender, Percentage_in_10_Class))+geom_violin()
ggplot(data1,aes(Percentage_in_12_Class, Percentage_in_10_Class))+geom_point(aes(color=Gender))
ggplot(data1,aes(Percentage_in_12_Class, Percentage_in_10_Class))+geom_point(aes(shape=Gender,color=Previous_Degree))+facet_grid(~Gender)
ggplot(data1,aes(Percentage_in_12_Class, Percentage_in_10_Class))+geom_point(aes(shape=Gender,color=Previous_Degree))


library(vcd)
mosaic(data1$Gender~data1$Previous_Degree+data1$Marital_status)
mosaicplot(data1$Gender~data1$Previous_Degree+data1$Marital_status)

library(treemap)
?treemap()
#treemap chart provides a hierarchical view of your data and to visualise large amount of data
treemap(data1,index="Gender",vSize="Percentage_in_10_Class")

treemap(data1,index=c("Gender","STATE"),vSize="Percentage_in_10_Class")
treemap(data1,index=c("Gender","STATE","Previous_Degree"),vSize="Percentage_in_10_Class")     

