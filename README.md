
![][id]

### Importing and Analysing DArT type snp and silicodart data

---

#### Changelog (list of newly integrated functions)

[Changelog](https://github.com/green-striped-gecko/dartR/wiki/dartR-wiki)

----

#### Installation via CRAN

The package is now on CRAN, so to install simply type:

```{r}
install.packages("dartR")
library(dartR)
```

It also includes now a nice tutorial (called vignette in R terminology). Once installed type:


```{r}
browseVignettes("dartR")
```
to access it.

#### Manual installation of the latest version 

To install the latest package manually follow the description below:

The installation of the package might not run smoothly, as it requires additional bioconductor packages that need to be installed. 
To install the packages and all dependencies copy paste the script below into your R-console. (If you are lucky it simply installs all packages without any error message and you are done):


```{r}
install.packages("devtools")
library(devtools)
source("http://bioconductor.org/biocLite.R")
biocLite("qvalue", suppressUpdates=T)
biocLite("SNPRelate", suppressUpdates=T)
install_github("green-striped-gecko/dartR")
library(dartR)
```


Unfortunately sometimes to us unkown reasons R is not able to install all dependent packages and breaks with an error message. 
Then you need to install packages "by hand". For example you may find:

```
ERROR: dependency 'seqinr' is not available for package 'dartR'
removing 'C:/Program Files/R/library/dartR'
Error: Command failed (1)
```

Then you need to install the package ```seqinr``` via: 

```install.packages("seqinr")```

And run the last line of code again:

```install_github("green-striped-gecko/dartR")```

This "game"  of ```install.packages()``` and ```install_github()``` [the last two steps] might need to be repeated for additional packages as for whatever reason R does no longer install all packages (if anyone could tell me a way to fix this, it would be highly appreciated). Finally you should be able to run:

```{r}
install_github("green-striped-gecko/dartR")
library(dartR)
```

**without any error** (warnings if you are using an older version of R are okay) and you are done. 

Have fun working with dartR! Any issues you encounter please use the issues tab on github or contact us via email under glbugs@aerg.canberra.edu.au

Cheers, Bernd & Arthur

[id]: vignettes/figures/dartRlogo.png ""
