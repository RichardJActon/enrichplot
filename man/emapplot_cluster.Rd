% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/emapplot_cluster.R
\name{emapplot_cluster}
\alias{emapplot_cluster}
\alias{emapplot_cluster,enrichResult-method}
\alias{emapplot_cluster,gseaResult-method}
\alias{emapplot_cluster,compareClusterResult-method}
\alias{emapplot_cluster.enrichResult}
\alias{emapplot_cluster.compareClusterResult}
\title{emapplot_cluster}
\usage{
emapplot_cluster(x, showCategory = nrow(x), color = "p.adjust", ...)

\S4method{emapplot_cluster}{enrichResult}(x, showCategory = 30, color = "p.adjust", ...)

\S4method{emapplot_cluster}{gseaResult}(x, showCategory = 30, color = "p.adjust", ...)

\S4method{emapplot_cluster}{compareClusterResult}(x, showCategory = 30, color = "p.adjust", ...)

emapplot_cluster.enrichResult(
  x,
  showCategory = 30,
  color = "p.adjust",
  cex_line = 1,
  with_edge = TRUE,
  nWords = 4,
  nCluster = NULL,
  split = NULL,
  min_edge = 0.2,
  cex_label_group = 1,
  label_style = "shadowtext",
  group_legend = FALSE,
  cex_category = 1
)

emapplot_cluster.compareClusterResult(
  x,
  showCategory = 30,
  color = "p.adjust",
  cex_line = 1,
  with_edge = TRUE,
  nWords = 4,
  nCluster = NULL,
  split = NULL,
  min_edge = 0.2,
  cex_label_group = 1,
  pie = "equal",
  legend_n = 5,
  cex_category = 1,
  label_style = "shadowtext",
  group_legend = FALSE
)
}
\arguments{
\item{x}{enrichment result.}

\item{showCategory}{number of enriched terms to display}

\item{color}{variable that used to color enriched terms, e.g. pvalue,
p.adjust or qvalue}

\item{...}{additional parameters}

\item{cex_line}{scale of line width}

\item{with_edge}{if TRUE, draw the edges of the network diagram}

\item{nWords}{the number of words in the cluster tags}

\item{nCluster}{the number of clusters}

\item{split}{separate result by 'category' variable}

\item{min_edge}{minimum percentage of overlap genes to display the edge,
should between 0 and 1, default value is 0.2}

\item{cex_label_group}{scale of group labels size}

\item{label_style}{one of "shadowtext" and "ggforce"}

\item{group_legend}{If TRUE, the grouping legend will be displayed.
The default is FALSE}

\item{cex_category}{number indicating the amount by which plotting category
nodes should be scaled relative to the default.}

\item{pie}{proportion of clusters in the pie chart, one of
'equal' (default) or 'Count'}

\item{legend_n}{number of circle in legend}
}
\value{
ggplot object
}
\description{
Functional grouping network diagram for enrichment result of
over-representation test or gene set enrichment analysis
}
\details{
This function visualizes gene sets as a grouped network (i.e. enrichment map).
Gene sets with high similarity tend to cluster together, making it easier
for interpretation.
}
\examples{
\dontrun{
    library(clusterProfiler)
    library(org.Hs.eg.db)
    library(enrichplot)
    library(GOSemSim)
    library(DOSE)
    data(geneList)
    gene <- names(geneList)[abs(geneList) > 2]
    ego <- enrichGO(gene  = gene,
        universe      = names(geneList),
        OrgDb         = org.Hs.eg.db,
        ont           = "CC",
        pAdjustMethod = "BH",
        pvalueCutoff  = 0.01,
        qvalueCutoff  = 0.05,
        readable      = TRUE)
    d <- godata('org.Hs.eg.db', ont="BP")
    ego2 <- pairwise_termsim(ego, method = "Wang", semData = d)
    emapplot_cluster(ego2, showCategory = 80)
   }
}
