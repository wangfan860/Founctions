setwd("C:/Users/fwang1/Desktop/GSE9891_RAW")
install.packages("org.Hs.eg.db")
source("http://bioconductor.org/biocLite.R")
biocLite("org.Hs.eg.db")
install.packages("C:/Users/fwang1/Desktop/GSE9891_RAW/hgu133plus2hsentrezg.db_19.0.0.tar.gz", repos = NULL, type = "source")
install.packages("C:/Users/fwang1/Desktop/GSE9891_RAW/hgu133plus2hsentrezgcdf_19.0.0.tar.gz", repos = NULL, type = "source")
install.packages("C:/Users/fwang1/Desktop/GSE9891_RAW/hgu133plus2hsentrezgprobe_19.0.0.tar.gz", repos = NULL, type = "source")
source("http://bioconductor.org/biocLite.R")
biocLite("affy")


library(affy)
expr_clinical <- ReadAffy() # read cel files in current working directory
expr_clinical@cdfName <- "HGU133Plus2_Hs_ENTREZG" # set the CDF name
expr_clinical_norm <- rma(expr_clinical) # normalize the data
library("hgu133plus2hsentrezg.db")
x <- hgu133plus2hsentrezgSYMBOL
mapped_probes_brain <- mappedkeys(x)
names(mapped_probes_brain) <- as.character(x[mapped_probes_brain])
entrez2sym_brain <- as.character(x[mapped_probes_brain])
symBrain2entrez <- entrez2sym_brain
names(symBrain2entrez) <- names(entrez2sym_brain)
expr_clinical_syms <- exprs(expr_clinical_norm)
rownames(expr_clinical_syms) <- symBrain2entrez[rownames(exprs(expr_clinical_norm))]
write.table(expr_clinical_syms, file="GSE14671-expression.txt")
