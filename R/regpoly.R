regpoly<-function(x, y){
  r <- cor(as.numeric(x), as.numeric(y))
  # print(r)
  P <- table(x, y)/sum(table(x,y))
  nx<-nrow(P)
  ny<-ncol(P)
  Px<-rowSums(P)
  Py<-colSums(P)
  qx<-qnorm(cumsum(Px)[-nx])
  qy<-qnorm(cumsum(Py)[-ny])
  Exi1<-Exi<-Eyi<- (c(0,dnorm(qx))-c(dnorm(qx),0))/Px
  Exij<-Eyij<- matrix(rep(Exi,ny),nx,ny)

  k<-0
  dis0<-dis1<-1
  max<-100
  epsi<-0.0000000001

  while(dis1>epsi & k<max){
    # print(r)
    for (i in 1:nx){
      qxp<- (qy - r*Exi[i])/sqrt(1-r^2)  # quantiles of \tilde{Z}
      pxp<- pnorm(qxp)
      Exijp<- (c(0,dnorm(qxp)) - c(dnorm(qxp),0))/(c(pxp,1)-c(0,pxp)+0.0001)
      Eyij[i,] <- r*Exi[i]+sqrt(1-r^2)*Exijp
      Eyi[i] <- sum(P[i,]*Eyij[i,]/Px[i])
      qyxp1<-(qx[i]-r*Eyij[i,])/sqrt(1-r^2)
      qyxp0<-(qx[i-1]-r*Eyij[i,])/sqrt(1-r^2)
      if (i==1) Eyijp <- -dnorm(qyxp1)/pnorm(qyxp1)
      else if (i==nx) Eyijp<- dnorm(qyxp0)/(1-pnorm(qyxp0))
      else Eyijp <- (dnorm(qyxp0)-dnorm(qyxp1))/(pnorm(qyxp1)-pnorm(qyxp0))
      Exij[i,] <- r*Eyij[i,]+sqrt(1-r^2)*Eyijp
      Exi1[i] <- sum(P[i,]*Exij[i,]/Px[i])
    }

    r0<-sum(Eyi*Exi1)/sum(Exi1^2)
    r1<-sum(Eyi*Exi)/sum(Exi^2)
    print(r1)
    dis1<-abs(r1-r)
    #rx<-r0
    r<-r1
    Exi<-Exi1
    k<-k+1
  }
  #print(i)
  return(r)#,Ex00=Ex00,Ey00=Ey00,Ex01=Ex01,Ey01=Ey01,Ex10=Ex10,Ey10=Ey10,Ex11=Ex11,Ey11=Ey11))
}
