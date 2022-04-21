################################################
#### Plot single dynamic cluster trend #########
################################################

Cluster.trend <- function(Datasrt, #The Seurat object
                               Which.cluster, #number of the cluster to plot
                               clust.list, #list from the clustering results
                               Lineage,
                               Smooth.method){
  
  clust.vec <- clust.list
  Cluster.Genes <- names(clust.vec[clust.vec == Which.cluster])
  
  Expression <- as.data.frame(t(as.matrix(Datasrt@assays$RNA@data[Cluster.Genes,])))
 
  Expression$Pseudotime = Datasrt$Pseudotime
  Expression$traj = Datasrt$Lineage
  
  Melt.Data <- reshape2::melt(Expression, id=c("Pseudotime", "traj")) ; head(Melt.Data)
  
  Melt.Data <- Melt.Data %>% filter(traj == Lineage)
  
  p <- ggplot(data=Melt.Data, aes(x=Pseudotime, y=value)) +
      geom_smooth(method= Smooth.method, n= 50, fill="grey") +
      ylim(0,NA) +
      geom_vline(xintercept = 0.5, colour = "red", linetype = 2) +
      ggtitle(paste0("Cluster ", Which.cluster, " (", length(Cluster.Genes), " genes)"))
  
  return(p)
} 
  
  
################################################
#### Plot multiple dynamic clusters trend ######
################################################

Plot.clust.trends <- function(Datasrt, #The Seurat object
                               Which.cluster, #number of the cluster to plot
                               clust.list, #list from the clustering results
                               Lineage,
                               Smooth.method){
  
  pList <- mapply(FUN = Cluster.trend,
                  Which.cluster = Which.cluster,
                  MoreArgs = list(Datasrt = Datasrt,
                                  Lineage = Lineage, 
                                  clust.list = clust.list,
                                  Smooth.method = Smooth.method),
                  SIMPLIFY = FALSE)
  
  print(x = cowplot::plot_grid(plotlist = pList, ncol = 2))
}
