## author@MayurDivate
## by making minor changes you can plot
## venn digrams using 2-5 sets

## To install limma package use follwing two comments 
#source("http://www.bioconductor.org/biocLite.R")
#biocLite("limma")

library(limma)

# Example: To plot venn diagram using three datasets 
file1 <- "A.txt"
file2 <- "B.txt"
file3 <- "C.txt"

aName <- gsub(x = file1, pattern = ".txt",replacement = "")
bName <- gsub(x = file2, pattern = ".txt",replacement = "")
cName <- gsub(x = file3, pattern = ".txt",replacement = "")

a <- read.table(file1)
a <- unique(a)
a$ac <- 1
colnames(a) <- c("ID",aName)

b <- read.table(file2)
b <- unique(b)
b$bc <- 1
colnames(b) <- c("ID",bName)

c <- read.table(file3)
c <- unique(c)
c$cc <- 1
colnames(c) <- c("ID",cName)

abc <- merge(a, b, by="ID",all = TRUE)
abc <- merge(abc, c, by="ID",all = TRUE)
abc[is.na(abc)] =  0

rownames(abc) <-  abc[,1]
abc <- abc[,-1]

out <- paste(aName,bName,file3,sep = "_AND_")
outimg <- gsub(out,pattern = ".txt", replacement = ".jpg")

jpeg(outimg, height = 1000,width = 1000,quality = 1000)
vennDiagram(abc,cex = 1.5, mar = c(0,0,0,0),
            cex.lab = 0.1, l = 4, 
            circle.col = c("red","blue","green"),
            show.include = FALSE)
dev.off()

write.table(abc,file = out,quote = TRUE,sep = "\t")

