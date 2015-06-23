 # R and MySQL
path <- "genome-mysql.cse.ucsc.edu"
 # access hg19 database 
hg19 <- dbConnect(MySQL(),user = "genome",host = path,db = "hg19")
all_databases <- dbGetQuery(hg19,"show databases;")
head(all_databases,n = 20)
#List of all tables in hg19 database
alltables <- dbListTables(hg19)
 #reading entire table from host internet
DT <- dbReadTable(hg19,alltables[match('affyU133',alltables)])
str(DT)
# using queries to get SPECIFIC data 
query <-  dbSendQuery(hg19,"select * from affyU133 where misMatches between 1 to 10")
DTsmall <- fetch(query,n = 10)
View(DTsmall)
