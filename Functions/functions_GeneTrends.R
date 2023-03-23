################################################
#### Plot single gene trend #########
################################################

trend <- function(Seurat.data,
                  group.by,
                  gene){
  
  data <- Seurat.data@meta.data %>% select(Lineage, Pseudotime, orig.ident, Phase)
  data$Gene <- Seurat.data@assays$RNA@data[gene,]
  
  if (group.by == "Lineage") {
    p <- ggplot(data=data, aes(x= Pseudotime, y= Gene)) +
      geom_point(aes(color= Phase), size=0.5) +
      scale_color_manual(values= c(wes_palette("FantasticFox1")[1:3],"grey40",wes_palette("FantasticFox1")[5])) +
      geom_smooth(method="loess", n= 50, fill="grey") +
      ylim(0,NA) +
      ggtitle(gene)
  } else if (group.by == "Genotype") {
    data$Genotype_Lineage <- paste0(data$orig.ident, " ", data$Lineage)
    p <- ggplot(data=data, aes(x= Pseudotime, y= Gene)) +
      scale_color_manual(values= c(wes_palette("FantasticFox1")[1:3],"grey40",wes_palette("FantasticFox1")[5])) +
      geom_smooth(method="loess", n= 50, aes(color= Genotype_Lineage, linetype= orig.ident)) +
      ylim(0,NA) +
      ggtitle(gene)  
  } else {
    data$Phase <- Seurat.data@meta.data$Phase
    p <- ggplot(data=data, aes(x= Pseudotime, y= Gene)) +
      geom_point(aes(color= Lineage), size=0.5) +
      scale_color_manual(values= c("#cc391b", "#026c9a")) +
      geom_smooth(method="loess", n= 50, aes(color= Lineage)) +
      ylim(0,NA) +
      ggtitle(gene)
  }
  
  
  return(p)
}


################################################
#### Plot multiple genes trend #################
################################################

Plot.Genes.trend <- function(Seurat.data,
                             group.by,
                             genes){
  pList <- mapply(FUN = trend, gene = genes,
                  MoreArgs = list(Seurat.data = Seurat.data, group.by=group.by),
                  SIMPLIFY = FALSE)
  print(x = cowplot::plot_grid(plotlist = pList, ncol = 2))
} 