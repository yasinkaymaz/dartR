% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.recalc.freqhomsnp.r
\name{utils.recalc.freqhomsnp}
\alias{utils.recalc.freqhomsnp}
\title{A utility script to recalculate the the frequency of the homozygous alternate SNP by locus after some populations have been deleted}
\usage{
utils.recalc.freqhomsnp(x, v = 2)
}
\arguments{
\item{x}{-- name of the genlight object containing the SNP data [required]}

\item{v}{-- verbosity: 0, silent or fatal errors; 1, begin and end; 2, progress log ; 3, progress and results summary; 5, full report [default 2]}
}
\value{
The modified genlight object
}
\description{
The locus metadata supplied by DArT has FreqHomSnp included,
but the frequency of the homozygous alternate will change when some individuals are removed from the dataset. 
This script recalculates the FreqHomSnp and places these recalculated values in the appropriate place in the genlight object.
Note that the frequency of the homozygote alternate SNPS is calculated from the individuals that could be scored.
}
\examples{
#result <- dartR:::utils.recalc.freqhomsnp(testset.gl)
}
\author{
Arthur Georges (Post to \url{https://groups.google.com/d/forum/dartr})
}
