% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gl2gi.r
\name{gl2gi}
\alias{gl2gi}
\title{Converts a genlight object to genind object}
\usage{
gl2gi(gl, v = 1)
}
\arguments{
\item{gl}{-- a genlight object}

\item{v}{-- level of verbosity. v=0 is silent, v=1 returns more detailed output during conversion.}
}
\value{
A genind object, with all slots filled.
}
\description{
Converts a genlight object to genind object
}
\details{
this function uses a faster version of df2genind (from the adgegenet package)
}
\author{
Bernd Gruber (bugs? Post to \url{https://groups.google.com/d/forum/dartr})
}
