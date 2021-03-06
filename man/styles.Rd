% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/styles.docx.R
\name{styles}
\alias{styles}
\alias{styles.docx}
\title{Get styles names of a document object}
\usage{
styles(doc, ...)

\method{styles}{docx}(doc, ...)
}
\arguments{
\item{doc}{document object}

\item{...}{further arguments passed to other methods}
}
\description{
Get styles names that exist into a document
}
\details{
With \code{docx} document, styles will be paragraph styles
of the base document (e.g. Normal, Title1, etc.).
Names of the returned character vector are labels associated with styles names.
}
\examples{
\donttest{
doc = docx( title = "title" )
styles(doc)
}
}
\seealso{
\code{\link{docx}}, \code{\link{styles}}
}

