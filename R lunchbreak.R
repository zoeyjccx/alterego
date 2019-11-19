####1 DATASETS IN R ###################################
library(help="datasets")
data("mtcars")   #load data
head(mtcars) #show top 6 lines
plot(mtcars$hp,mtcars$mpg)
LETTERS#build in constant
####VECTOR MATH######################################
many.numbers<-c(1,2,3,4,5,6,7,8,9)  #=many.numbers<-c(1:9)
for (anumber in many.numbers){print(anumber*2)}
many.numbers*2   #how r does it 
two.times<- many.numbers*2
more.numbers<-c(2,4,3,6,8,5,0,8,2)
many.numbers+more.numbers
short.vector<-c(2,3,4)
many.numbers+short.vector  
#when vectors are of different length, recycles short.numbers
#this only works when length is multiple of each other
#########SUBSETTING#########################################################
LETTERS[3:5]
LETTERS[c(3,20:25)]
LETTERS[-c(3:5)]
LETTERS[c(-3:-5)]   #same result as above
rep(c(T,F),13)
LETTERS[(rep(c(T,F),13))]  
#getting every other letter, true= print
lots.of.letters <-data.frame(LETTERS,letters,position=1:length(letters))
View(lots.of.letters)  #capital V
lots.of.letters[3,]  #subset third roll 
lots.of.letters[,3]  #all elements of 3rd variable
lots.of.letters["LETTERS"] #CONTENT OF SELECTED VARIABLES
lots.of.letters[3:8,2]
lots.of.letters[LETTERS=="R",'letters']
lots.of.letters[LETTERS=="R"|LETTERS =='T',"letters"]

######BASIC TYPES###############################
i.am.logical <-T   #or TRUE, True doesn't work
is.logical(i.am.logical)
is.logical(1)    #fALSE
as.numeric(T)   #1

i.am.integer <-as.integer(3)
class(i.am.integer)
as.integer(3.35)  #3

i.am.numeric<- 10.5
class(i.am.numeric)

i.am.complex <-3i
i.am.complex <- -1+0i
sqrt(i.am.complex)

i.am.character<-"I like R"
substr(i.am.character,start =3,stop=3) #substring
# i.a,.character [3] will give error

nchar(i.am.character) #how many characters =8
length(i.am.character)  #how many element =1
as.raw(40)
as.hexmode(40)
charToRaw("hello")

######DATA TYPE: VECTOR ##########################e
i.am.a.vector <-1
i.am.a.vector<-c(1,2,3) #change
another.vector <-c(1,"twas")
length(i.am.a.vector) #no. of elements vs nchar
sum(nchar(i.am.a.vector))
i.am.also.a.vector<- c("did",'gre','and','in')
paste(i.am.a.vector,i.am.also.a.vector) #concatination
#different from 
c(i.am.a.vector,i.am.also.a.vector) #list all 


######DATA TYPE:LIST #############################e
#can story mixed types 
i.am.a.list<-list(1,T,"HYRE")
str(i.am.a.list) #gives type vs below
i.am.a.vector <-c(1,T,"HYRE")
str(i.am.a.vector)  #all string 

a.list<-list(letters[1:3])
another.list <-list(1:5)
still.another.list<-list(T,F,T)
#can combine all 
i.am.a.list <-list(a.list,another.list,still.another.list)
i.am.a.list   #list containing list
str(i.am.a.list)

i.am.a.list<-list(bob=c(6.2,150),bill=c(5.4,110))
names(i.am.a.list)  #bob and bill 
i.am.a.list$bob  #directly give you the value 

###DATA TYPE: FACTOR ########################################
i.am.a.vector<-c("blue","black","green","white","black","blue","blue")
i.am.a.factor<-factor(i.am.a.vector)  #only unique value
levels(i.am.a.factor)   
levels(i.am.a.factor)<-c("negro","azul","verde","blanco")
table(i.am.a.factor)
nlelves(i.am.a.factor)
barplot(table(i.am.a.factor))
levels(ordered(i.am.a.factor))
#sorted by integer value assocaite with name
sum(table(factor(i.am.a.vector,exclude = "blue")))
#factors are unique, stored as integers 
####DATA TYPE: MATRIX #################################
i.am.a.vector <-c("twas","brilling","and","the","slithey","toves")
i.am.a.matrix<-matrix(i.am.a.vector,nrow=2,ncol=3)
i.am.a.matrix
i.am.a.matrix[2,3]
dim(i.am.a.matrix)
i.am.a.matrix <-matrix(i.am.a.vector,nrow=2,ncol=3,byrow=T)
i.am.a.matrix
lots.of.letters <- c(letters[1:10],LETTERS[1:10])
letter.matrix <-matrix(lots.of.letters,ncol=2,dimnames=list(c(),c("lowercase","UPPERCASE")))
letter.matrix
#transpose
letter.matrix <-matrix(lots.of.letters,nrow=2,dimnames=list(c("lowercase","UPPERCASE"),c()))
letter.matrix
#transpose shortcut
matrix.transposed<-t(i.am.a.matrix)
matrix.transposed
matrix.transposed[3,2]


#####DATA TYPE: ARRAY#######################
# a matrix is two dimensionally array 
i.am.a.vector <- c("twas","brillig","and","the","slithey","toves","did","gyre","and","gimble","in","the","wabe")
i.am.an.array <- array(i.am.a.vector,c(2,3,2)) #2 rows, 3 column,3levels(tables)
i.am.an.array
i.am.an.array[2,3,2]  #2nd roll, 3rd column, 2nd level
i.am.an.array[2,3,2] <- "a new value" #assign value to position
i.am.an.array
i.am.an.array[2,,2] #second roll, secondlevel 

#####DATA TYPE: DATAFRAME##########################
#  a spreadsheets, colums=variables, rows: observations
#list must contain equal number of columns
i.am.a.vector <-c(1:6)
i.am.also.a.vector <- c("twas","brillig","and","the","slithey","toves")
many.months <-month.abb[1:6]  #constant built into R 
i.am.a.dataframe <- data.frame(i.am.a.vector,i.am.also.a.vector,many.months)
i.am.a.dataframe
#vectors need to have identical length
i.am.a.dataframe[2,3]
str(i.am.a.dataframe)
i.am.a.dataframe <- data.frame(i.am.a.vector,I(many.months),row.names=i.am.also.a.vector)
#I is inhibit command, inhibiting many months from converting to factor 
str(i.am.a.dataframe)
#AsIs = a cluster 

#######ORDERMERGER###########################
data("ChickWeight") #brings into enviroment 
ChickWeight$weight  # gives unsorted list 
sort(ChickWeight$weight)  #sorted vector, not factor
order(ChickWeight$weight)  # strange unsorted 
# values of chickweight sorted, return observation number 

ChickWeight[196,] # the 196 roll 
ChickWeight[order(ChickWeight$weight),] 
#pull in all the columns 
chick.one <- ChickWeight[ChickWeight$Chick ==1,]
chick.two <- ChickWeight[ChickWeight$Chick == 2,]
View(chick.one)
View(chick.two)
# two data sets, we want to merge
match.time.obs <- merge(chick.one,chick.two,by="Time")
View(match.time.obs) #sidebyside 

source("chicknames.R") #wrong 
# not in loacal working directory
#use the panel on the right to set working directory 
source("chicknames.R")
# to merge
chick_names<-merge(ChickWeight,chicknames,by.x="Chick",by.y="rank")
