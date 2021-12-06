# 06-12-21

- Cajal-Retzius_Trajectory.Rmd

  -[X] Fit principal curve on pallial and CR differentiating cells
  -[X] Concatenate this pseudotime axis with progenitor cells cycle axis
      - Test both the alignment obtained from Revelio or with Angle methods
  -[X] fit gam to identify CR enriched genes along differentiation

# 03-12-21

-   Cellcycle_analysis.Rmd

    -   [x] Apply **Revelio** package's pipeline to fit cell cycle trajectory on pallial and hem progenitor cells. We decided not to include all progenitors domain since we observed a clear sensitivity of Revelio accuracy to sources of variation due cell types heterogeneity.
    -   [x] Save analysis results SeuratV4 object as ***Progenitors.RDS***

-   Cycling_Behaviours.Rmd

    -   [ ] Investigate difference in genes expression along cell cycle between pallial and hem progenitors

# 19-11-21

-   ProgenitorsDiversity.Rmd

    -   [x] Use of NMF implemented in the **fastTopics** package to identify genes expression structure among progenitors and ChP
    -   [x] Apply Kmeans clustering on the selected fitted topics to identify progenitors domains
    -   [x] Map this progenitors on tissue section usin ISH for the sharpest marker genes
    -   [x] Export progenitors domain labels in the `Cell_ident` slot of the full dataset metadata ***QC.filtered.cells.RDS***

# 18-11-21

-   Seurat_Conversion.Rmd

    -   [x] To Convert Seurat V2 to Seurat V4 object :
    -   [x] Exported raw counts matrix and metadata file (on the IFB cluster) as ***Counts.csv*** and ***Hem_metadata.csv***

-   Seurat_ConversionV4.Rmd

    -   [x] Build a new SeuratV4 object from ***Counts.csv*** and ***Hem_metadata.csv*** files
    -   [x] Perform broad cell type Louvain clustering using Seurat `FindCLusters` function
    -   [x] Save this object as ***QC.filtered.cells.RDS*** and make a backup copy ***QC.filtered.cells.copie.RDS***

# 15-11-21

-   Quality_Control.md

    -   [x] Perform cells quality control on the 2 sequencing libraries
    -   [x] SeuratV2 and Scrublet were used at this step
    -   [x] Generate Spring dimensionality reduction and save it in ***/SpringCoordinates***
    -   [x] Save this object as ***QC.filtered.cells_V2object.RDS***
