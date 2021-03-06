% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/format_to_daisie_data.R
\name{format_to_daisie_data}
\alias{format_to_daisie_data}
\title{Formats simulation output into standard DAISIE list output.}
\usage{
format_to_daisie_data(island_replicates, total_time, m)
}
\arguments{
\item{island_replicates}{List that has as many elements as replicates. Each
element must be a list with the elements \code{island_age} and
\code{not_present}. ##### LOOK INTO THIS}

\item{total_time}{Numeric defining the length of the simulation in time
units.}

\item{m}{Numeric defining the size of mainland pool.}
}
\value{
List with DAISIE simulation output
}
\description{
Formats simulation output into standard DAISIE list output.
}
\keyword{internal}
