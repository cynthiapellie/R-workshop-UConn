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


