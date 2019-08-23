# IRME: An R package for iterative regression method for estimating polyserial and polychoric correlations

Authors: Peng Zhang, Jingjing Pan, Hui Liu

Vignette: Iterative Regression Method for Estimating Polyserial and Polychoric Correlations (under review)

Please email all comments/questions to panjj1125@outlook.com

### Installation Instructions

You can load the package and use the function install_github

```
library(devtools)
install_github("panjj1125/IRME",dependencies=TRUE)
```

Note that this will install all the packages suggested and required to run our package.  It may take a few minutes the first time, but this only needs to be done on the first use.  In the future you can update to the most recent development version using the same code. 

### Getting Started
The main function to estimate the model is `CVEP_JM()` but there are a host of other useful functions. Here is one demo:

```
library(IRME)
data(preschool)
IRME_cor <- polymatrix(preschool[,1:5])
```
