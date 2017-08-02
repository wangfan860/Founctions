rm(list=ls())
options(digits=3,digits.sec=4,device="quartz",max.print=200)
## other options (width=120,error=recover)

## this file has functions that I use most often

## install libraries if needed
install.packages("qvalue")

## install bioconductor package
source("http://bioconductor.org/biocLite.R")
## biocLite("qvalue")

## useful libraries

library(qvalue)
library(MASS)
library(reshape)
library(Hmisc)

## paste operator
"%&%" <- function(a, b) paste(a, b, sep="")

## define subdirectories

pre = 'C:/Users/fan/Desktop/R/'
input.dir = pre %&% 'input/'
output.dir = pre %&% 'output/'
plot.dir = pre %&% 'plots/'
source.dir = pre %&% "sources/"
work.dir = pre

## functions specific to the project
##source(source.dir %&% "functions.r")

## working directory

setwd(work.dir)

## read the data

data.miR.survival = read.table("222.txt",sep='\t', header=T, quote = "\"", stringsAsFactors = F)

##multiple pair-wise LR
phenolist=names(data.miR.survival)[272]
exprlist=names(data.miR.survival)[2:271]
results=data.frame()

pvals <- numeric()
for(cpheno in phenolist) {pheno = data.miR.survival[,cpheno]
                          for(cexpr in exprlist) {expr = data.miR.survival[,cexpr]
                                                  fit = lm(pheno ~ expr)
                                                  sumfit=summary(fit)
			       pvals <- c(pvals, coef(summary(fit))[2,4])   
                                                  results = rbind( results, data.frame(cexpr, cpheno, coef(sumfit) ) )                      
                                                  print(cpheno)
                                                  print(cexpr)                     
                                                  print(summary(fit))}}
write.table(results, file="result.txt", quote=F, col=T, row=F)

##odd or even rows
del <- seq(1, nrow(results), by = 2)
b = results[-del, ]
