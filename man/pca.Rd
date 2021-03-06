% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis_on_quantification.R
\name{pca}
\alias{pca}
\title{Principal Component Analysis (PCA) on a \code{\link{SummarizedExperiment}}
object}
\usage{
pca(
  analysis_data,
  scale.unit = TRUE,
  type.data = "quantifications",
  condition = NULL
)
}
\arguments{
\item{analysis_data}{A \code{\link{SummarizedExperiment}} object obtained
from the \code{\link{formatForAnalysis}} function.}

\item{scale.unit}{Logical. If \code{TRUE}, data are scaled to unit variance
prior PCA.}

\item{type.data}{Type of data used for the analysis (\emph{e.g.,}
\code{"quantifications"}, \code{"buckets"}...). Default to
\code{"quantifications"}.}

\item{condition}{The name of the design variable (two level factor)
specifying the groups, if one is available. Default to NULL, no group
provided.}
}
\value{
A S4 object of class \linkS4class{AnalysisResults} containing PCA
results.
}
\description{
Perform a PCA with the function of the \code{\link{ropls}} package on a
\code{\link{SummarizedExperiment}} object obtained from the
\code{\link{formatForAnalysis}} function
}
\examples{
# Import quantification results
if (require("ASICSdata", quietly = TRUE)) {
  quantif_path <- system.file("extdata", "results_ASICS.txt",
                              package = "ASICSdata")
  quantification <- read.table(quantif_path, header = TRUE, row.names = 1)

  # Create object for analysis and remove features with more than 25\% of
  # zeros
  analysis_obj <- formatForAnalysis(quantification, zero.threshold = 25)
  res_pca <- pca(analysis_obj)
}

}
\seealso{
\linkS4class{AnalysisResults}
}
