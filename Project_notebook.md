# 03-12-21

- Cellcycle_analysis.Rmd

  [X] Apply **Revelio** package's pipeline to fit cell cycle trajectory on pallial and hem progenitor cells
  [X] Save analysis results SeuratV4 ibject as ***Progenitors.RDS***
  
- Cycling_Behaviours.Rmd

  [ ] Investigate difference in genes expression along cell cycle between pallial and hem progenitors

# 19-11-21

- ProgenitorsDiversity.Rmd

  [X] Use of NMF implemented in the **fastTopics** package to identify genes expression structure among progenitors and ChP
  [X] Apply Kmeans clustering on the selected fitted topics to identify progenitors domains 
  [X] Map this progenitors on tissue section usin ISH for the sharpest marker genes
  [X] Export progenitors domain labels in the `Cell_ident` slot of the full dataset metadata ***QC.filtered.cells.RDS***

# 18-11-21

- Seurat_Conversion.Rmd

  [X] To Convert Seurat V2 to Seurat V4 object :
  [X] Exported raw counts matrix and metadata file (on the IFB cluster) as ***Counts.csv*** and ***Hem_metadata.csv***

- Seurat_ConversionV4.Rmd

  [X] Build a new SeuratV4 object from ***Counts.csv*** and ***Hem_metadata.csv*** files
  [X] Perform broad cell type Louvain clustering using Seurat `FindCLusters` function
  [X] Save this object as ***QC.filtered.cells.RDS*** and make a backup copy ***QC.filtered.cells.copie.RDS*** 

# 15-11-21

- Quality_Control.md 

  [X] Perform cells quality control on the 2 sequencing libraries
  [X] SeuratV2 and Scrublet were used at this step
  [X] Generate Spring dimensionality reduction and save it in ***/SpringCoordinates***
  [X] Save this object as ***QC.filtered.cells_V2object.RDS***
