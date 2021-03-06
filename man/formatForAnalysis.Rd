% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis_on_quantification.R
\name{formatForAnalysis}
\alias{formatForAnalysis}
\title{Format data for analysis}
\usage{
formatForAnalysis(
  data,
  design = NULL,
  feature_info = NULL,
  zero.threshold = 100,
  zero.group = NULL,
  outliers = NULL
)
}
\arguments{
\item{data}{A data frame containing omics dataset with samples in columns and
features of interest in rows (metabolites/buckets...).}

\item{design}{A data frame describing the colums of \code{data} with at
least two columns, the first one corresponding to the column names of
\code{data}. Default to NULL (in which case, the column names of \code{data}
are used for study design).}

\item{feature_info}{A data frame describing the rows of \code{data} with
at least two columns, the first one corresponding to the row names of
\code{data}. Default to NULL (in which case, the row names of \code{data} are
used for feature information).}

\item{zero.threshold}{Remove features having a proportion of zeros larger
than or equal to \code{zero.threshold}. Default to \code{100}.}

\item{zero.group}{Variable name of design data frame specifying the group
variable used to remove features with a proportion of zeros larger than or
equal to \code{zero.threshold} within the group. Default to \code{NULL}, no
group.}

\item{outliers}{Names of the outliers (samples) to remove.}
}
\value{
An object of type \code{\link{SummarizedExperiment}} with metabolite
data given as buckets or quantified metabolites.
}
\description{
Create an object of class \code{\link{SummarizedExperiment}} to use in
functions \code{\link{pca}}, \code{\link{oplsda}} or
\code{\link{kruskalWallis}}.
}
\examples{
# Import quantification results
if (require("ASICSdata", quietly = TRUE)) {
  quantif_path <- system.file("extdata", "results_ASICS.txt",
                              package = "ASICSdata")
  quantification <- read.table(quantif_path, header = TRUE, row.names = 1)

  # Import design
  design <- read.table(system.file("extdata", "design_diabete_example.txt",
                                   package = "ASICSdata"), header = TRUE)

  # Create object for analysis and remove features with more than 25\% of
  # zeros
  analysis_obj <- formatForAnalysis(quantification,
                                    design = design,
                                    zero.threshold = 25,
                                    zero.group = "condition")
}

}
