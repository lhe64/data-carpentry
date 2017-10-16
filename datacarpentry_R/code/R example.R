15+2 #control enter to run the line
15-2 #comments operator
log(10); log(8) # run the same line at the same time, not recommanded
15+8*
5 # changing lines can be recogonized by the end of the operator
math<-15+5
math/7.43
new_math<-math/7.5
sqrt(new_math)
round(new_math)
round(new_math, digit=3)
blah=4 #equal sign is not rec
1meh<-4 # not start with number
mean_weight17
COLUMN_NAMES # case sensitive
ColumnNames
#c,t,data,mean already function in R
mean<-8 # not rec
column.names<-1 #alt and "-" for assign short cut
?t # help to see if it is function name
surveys <- read.csv(file="http://kbroman.org/datacarp/portal_data_joined.csv")
download.file(url="http://kbroman.org/datacarp/portal_data_joined.csv", destfile="portal_data_joined.csv")
head(surveys)
tail(surveys)
dim(surveys)
nrow(surveys)
ncol(surveys)
names(surveys)
rownames(surveys)
str(surveys)
summary(surveys)
str(new_math)
x<-50
y<-x*2
x<-75
y
#indexing in R. object.name[values]
surveys[1,5] #first value in 5th col
surveys[5,1]
surveys[1,]
surveys[,7]
surveys$sex #entire sex col
sex<-surveys$sex
str(sex)
sex[500]
vec1<-c(5,50,500)
vec1
?c
sex[vec1] #lots of blanks in the list
1:10
sex[10:1]
vec1[-2] # return the 1st and 3rd of the vec
surveys[1:3,7]
surveys[c(1,50,1000),-7] #not having sex col
vec1[1]<-10000
vec1
#missing data
heights<-c(2,4,6,NA,10)
heights
mean(heights) # return NA R assumes missing values you should be told
mean(heights,na.rm=T)
?mean
mean(heights,,T)
sex1 <- c("male","female","female","male")
str(sex1)
sex1 <- factor(c("male","female","female","male"))
str(sex1)
sex2 <- factor(sex1, levels=c("male","female"))
str(sex2)
