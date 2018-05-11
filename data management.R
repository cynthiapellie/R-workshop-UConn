cats<-data.frame(coat = c("calico", "black", "tabby"),
                weight =c(2.1, 5.0, 3.2),
                likes_string = c(1,0,1))

write.csv(x = cats, file = "data/feline_data.csv")
cats

cats$weight   # to look at a specific column and output vector
cats$coat

#modify entire column by same value

cats$weight + 2

cats$weight + cats$coat #trying to perform a function on something with numbers

class (cats$weight) #shows as numeric

class (cats$coat)

str(cats) #shows the entire dataframe  colums in a dataframe are vectors
str(cats$coat) #different from a character variable because they have levels; factors can be ordered but must be specified

cats$coat
cats$coats_reorder <- factor (x=cats$coat, 
                             levels = c("tabby", "calico", "black"),
                             ordered = TRUE)
str(cats$coats_reorder)
levels(cats$coats_reorder)

#Exploring Data Frames

gap<-read.csv(file = "data/gapminder-FiveYearData.csv")

head(gap) #by default shows the top six rows
str(gap)
nrow(gap)
ncol(gap) #number of columns
dim(gap) # dimensions of df in rows then columns
coln(gap)
colnames(gap)

#Subsetting data
 
x<-c(5.4, 6.2, 7.1, 4.5, 7.5) #create a new vector
names(x)<- c("a","b","c","d","e")
x[c(1,3)] #to specify specific elements

#slices to recover only part of a vector
x[1:4]

#remove an element

x[-2]

x[-(2:4)] #to remove the interior 3 columns, or use a combine function to specify the first and last piece

#subsetting gapmnder data

head(gap [1])

head(gap["pop"]) #specify by column name

head(gap[,1]) #heading of a single column

gap[3,] #subset to a single row

gap[138,] #

albania<-gap[13:24,3:6 ] #subset data with a new name that is only the albania data

Afghan<-gap[1:12,]
str(Afghan)
Afghan$gdp<-Afghan$pop*Afghan$gdpPercap
#now create a new folder called results and write the new data file
write.csv(x = Afghan, file = "results/Afghan_data.csv")

# Conditional Statements

# Curly braces set code apart: the code inside the curly braces won't always run. { and } are curly braces.

# We're starting with an if-else statement


number <- 37

if (number > 100) {               # if condition is true
  
  print("greater than 100")    # perform this function
  
} else {                                 # if condition is false
  
  print("less than 100")         # perform alternative action
  
}

print("finished checking")


This will have R evaluate the following conditional statement. Since we assigned the object number as 37, it will print the else portion "less than 100." If we were assign number as 101, then it would print "greater than 100"

You can visualize this as a choice diagram

Different comparison operators:
  
  > greater than

< less than

== equal to (a single = is an assignment operator.  *The nitty gritty is that = assigns in both directions while <- assigns in one)

!= not equal to

>= greater or equal to 

<= less or equal to

For a detailed list with more operators, see: http://adv-r.had.co.nz/Vocabulary.html

# We don't necessarily need an "else" statement
# 
# 
# number <- 150
# 
# if (number > 100) {                # if condition is true
# 
# print("greater than 100")   # peform this function

}


More than 1 test in a conditional statement


number <- -3

if (number > 0) {

print(1)

} else if (number < 0) {

print(-1)

} else {

print(0)

}


#Combining tests


# 'and'
number1 <- 15
number2 <- 40

if (number1 >= 0 & number2 >= 0) {

print("both numbers are positive")

} else {

print("at least one is negative")

}


# 'or'

number1 <- -15

number1 <- -40


if (number1 >= 0 | number2 >= 0) {

print("at least one number is positive")

} else {

print("both numbers are negative")

}

# Creating and using functions

fahr_to_kelvin<-function(temp) {
kelvin<- ((temp -32) * (5/9)) + 273.15
return(kelvin) #return is optional but good to keep in
}

fahr_to_kelvin(32) #freezing pint
fahr_to_kelvin(212) #boiling point

kelvin_to_celsius(0)


#mixing and matching

fahr_to_celsius<-function(temp){
  temp_k <- fahr_to_kelvin(temp)
  temp_c <- kelvin_to_celsius(temp_k)
  return(temp_c)
}

#can also nest

celsius_to_fahr<-function(temp){
  celsius<- ((temp) * (9/5) +32) 
  return(celsius) 
} 
celsius_to_fahr(0)
celsius_to_fahr(20)

#________________________________________________
#making a reproducible graphic
#_______________________________________________
library(ggplot2)

head(gap)

plot(x=gap$gdpPercap, y=gap$lifeExp)
#ggtree, similar languague to ggplot Hadley Wickham

#ggplot image
 
ggplot(data=gap, aes(x=gdpPercap, y=lifeExp)) #aes specifies which variables to focus on

ggplot(data=gap, aes(x=gdpPercap, y=lifeExp))+  #add a layer with +
  +   geom_point()  #specify plot type

ggplot(data=gap, aes(x=year, y=lifeExp)) +
  geom_point()  

head(gap)

#include country information (lines are country); the order of the graphic depends on the order of the 
ggplot(data=gap, aes (x=year, y=lifeExp, by = country, color = continent
                      ))+
  geom_line() +
  geom_point()

#to make black points first line is global, but can add aes to each type
ggplot(data=gap, aes (x=year, y=lifeExp, by = country))+ 
  geom_line(aes(color = continent))+
  geom_point(color = "blue")

#changes transparency of points
ggplot(data=gap, aes(x=gdpPercap, y=lifeExp)) +
  scale_x_log10()+
  geom_point(alpha=0.5)+
  geom_smooth(method = lm, color = "red", size = 2)

#to make pub ready
ggplot(data=gap, aes(x=gdpPercap, y=lifeExp)) +
  scale_x_log10()+
  geom_point(alpha=0.5)+
  geom_smooth(method = lm, color = "red")+
  theme_bw()+
  ggtitle("Effects of Per Capita GDP on Life Expectancy")+
  xlab("GDP per capita ($)")+
  ylab("Life Expectancy (Years)")

ggsave(file = "results/lefe expectancy.png")  #??ggsave has a lot of choices, including 600 dpi
 
#faceting
ggplot(dat = gap,aes(x = gdpPercap, y = lifeExp, color = continent))+
  geom_point()+
  scale_x_log10()+
  geom_smooth(method = "lm")+
  facet_wrap(~year)

ggsave(file = "results/last plot.png")
  