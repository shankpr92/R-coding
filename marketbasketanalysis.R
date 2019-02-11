install.packages("arules")
library(arules)
#1.Load the data into R.
#Loaded data using below code with format as single 
#and skipping first row which is header and mentioned that column header is a string.
mydata <- read.transactions("G:/study/DS/HW 1/student-courses.csv",format ="single", sep=",", skip=1, cols=c(1,2))
inspect(mydata)
itemFrequencyPlot(mydata,type="absolute")
pdf("itemFreq.pdf")
#2.Perform an affinity analysis using support of 0.02 and confidence of 0.3.
#Using apriori algorithm did affinity analysis as mentioned above.
rules <- apriori(mydata,parameter= list(support=0.02,confidence=0.3))
#3.How many rules did the system generate?
#It generated 40 rules.
inspect(rules)
#4.Sort the display by descending order of lift and display the top 5 rules.
#Sorted the rules in descending order of lift using sort and displayed top 5 rules
#using head method.
inspect(head(sort(rules,by="lift", descending = TRUE),5))
#5.If a student has taken AC104, which course (just one) would you recommend to
#this student? If you had to recommend two, which two would they be?
#I would recommend QA812 (one course) which has the highest lift value.
#I would recommend QA812 and MG501 (two courses), MG501 having the second
#highest lift value.
rules_1 <- apriori(mydata,parameter= list(support=0.02,confidence=0.3), appearance = list(default="rhs",lhs="AC104"))
inspect(rules_1)