setwd("/your data location") #设置工作目录
suppressMessages(library(GSVA))
suppressMessages(library(GSVAdata))
suppressMessages(library(GSEABase))
suppressMessages(library(limma))
library(data.table)
keggSet= getGmt("Mm.CAFs.gmt") #download from MsigDB database
gene_exp= read.table("Matrix.txt",sep='\t',header=T,row.names=1)#read the matrix data
#######GSVA analysis#####
gsvaOut = gsva(expr=as.matrix(gene_exp), gset.idx.list=keggSet, kcdf="Gaussian", parallel.sz =4,method= "gsva")
write.table(gsvaOut,file="GSVA.txt",sep="\t") #Export the data
