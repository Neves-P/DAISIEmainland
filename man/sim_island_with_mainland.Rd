% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sim_island_with_mainland.R
\name{sim_island_with_mainland}
\alias{sim_island_with_mainland}
\title{Simulate oceanic islands with mainland extinction given
parameters under time-constant rates.}
\usage{
sim_island_with_mainland(
  total_time,
  m,
  island_pars,
  mainland_ex,
  mainland_sample_prob,
  replicates,
  verbose = FALSE
)
}
\arguments{
\item{total_time}{Numeric defining the length of the simulation in time
units.}

\item{m}{Numeric defining the size of mainland pool.}

\item{island_pars}{A numeric vector containing the parameters for the island:
\itemize{
  \item{\code{island_pars[1]}: lambda^c (cladogenesis rate)}
  \item{\code{island_pars[2]}: mu (extinction rate)}
  \item{\code{island_pars[3]}: K (carrying capacity), set K=Inf for
  diversity independence.}
  \item{\code{island_pars[4]}: gamma (immigration rate)}
  \item{\code{island_pars[5]}: lambda^a (anagenesis rate)}
  }}

\item{mainland_ex}{Numeric parameter for mainland extinction rate.}

\item{mainland_sample_prob}{Numeric between zero and one determining the
probability of an extant mainland species being sampled.}

\item{replicates}{Integer specifying number of island replicates to be
simulated.}

\item{verbose}{Logical, determining if progress output should be printed
during the simulation.}
}
\value{
A list. The highest level of the list has two elements called
\code{ideal_islands} and \code{empirical_islands} which corresponds to
the ideal and empirical data sets produce in each simulation. Within each
\code{ideal_islands} and \code{empirical_islands} each element is an
individual replicate. The first element of each replicate is composed of
island information containing:
\itemize{
  \item{\code{$island_age}: A numeric with the island age.}
  \item{\code{$not_present}: the number of mainland lineages that are not
    present on the island.}
}
The subsequent elements of the list pertaining to each replcate contain
information on a single colonist lineage on the island and have 4 components:
\itemize{
  \item{\code{$branching_times}: island age and stem age of the
    population/species in the case of Non-endemic, Non-endemic_MaxAge and
    Endemic anagenetic species.

    For cladogenetic species these should
    be island age and branching times of the radiation including the
    stem age of the radiation.}
  \item{\code{$stac}: An integer ranging from 1 to 6
  indicating the status of the colonist:}
  \enumerate{
    \item Non_endemic_MaxAge
    \item Endemic
    \item Endemic&Non_Endemic
    \item Non_endemic_MaxAge
    \item Endemic_singleton_MaxAge
    \item Endemic_clade_MaxAge
}
\item{\code{$missing_species}: number of island species that were
not sampled for particular clade (only applicable for endemic clades)}
\item{\code{$type_1or2}: whether the colonist belongs to type 1 or type 2}
}
}
\description{
This function simulates islands with given cladogenesis,
extinction, carrying capacity, immigration and anagenesis parameters, and
simulates the mainland given an extinction rate parameter, all of which are
modelled as time-constant parameters.
}
\examples{
## Simulate 2 islands (replicates) for 1 million years, with a mainland
## extinction rate of 1 (SpMy^-1). Pool size 100.

set.seed(1)
island <- sim_island_with_mainland(
  total_time = 1,
  m = 100,
  island_pars = c(1, 1, 10, 0.1, 1),
  mainland_ex = 1,
  mainland_sample_prob = 1,
  replicates = 2,
  verbose = FALSE
)

}
\author{
Joshua Lambert
}
