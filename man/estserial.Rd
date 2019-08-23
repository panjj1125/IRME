\name{estserial}
\alias{estserial}
\title{Polyserial Correlation}
\usage{
estserial(x, y)
}
\description{
Using iterative regression method to estimate the polyserial correlation between a quantitative variable and an ordinal variables, based on the assumption
  that the joint distribution of the quantitative variable and a latent continuous variable underlying the ordinal
  variable is bivariate normal.
}

\arguments{
  \item{x}{an ordered categorical variable; can be numeric, logical, a factor,
    or an ordered factor, but if a factor, its levels should be in proper order.}
  \item{y}{a numerical variable.}
}

\examples{
if(require(mvtnorm)){
    set.seed(12345)
    data <- rmvnorm(1000, c(0, 0), matrix(c(1, .5, .5, 1), 2, 2))
    x <- data[,1]
    y <- data[,2]
    cor(x, y)  # sample correlation
    }
if(require(mvtnorm)){
    x <- cut(x, c(-Inf, -1, .5, 1.5, Inf))
    estserial(x, y)  # 2-step estimate
    }

}
