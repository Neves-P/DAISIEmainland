
# DAISIEmainland

<!-- badges: start -->
[![R build status](https://github.com/joshwlambert/DAISIEmainland/workflows/R-CMD-check/badge.svg)](https://github.com/joshwlambert/DAISIEmainland/actions)
[![codecov.io](https://codecov.io/github/joshwlambert/DAISIEmainland/coverage.svg?branch=main)](https://codecov.io/github/joshwlambert/DAISIEmainland/branch/main)
<!-- badges: end -->

The goal of DAISIEmainland is to simulate data to test whether the DAISIE model
(Dynamic Assembly of Island biota through Speciation Immigration and Extinction)
initially developed in Valente et al. (2015) and used in Valente et al. (2017a,
2017b, 2019, 2020) and Hauffe et al. 2020 can reliably estimate
macroevolutionary parameters (cladogenesis, extinction, carrying capacity,
immigration and anagenesis) when the assumption of a static mainland pool of
species is violated, as is the case in nature. 

## Installation

You can install the released version of DAISIEmainland from github with:

``` r
remotes::install_github("joshwlambert/DAISIEmainland")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(DAISIEmainland)

replicates <- 1000

island <- sim_island_with_mainland(
  time = 5,
  m = 100,
  island_pars = c(1, 1, 10, 0.1, 1),
  mainland_ex = 1,
  mainland_sample_prob = 1,
  replicates = replicates,
  verbose = FALSE
)

ideal_ml <- vector("list", replicates)
empirical_ml <- vector("list", replicates)

for (i in seq_len(replicates)) {
  ideal_ml[[i]] <- DAISIE::DAISIE_ML_CS(
    datalist = island$ideal_islands[[i]],
    initparsopt = c(1, 1, 10, 1, 1),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    jitter = 1e-5)
  
  empirical_ml[[i]] <- DAISIE::DAISIE_ML_CS(
    datalist = island$reality_islands[[i]],
    initparsopt = c(1, 1, 10, 1, 1),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    jitter = 1e-5)
}
```

## Cite this package

Lambert, J. W., Neves, P., Bilderbeek, R. J. C., Valente, L. & Etienne, R. S.
(2021) DAISIEmainland: testing DAISIE in the presence of mainland dynamics. 
R package version 1.0.0. https://github.com/joshwlambert/DAISIEmainland

## Cite the DAISIE package

Etienne R. S., Valente, L., Phillimore, A. B., Haegeman, B., Lambert, J. W., Neves, P., Xie, S., & Bilderbeek, R. J. C. (2020). DAISIE: Dynamical Assembly of Islands by Speciation, Immigration and Extinction. R package version 3.0.1. https://cran.r-project.org/package=DAISIE

## References

Valente, L., Phillimore, A.B., & Etienne, R.S. (2015). Equilibrium and non-equilibrium dynamics simultaneously operate in the Galápagos islands. Ecology Letters, 18(8), 844–852. http://doi.org/10.1111/ele.12461

Valente, L., Etienne, R.S., & Dávalos, L.M. (2017). Recent extinctions disturb path to equilibrium diversity in Caribbean bats. Nature Ecology & Evolution, 1(2), 0026. http://doi.org/10.1038/s41559-016-0026

Valente, L., Illera, J.C., Havenstein, K., Pallien, T., Etienne, R.S., & Tiedemann, R. (2017). Equilibrium Bird Species Diversity in Atlantic Islands. Current Biology, 27(11), 1660-1666. https://doi.org/10.1016/j.cub.2017.04.053

Valente, L., Phillimore, A.B., & Etienne, R.S. (2018). Using molecular phylogenies in island biogeography: It’s about time. Ecography, 1–3. http://doi.org/10.1111/ecog.03503

Valente, L., Etienne, R.S., & Garcia-R., J.C. (2019). “Deep Macroevolutionary Impact of Humans on New Zealand’s Unique Avifauna.” Current Biology 29 (15): 2563-2569.e4. https://doi.org/10.1016/j.cub.2019.06.058

Valente, L., Phillimore, A.B., Melo, M., Warren, B.H., Clegg, S.M., Havenstein, K., Tiedemann, R., Illera, J.C.,, Thebaud, C., Aschenbach, T. & Etienne, R.S. (2020). “A Simple Dynamic Model Explains the Diversity of Island Birds Worldwide.” Nature 579 (7797): 92–96. https://doi.org/10.1038/s41586-020-2022-5

Hauffe, T., Delicado, D., Etienne, R.S., & Valente, L. (2020). Lake expansion elevates equilibrium diversity via increasing colonization. Journal of Biogeography 47: 1849–1860. https://doi.org/10.1111/jbi.13914
