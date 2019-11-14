#PACKAGES IN R#################################################
if(!require("pacman"))install.packages("pacman")
pacman::p_load(pacman,party,psych,rio,tidyverse)
#DATASETS ####################################################
library(tidyverse)
library(datasets)
iris
UCBAdmissions
Titanic
state.x77
swiss
#COLORS###########################################################
x <- c(24,13,7,5,3,2)
barplot(x)
?colors
barplot(x, col="slategray3")
barplot(x, col=c("red3","slategray3"))
?palette
palette()
barplot(x,col=1:6)
barplot(x, col=rainbow(6))
barplot(x, col=heat.colors(6))
#laternatively terrain.colors(), topo.colors(), cm.colors()
#BAR#############################################################
diamonds
plot(diamonds$cut)
#using pipe 
diamonds %>%
  select(color) %>%
  plot()
#try again with table
diamonds %>%
  select(clarity) %>%
  table() %>%  #puteverything into a table
  sort(decreasing = T) %>%    #sort table 
  barplot()

#add options
diamonds %>%
  select(clarity) %>%
  table() %>%
  barplot(
    main = "Clarity of Diamonds",
    sub = "(Source: ggplot2::diamonds)",
    horiz = T, #draw horizontal bars 
    ylab = "Clarity of Diamonds",  #flip axis labels 
    xlab = "Frequency",
    xlim = c(0,15000), #limits for x axis
    border = NA, #no borders on bars 
    col = "#CD0000" #red3
  )

#SIDEBYSIDE BARPLOT OF REQUENCIES ################################
df <-diamonds %>% 
  select(color, clarity) %>%
  table() %>%
  print()  #show table in console
#stacked bar: step 1: create graph 
df %>%
  barplot(legend = rownames(.)) #drawplot with  legend

#side by side bar
df%>%
  barplot(
    legend = rownames(.), #dot is a placeholder for pipe
    beside = T # put bars next to beach other
  )

#HISTOGRAM ###################################################
?diamonds
hist(diamonds$price)

hist(diamonds$price,
     breaks = 7, #number of breaks
     main = "Histogram of Price of Diamonds",
     sub = "(Source: ggplot::diamonds)",
     ylab = "Frequency",
     xlab = "Price of Diamonds",
     border = NA, #NO BORDERS ON BARS
     col = "#CD0000"
     )

#BOX PLOT ####################################################
boxplot(diamonds$price)
 

diamonds %>%
  select(price) %>%
  boxplot(
    hotizontal = T,
    notch = T, #confidence internval for median
    main = "Boxplot of Price of Diamonds",
    sub = "(Source: ggplot2::diamonds)",
    xlab = "Price of Diamonds",
    col = "#CD0000"
  )

diamonds %>% 
  select(color, price) %>%
  boxplot(
    price ~ color, # tilde indicates formula
    data = .,
    col = "#CD0000"
  )

# SCATTERPLOT ######################################################
df <- StateData_1_
df %>%
  select(instagram:modernDance) %>%
  plot()
#gives scatterplot matrix
df %>%
  select(scrapbook:modernDance) %>%
  plot()
#fancy 
df %>%
  select(scrapbook:modernDance) %>%
  plot(
    main = "Scatterplot of Google Searches by State",
    xlab = "Searches for \"scrapbook\"",       #use escape to include quote in title 
    ylab = "Searches for \"Modern dance\"" ,
    col = "gray",
    pch = 20,  #plotting character #small circle 
    )

df %>%
  lm(modernDance ~ scrapbook, data = .) %>%
  abline()

#get rid of outlier 

df %>% 
  select(state_code, scrapbook) %>%
  filter (scrapbook >4) %>%
  print()


df %>%
  select(scrapbook:modernDance) %>%
  filter(scrapbook <4) %>%
  plot(
    main = "Scatterplot of Google Searches by State",
    xlab = "Searches for \"scrapbook\"",       #use escape to include quote in title 
    ylab = "Searches for \"Modern dance\"" ,
    col = "gray",
    pch = 20,  #plotting character #small circle 
  ) 

df %>%
  filter (scrapbook <4) %>%
  lm(modernDance ~ scrapbook, data = .) %>%
  abline()
# LINECHART###########################################################
uspop
plot(uspop)

uspop %>%
  plot(
    main = "US Population for US",
    sub = "(Source: datasets:: uspop)",
    xlab = "Year",
    ylab = "Population (in millions)",
  )
abline(v=1930, col="lightgray")
text(1930,10,"1930",col="red3")

ts.plot(uspop)
plot.ts(uspop) #more powerful 
#all give same graph
EuStockMarkets
plot(EuStockMarkets) # plot.ts gives you the same 
ts.plot(EuStockMarkets)

#calculate cluster
hc <- df %>%  #get data
  dist %>%     #compute distance matrix
  hclust        #compute hierarchical clusters 

hc %>% plot(labels = df$state_code)

#drawboxes around clusters 
hc %>% rect.hclust(k=2, border = "gray80") #2 boxes
hc %>% rect.hclust(k=3, border = "gray60")
hc %>% rect.hclust(k=4, border = "gray40")


# Wangling data: select subgroups######################################
df %>% 
  filter(entrepreneur > 1) %>%
  print()

#region is a character variable 
df %>%
  filter(region == "South") %>%   #equaltation 
  print( )

df %>%
  filter(psychRegions == "Relaxed and Creative") %>%   #equaltation 
  print ()

df %>% 
  filter(region == "South" |     #& for and
      psychRegions == "Relaxed and Creative") %>%
  print()

  #not is the !
  df %>%
    filter(region == "South" &
             !psychRegions == "Relaxed and Creative") %>%
    print()
  
  
# LOAD AND PREPARE DATA ##############################################e
# a categorical recode   
  df %>%
    mutate(relaxed = recode(psychRegions,
        "Relaxed and Creative" = "yes",
         "Friendly and Convetional" = "no",
         .default = "no")) %>%  #set default value
    select(state_code,psychRegions,relaxed)
   
df2<- df %>%
  mutate(likeArts = case_when(
    museum >1 |scrapbook >1 | modernDance >1 ~"yes",
    TRUE~ "no")) #all other values

df2 %>%
  select(state_code, likeArts, museum:modernDance) %>%
  arrange(desc(likeArts)) %>%
  print(n=Inf)    #Show me all the rolls 
  ))
# average variables
df %>%
  mutate(
    socialMedia = (instagram +facebook + retweet)/3,
    artsCraft = (museum + scrapbook + modernDance)/3
  )  %>%
  select (state_code,socialMedia, artsCraft)


df %>%
  mutate(
    outgoing = (volunteering +(privacy* -1))/2
  ) %>%
  select (state_code,outgoing,volunteering,privacy)

#packages "psych" and "scale" make this process easier 
library(psych)
library(scale)

#DATA ANALYSIS###########################################
#summarize data frame 
  
summary(df)

df %>%
  select(region) %>%
  table()  #for a factor you just use summary()

#summarize multiple factors
df <-df %>%
  mutate (region = as.factor(region)) %>%
  mutate (psychRegions = as.factor(psychRegions)) %>%
  print()

summary(df)

#descriptives 
# Tukey's five number summary: minimum, lower-hinge, median, upper hinge, max, no labels
fivenum(df$entrepreneur)
boxplot(df$entrepreneur, notch=T, horizontal =T )
boxplot.stats(df$entrepreneur)
# gives the lower and upper end of conf interview, give outliers

p_load(psych)
describe(df$entrepreneur)  #enhanced version of summary
describe(df)

# correlations 
df <- df %>%
  as_tibble() %>%
  select(instagram:modernDance) %>%
  print()

cor(df)

df %>%
  cor() %>%
  round(2)  #2 decimal place 

#more details: 
cor.test(df$instagram,df$privacy)

p_load(Hmisc)

df %>%
  as.matrix() %>%   #coerce it 
  rcorr()
#this gives 2 tables: correaltion and and p tables 

#linear regression 
df %>%
  select(instagram:modernDance) %>%
  plot()

df %>%
  select(volunteering,museum) %>%
  plot()
#linear model
lm(df$volunteering ~df$museum) %>% abline() 

#compute and save bivariate regression
fit1<- lm(df$volunteering~df$museum)
#show model 
fit1
#summary regression model: with residual 
summary(fit1)
#confidence interval 
confint(fit1)
#predict value of volunteering
predict (fit1)
predict(fit1,interval = "prediction")

#regression diagnostics 
lm.influence(fit1)
influence.measures(fit1)


#multiple regression
df <- df%>%
  select(volunteering, everything()) %>%
  print() 
#most concise assume multiple regression
#by default it assumes the first colum is outcome so we first set it up that way
lm(df) 

lm(volunteering ~.,data=df) #. is everything else 

#identify the entire model
#lm (volunteering ~ instagram +facebook+retweet + ) list out everything 

fit2<- lm(df) #secondt ime fitting model to data
fit2
summary(fit2)
#cotingency table = cross tabulating 
df <- StateData_1_
df %>%
  as_tibble() %>%
  select(state_code,region,psychRegions) %>%
  mutate(psychRegions = as.factor(psychRegions)) %>%
  print()
  
ct <- table(df$region,df$psychRegions)
ct
?as_tibble #turns existing object into data frame with class tbl df

p_load(magrittr) #get arithmetic aliases
#row percentages
ct %>%
  prop.table(1) %>% #1 is for row percentages
  round(2) %>%
  multiply_by(100)

ct %>%
  prop.table(2) %>% #1 is for column percentages
  round(2) %>%
  multiply_by(100)

ct %>%
  prop.table() %>% #no argement for total percentages
  round(2) %>%
  multiply_by(100)

#chisq test 
tchi<- chisq.test(ct)
tchi
#additional table (but small data set)
tchi$observed  
tchi$expected
tchi$residuals
tchi$stdres