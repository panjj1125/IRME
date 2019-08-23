polymatrix <- function(x){
  require(parallel)
  myfun <- function(x, i, j) {
    X <- x[apply(is.na(x[,c(i,j)]), 1, sum) == 0, c(i,j)]
    regpoly(X[,1], X[,2])
  }

  nvar <- ncol(x)
  k <- 1
  il <- vector()
  jl <- vector()
  for (i in 2:nvar) {
    for (j in 1:(i - 1)) {
      il[k] <- i
      jl[k] <- j
      k <- k + 1
    }
  }
  poly <- mcmapply(function(i, j){myfun(x, i, j) }, il, jl)

  mat <- diag(nvar)

  mat[upper.tri(mat)] <- as.numeric(poly)
  mat <- t(mat) + mat
  #fixed <- as.numeric(poly[3, ])
  diag(mat) <- 1
  #fixed <- sum(fixed)
  return(mat)
}
