library(mosaic)
library(mosaicCalc)

bisektion <- function(fkt, a, b, maxiter=1000, minwidth=1/1000){
  # Bisektionsverfahren 
  if (fkt(a)*fkt(b) > 0) {
    stop("Das Intervall muss keine Nullstellen enthalten!")
  }
  if (a > b) {
    swap <- a; a <- b; b <- swap
  }
  iw <- (b-a); i <- 1
  while (iw > minwidth) {
    hi <- (a+b)/2;
    cat("Iteration:", i, "\t(a+b)/2=", hi, "\tf((a+b)/2)=", fkt(hi),
        "\na=", a, "\t fkt(a)=", fkt(a), 
        "\nb=", b, "\t fkt(b)=", fkt(b), "\n\n");
    hi <- (a+b)/2; i <- i + 1
    if (i > maxiter) break
    if (fkt(a)*fkt(hi) < 0) {
      b <- hi
    } else {
      a <- hi
    }
    iw <- (b-a)
  }
  erg <- list(fkt=fkt, a=a, b=b); return(erg)
}

fkt <- makeFun( exp(-x*x)-x ~ x )

bisektion(fkt, 0, 1, minwidth = 1/1000)
