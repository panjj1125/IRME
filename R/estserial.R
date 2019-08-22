estserial<-function(x, y){
  #Z<-data[,1]
  #X<-data[,2]
  Z <- y
  X <- x
  #n<-nrow(data)
  n <- length(y)
  # p1<-1-(cumsum(table(X))/n)[1:(length(table(X))-1)]
  p1 <- cumsum(table(X)/n)
  #p1<-sum(X == 2)/n
  q1<-qnorm(p1)
  # Ex <- -dnorm(q1)/(1-p1)
  Ex <- rev(diff(rev(dnorm(c(-Inf, q1)))))/(table(X)/n)
  Zbar <- tapply(Z, X, mean)
  #Z1bar<-mean(Z[X==2])
  #Z0bar<-mean(Z[X==1])
  # r<-p1*(1-p1)*(Z1bar-Z0bar)/dnorm(q1)
  r <- sum(Zbar*Ex)/sum(Ex^2)
  return(r)
}
