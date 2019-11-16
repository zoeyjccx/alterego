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


