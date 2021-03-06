% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/30_metropolis_setup.R
\name{bv_metropolis}
\alias{bv_metropolis}
\alias{bv_mh}
\title{Metropolis-Hastings settings}
\usage{
bv_metropolis(
  scale_hess = 0.01,
  adjust_acc = FALSE,
  adjust_burn = 0.75,
  acc_lower = 0.25,
  acc_upper = 0.45,
  acc_change = 0.01
)

bv_mh(
  scale_hess = 0.01,
  adjust_acc = FALSE,
  adjust_burn = 0.75,
  acc_lower = 0.25,
  acc_upper = 0.45,
  acc_change = 0.01
)
}
\arguments{
\item{scale_hess}{Numeric scalar or vector. Scaling parameter, determining
the range of hyperparameter draws. Should be calibrated so a reasonable
acceptance rate is reached. If provided as vector the length must equal
the number of hyperparameters (one per variable for \code{psi}).}

\item{adjust_acc}{Logical scalar. Whether or not to further scale the
variability of parameter draws during the burn-in phase.}

\item{adjust_burn}{Numeric scalar. How much of the burn-in phase should be
used to scale parameter variability. See Details.}

\item{acc_lower, acc_upper}{Numeric scalar. Lower (upper) bound of the target
acceptance rate. Required if \emph{adjust_acc} is set to \code{TRUE}.}

\item{acc_change}{Numeric scalar. Percent change applied to the Hessian
matrix for tuning acceptance rate. Required if \emph{adjust_acc} is set to
\code{TRUE}.}
}
\value{
Returns a named list of class \code{bv_metropolis} with options for
\code{\link{bvar}}.
}
\description{
Function to provide settings for the Metropolis-Hastings step in
\code{\link{bvar}}. Options include scaling the inverse Hessian that is
used to draw parameter proposals and automatic scaling to achieve certain
acceptance rates.
}
\details{
Note that adjustment of the acceptance rate by scaling the parameter
draw variability can only be done during the burn-in phase, as otherwise the
resulting draws do not feature the desirable properties of a Markov chain.
After the parameter draws have been scaled, some additional draws should be
burnt.
}
\examples{
# Increase the scaling parameter
bv_mh(scale_hess = 1)

# Turn on automatic scaling of the acceptance rate to [20\%, 40\%]
bv_mh(adjust_acc = TRUE, acc_lower = 0.2, acc_upper = 0.4)

# Increase the rate of automatic scaling
bv_mh(adjust_acc = TRUE, acc_lower = 0.2, acc_upper = 0.4, acc_change = 0.1)

# Use only 50\% of the burn-in phase to adjust scaling
bv_mh(adjust_acc = TRUE, adjust_burn = 0.5)
}
\keyword{MCMC}
\keyword{Metropolis-Hastings}
\keyword{settings}
