library(Seurat)
library(harmony)
library(tidyverse)
library(patchwork)
library(hdf5r)
library(patchwork)
library(ggplot2)
setwd("/ your own location")#
scRNA <- readRDS("fibroblast_SCT_harmony.rds")
##UMAP¾ÛÀà·Ö
scRNA <- FindNeighbors(scRNA, dims = 1:30) %>% FindClusters(resolution = 0.04)#
options(repr.plot.height = 4, repr.plot.width = 6)#
p <-DimPlot(scRNA, reduction = "umap", label = TRUE,pt.size = 0.3,label.size = 4,raster=FALSE)#
ggsave(" umap.pdf", p, width = 26, height = 10)#
#iCAF and myCAF marker
cluster10Marker=c("ACTA2","TAGLN","MMP11","MYL9","HOPX","POSTN","TPM1","TPM2","PDGFRA",
                  "CXCL12","CFD","DPT","C3","CCL2","CXCL1","COL14A1","AGTR1","HAS1","C7","IL6")
DotPlot(object = scRNA, features = cluster10Marker,dot.scale = 10,col.min = -2,
        col.max = 2,)+ RotatedAxis()+scale_color_gradient2(low = "blue", mid = "white", high = "red")+ coord_flip()+ theme(axis.text.x = element_text(angle=45, hjust=1, vjust=1))
#Arp2/3 complex
cluster10Marker=c("ACTR2","ACTR3","ARPC1A","ARPC1B","ARPC2","ARPC3","ARPC4","ARPC5")
DotPlot(object = scRNA, features = cluster10Marker,dot.scale = 10,col.min = -2,
        col.max = 2,)+ RotatedAxis()+scale_color_gradient2(low = "blue", mid = "white", high = "red")+ coord_flip()+ theme(axis.text.x = element_text(angle=45, hjust=1, vjust=1))

