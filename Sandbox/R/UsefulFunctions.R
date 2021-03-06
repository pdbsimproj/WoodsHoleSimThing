#Add functions from your collection of useful bits and pieces here. They are roughly categorized and categories are
# separated by  #______________________________________________________
#Next step here is to try to get these formatted into R package notation


#_______________________________________________________________________________________________________________________
#For the simulator directly
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' Add error to a simulated process.
#'
#' @description The result of this function should be multiplied by your variable to add
#' log normal error to a value.
#' @param evar the log space variance in your error term
#'
#'
#'
#' @examples
#' FullF=c(0.2,0.22,0.25);F.error=0.2
#' Fapparent<-FullF*add.error(F.error)
#' print(data.frame("Full.F"=FullF,"FwithError"=Fapparent))
#'
#' @export

add.error<-function(evar){
  b.correct=(evar^2)/2 #correct the bias in logging the normal pars
  return(exp(rnorm(1,0,evar)-b.correct))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' Add autocorrelated error to a simulated process.
#'
#' add an autocorrelated error term to a value method from Deroba & Bence 2012.
#' the result of this function can now be used as the error term in add.error.ac
#' @param ac auto correlation coefficient
#' @param prev.err previous error e.g. result of a call to this function from a previous time step
#' @param evar the log space variance in your error term
get.error.ac<-function(ac,prev.err,evar){
  ac.err<-ac*prev.err+sqrt(1-ac^2)*rnorm(1,0,evar)
  return(ac.err)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' the result of this function should be multiplied by a variable to add
#' log normal error to a value
#' @param ac.err result of a call to get.error.ac
#' @param evar is the variance in your error term
#' @examples
#' new.ac<-get.error.ac(ac,old.ac,management.error)
#' old.ac<-new.ac   #keep track of the previous value for next time step
#' SSBapparent<-SSB*add.error.ac(new.ac,management.error)
add.error.ac<-function(ac.err,evar){
  b.correct=(evar^2)/2 #correct the bias in logging the normal pars
  return(exp(ac.err-b.correct))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






#_______________________________________________________________________________________________________________________
#Fisheries/Ecology functions (waiting for Liz and Chris on this one - because I am guessing they have better)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#'  Function to calculate generation times (mean age of parents for a given cohort)
#'  NOTE: use a very large max age to reduce bias in numerator
#'  Liz Brooks
#'  Version 1.0
#'  Created 22 November 2013
#'  Last Modified:
#' ------- Gen Time ----------------------------------
#' @param nages number of ages
#' @param fec.age fecundity at age
#' @param mat.age maturity at age
#' @param M.age natural mortality at age
#' @param F.mult F at fully selected ages
#' @param sel.age selectivity at age
#' @param spawn.time spawning time
gen.time<-function(nages,fec.age,mat.age,M.age, F.mult, sel.age, spawn.time ) {
gt=0.0
top=0.0
cum.survive=1.0
z=0.0
for (i in 1:(nages-1)  ) {
  z=M.age[i] + F.mult*sel.age[i]
  z.ts=(M.age[i]+F.mult*sel.age[i])*spawn.time
  top=top+cum.survive*i*fec.age[i]*mat.age[i]*exp(-z.ts)
  cum.survive=cum.survive*exp(-z )
  }
z= M.age[nages] + F.mult*sel.age[nages]
z.ts=(M.age[nages]+F.mult*sel.age[nages])*spawn.time
top=top + fec.age[nages]*mat.age[nages]*cum.survive*exp(-z.ts)/( 1- exp(-z ) )
bottom=0.0
cum.survive=1.0
z=0.0
for (i in 1:(nages-1)  ) {
  z=M.age[i] + F.mult*sel.age[i]
  z.ts=(M.age[i]+F.mult*sel.age[i])*spawn.time
  bottom=bottom+cum.survive*fec.age[i]*mat.age[i]*exp(-z.ts)
  cum.survive=cum.survive*exp(-z )
  }
  z= M.age[nages] + F.mult*sel.age[nages]
  z.ts=(M.age[nages]+F.mult*sel.age[nages])*spawn.time
  bottom=bottom + fec.age[nages]*mat.age[nages]*cum.survive*exp(-z.ts)/( 1- exp(-z ) )
  gt=top/bottom
  return(gt)
  }
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







#_______________________________________________________________________________________________________________________
#Math stuff
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' logit and inverse logit
logitx<-function(x){
  if(x>=1 | x<0) {
    return("MUST BE BETWEEN 0 & 1 FOOL!")
  } else {return(log((x/(1-x))))}
}
elogitx<-function(x){
  return((exp(x)/(1+exp(x))))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Bunch of simple operations that will work with NA somewhere in the vector
max2=function(x){max(x[!is.na(x)])}
min2=function(x){min(x[!is.na(x)])}
mean2<-function(x){return(mean(na.omit(x)))}
median2<-function(x){return(median(na.omit(x)))}
sd2<-function(x){return(sd(na.omit(x)))}
sum2=function(x){sum(x[!is.na(x)])}
standardize<-function(x){return((na.omit(x)-mean(na.omit(x)))/sd(na.omit(x)))}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
geomean<-function(x){exp(mean(log(x)))  }
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
geomean2 <- function(data) {
    log_data <- log(data)
    gm <- exp(mean(log_data[is.finite(log_data)]))  #to deal with 0's
    return(gm)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Hmean=function(x){1/mean(1/x)}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Hmean2=function(x){1/mean(1/x[is.finite(1/x)])} #deal with 0's
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' generate approximate confidence intervals based on lognormal variable x
#' @param ts is your data
#' @param cv its cv
#' @param bounds default=95 the width of your confidence intervals
asm.ci<-function(x,cv.x,bounds=95){
  s<-sqrt(log(1+cv.x^2))
  s<-ifelse(is.finite(s),s,0)
  p<-(1-(bounds/100))/2
  Z<-qnorm(p)
  lci<-x*exp(Z*(s))
  uci<-x*exp(-Z*(s))
  return(data.frame("lci"=lci,"uci"=uci))
}
#' gamma.ci
#' generate approximate confidence intervals based on gamma variable x
#' @param ts is your data
#' @param cv its cv
#' @param bounds default=95 the width of your confidence intervals
gamma.ci<-function(ts,cv,bounds=95){

  cv2<-(1/cv)^2
  scale=ts/cv2
  shape=ts/scale
  lp<-(1-(bounds/100))/2
  up<-1-lp
  LB=qgamma(p=lp,shape=shape,scale=scale)
  UB=qgamma(p=up,shape=shape,scale=scale)
  return(data.frame("lci"=LB,"uci"=UB))
}
#' normal.ci
#' generate approximate confidence intervals based on normal variable x
#' @param ts is your data
#' @param cv its cv
#' @param bounds default=95 the width of your confidence intervals
normal.ci<-function(x,cv.x,bounds=95){
  s<-cv.x*x
  s<-ifelse(is.finite(s),s,0)
  error <- qnorm((1-(bounds/100))/2)*s
  lci<-x+error
  uci<-x-error
  return(data.frame("lci"=lci,"uci"=uci))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# \reference{
#   [1]  T.H. Cormen, C.E. Leiserson, R.L. Rivest, Introduction to Algorithms,
#        The MIT Press, Massachusetts Institute of Technology, 1989.
# }
#
# \author{Henrik Bengtsson, hb at maths.lth.se with help from
#         Roger Koenker, roger at ysidro.econ.uiuc.edu}
#
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#'    Compute a weighted median of a numeric vector.
#' @param x a numeric vector containing the values whose weighted median is
#'            to be computed.
#' @param w a vector of weights the same length as x giving the
#' weights to use for each element of x. Default value is equal
#' weight to all values.
#' @param na.rm a logical value indicating whether NA values in
#'            x should be stripped before the computation proceeds.
#' @param ties a character string specifying how to solve ties between two
#'            x's that are satisfying the weighted median criteria.
#'            Note that at most two values can satisfy the criteria.
#'            When {ties} is {"min"}, the smaller value of the two
#'            is returned and when it is {"max"}, the larger value is
#'            returned.
#'            If {ties} is {"mean"}, the mean of the two values is
#'            returned and if it is {"both"}, both values are returned.
#'            Finally, if {ties} is {"weighted"} (or {NULL}) a
#'            weighted average of the two are returned, where the weights are
#'            weights of all values {x[i] <= x[k]} and {x[i] >= x[k]},
#'            respectively. Default value is {NULL}.
#'   Returns the weighted median.
weighted.median <- function(x, w, na.rm=TRUE, ties=NULL) {
  if (missing(w))
    w <- rep(1, length(x));

  # Remove values that are NA's
  if (na.rm == TRUE) {
    keep <- !(is.na(x) | is.na(w));
    x <- x[keep];
    w <- w[keep];
  } else if (any(is.na(x)))
    return(NA);

  # Assert that the weights are all non-negative.
  if (any(w < 0))
    stop("Some of the weights are negative; one can only have positive
weights.");

  # Remove values with weight zero. This will:
  #  1) take care of the case when all weights are zero,
  #  2) make sure that possible tied values are next to each others, and
  #  3) it will most likely speed up the sorting.
  n <- length(w);
  keep <- (w > 0);
  nkeep <- sum(keep);
  if (nkeep < n) {
    x <- x[keep];
    w <- w[keep];
    n <- nkeep;
  }

  # Are any weights Inf? Then treat them with equal weight and all others
  # with weight zero.
  wInfs <- is.infinite(w);
  if (any(wInfs)) {
    x <- x[wInfs];
    n <- length(x);
    w <- rep(1, n);
  }

  # Are there any values left to calculate the weighted median of?
  if (n == 0)
    return(NA);

  # Order the values and order the weights accordingly
  ord <- order(x);
  x <- x[ord];
  w <- w[ord];

  wcum <- cumsum(w);
  wsum <- wcum[n];
  wmid <- wsum / 2;

  # Find the position where the sum of the weights of the elements such that
  # x[i] < x[k] is less or equal than half the sum of all weights.
  # (these two lines could probably be optimized for speed).
  lows <- (wcum <= wmid);
  k  <- sum(lows);

  # Two special cases where all the weight are at the first or the
  # last value:
  if (k == 0) return(x[1]);
  if (k == n) return(x[n]);

  # At this point we know that:
  #  1) at most half the total weight is in the set x[1:k],
  #  2) that the set x[(k+2):n] contains less than half the total weight
  # The question is whether x[(k+1):n] contains *more* than
  # half the total weight (try x=c(1,2,3), w=c(1,1,1)). If it is then
  # we can be sure that x[k+1] is the weighted median we are looking
  # for, otherwise it is any function of x[k:(k+1)].

  wlow  <- wcum[k];    # the weight of x[1:k]
  whigh <- wsum - wlow;  # the weight of x[(k+1):n]
  if (whigh > wmid)
    return(x[k+1]);

  if (is.null(ties) || ties == "weighted") {  # Default!
    (wlow*x[k] + whigh*x[k+1]) / wsum;
  } else if (ties == "max") {
    x[k+1];
  } else if (ties == "min") {
    x[k];
  } else if (ties == "mean") {
    (x[k]+x[k+1])/2;
  } else if (ties == "both") {
    c(x[k], x[k+1]);
  }
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#' Calculate the variance of ratio x1/x2; where x1 and x2 are vectors of random
#' variables (x2>0)
#' @param x1 vector of values
#' @param x2 vector of values (x2>0)
var.ratio<-function(x1,x2){
  v.x1<-var(x1)
  v.x2<-var(x2)
  E.x1<-mean(x1)
  E.x2<-mean(x2)
  E2.x1<-mean(x1)^2
  E2.x2<-mean(x2)^2
  cov.x1x2<-cov(x1,x2)
  var.x1x2<-((E.x1/E.x2)^2)*((v.x1/E2.x1)+(v.x2/E2.x2)-((2*cov.x1x2)/(E.x1*E.x2)))
  return(var.x1x2)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#' Calculate the variance of ratio x1/x2; where x1 and x2 are vectors of random
#' variables (x2>0) with weights: w
#' @param x1 vector of values
#' @param x2 vector of values (x2>0)
#' w vector of weights
wt.var.ratio<-function(x1,x2,w){
  v.x1<-weighted.var(x1,w)
  v.x2<-weighted.var(x2,w)
  E.x1<-weighted.mean(x1,w)
  E.x2<-weighted.mean(x2,w)
  E2.x1<-mean(x1)^2
  E2.x2<-mean(x2)^2
  #print(data.frame(x1,x2))
  #print(w)
  cov.x1x2<-cov.wt(data.frame(standardize(x1),standardize(x2)),w)
  #print(cov.x1x2)
  var.x1x2<-((E.x1/E.x2)^2)*((v.x1/E2.x1)+(v.x2/E2.x2)-((2*cov.x1x2$cov[1,2])/(E.x1*E.x2)))
  return(var.x1x2)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#' Get a weighted variance
weighted.var <- function(x, w, na.rm = TRUE) {
    if (na.rm) {
        w <- w[i <- !is.na(x)]
        x <- x[i]
    }
    sum.w <- sum(w)
    sum.w2 <- sum(w^2)
    mean.w <- sum(x * w) / sum(w)
    (sum.w / (sum.w^2 - sum.w2)) * sum(w * (x - mean.w)^2, na.rm =na.rm)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#' Find the mode - Warning: this pretty slow...
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







#_______________________________________________________________________________________________________________________
#Manipulation of data structures
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' a function to make a vector out of a scaler and a matrix out of a vector.
#' A little ticky when you e.g. need to get 1000 years out
#' of a time varying vector - this will hold the last year's values constant for the remaining years
#' @param x the scaler or vector you want to expand
#' @param n number of rows
#' @param m number of cols
fill<-function(x,n,m){
  if(length(x)==1) x<-rep(x,m) #make a vector out of a constant
  if(is.matrix(x)==FALSE) return(matrix(rep(x,n),ncol=m,nrow=n,byrow=TRUE)) #make a matrix out of a vector
  if(dim(x)[1]<n) {
    return(rbind(x,matrix(rep(x[dim(x)[1],],(n-dim(x)[1])),ncol=m,nrow=(n-dim(x)[1]),byrow=TRUE)))
  }
  if(dim(x)[1]==n & dim(x)[2]==m) return(x)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' This function will replace NA's in
#' vector x with rep1 (0 is the default)
#' @param x the vector of interest
#' @param rep1 the thing you want to swap in for NA (0 is default)
na.replace<-function(x,rep1=0){
  return(ifelse(is.finite(x),x,0))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' find the index of the closest value to x in vec
closest<-function(vec,x){
  which(abs(vec-x)==min(abs(vec-x)))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' get the last value from a vector
last <- function(x) { tail(x, n = 1) }
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' check if a number is odd
is.odd<-function(x){
  val<-T
  if((abs(x) %% 2) < sqrt(.Machine$double.eps)){
     val<-F
   }
  return(val)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' get rid of factors in a data frame
#' @param dataframe self explanatory I hope
fac_to_string <- function(dataframe)
    {
        class.data  <- sapply(dataframe, class)
        factor.vars <- class.data[class.data == "factor"]
        for (colname in names(factor.vars))
        {
            dataframe[,colname] <- as.character(dataframe[,colname])
        }
        return (dataframe)
    }
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' Get rid of factors - in this case when you want nums instead
fac_to_num<-function(x){return(as.numeric(paste(x)))}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




#_______________________________________________________________________________________________________________________
#R utilities (debugging, manipulation of directories, etc...)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' useful for getting packages in functions
#' @param package1 duh
check.package=function(package1){
  if(suppressWarnings(require(package1,character.only=TRUE))){
    print(paste0(package1," is loaded correctly"))
  } else {
    print(paste0("trying to install ",package1))
    install.packages(package1,character.only=TRUE)
    if(require(package1,character.only=TRUE)){
      print(paste0(package1," installed and loaded"))
    } else {
      stop(paste0("could not install ", package1))
    }
  }}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#'  return the names of the objects (from a vector of list of
#'  names of objects) that are functions and have debug flag set
isdebugged_safe <- function(x,ns=NULL)  {
    g <- if (is.null(ns)) get(x) else getFromNamespace(x,ns)
    is.function(g) && isdebugged(g)
}

#' Debugging functions continued
which_debugged <- function(objnames,ns=NULL) {
    if (!length(objnames)) return(character(0))
    objnames[sapply(objnames,isdebugged_safe,ns=ns)]
}

#' Debugging functions continued
all_debugged <- function(where=search(), show_empty=FALSE) {
    ss <- setNames(lapply(where,function(x) {
        which_debugged(ls(x,all.names=TRUE))
        }),gsub("package:","",where))
    ## find attached namespaces
    ## (is there a better way to test whether a namespace exists with a given name??)
    ns <- unlist(sapply(gsub("package:","",where),
                 function(x) {
                     if (inherits({n <- try(getNamespace(x),silent=TRUE)},
                         "try-error")) NULL else x
                 }))
    ss_ns <- setNames(lapply(ns,function(x) {
        objects <- ls(getNamespace(x),all.names=TRUE)
        which_debugged(objects,ns=x)
        }),ns)
    if (!show_empty) {
        ss <- ss[sapply(ss,length)>0]
        ss_ns <- ss_ns[sapply(ss_ns,length)>0]
    }
    ## drop overlaps
    for (i in names(ss))
        ss_ns[[i]] <- setdiff(ss_ns[[i]],ss[[i]])
    list(env=ss,ns=ss_ns)
}

#' Debugging functions continued
undebug_all <- function(where=search()) {
    aa <- all_debugged(where)
    lapply(aa$env,undebug)
    ## now debug namespaces
    invisible(mapply(function(ns,fun) {
        undebug(getFromNamespace(fun,ns))
    },names(aa$ns),aa$ns))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' get a precise time flag from system time.
#' @examples myflag=getTimeFlag()
#' print(myflag)
getTimeFlag<-function(){tm<-paste(Sys.time());tm<-gsub("-","_",tm);tm<-gsub(":","",tm);tm<-gsub(" ","_",tm);return(tm)}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' Find (Find1) and replace with (Replace1) in all files (with extension - or containing - ext)
#' in directory (dnm) - this can be done recursively or not. You will by default also create backups
#' of any files that you alter, but you can turn that off with backup=F
#'               NOTE: Find1, Replace1 and ext all must be quoted strings!
#' @param dnm directory to look in
#' @param Find1 string to find
#' @param Replace1 string to use as replacement
#' @param ext default=NULL an extension, or part of the filename, that will identify the type of file to look in
#' @param recursive default=FALSE should the replacement be made to all files in subdirectories below dnm?
#' @param backup default=TRUE should a backup of the original be made? This will be stored in a directory called "Backup"
#'  located in the same directory as the file being manipulated.
#' @examples
#' dnm="/home/dhennen/Clam/Assessment Stuff/SS3/2016/runs/North/Explorations/TestReplaceFunc/"
#' Find1=" 3 31 14.1093 10.3 -1 3 1 # SR_LN(R0)"
#' Replace1=" 3 31 14.1093 10.3 -1 3 -1 # SR_LN(R0)"
#' ext=".ctl"
#' lineReplace(dnm,Find1,Replace1,ext)
lineReplace=function(dnm,Find1,Replace1,ext=NULL,recursive=F,backup=T){

  filenames=list.files(dnm,recursive=recursive)
  for( f in filenames ){
    if(!is.null(ext)){
      if(grepl(ext,x=f,fixed=T)){
        #Create a backup (if needed)
        if(backup){
          setwd(dnm)
          Sys.chmod(list.dirs("."), "774") #permissions needed to make the changes
          tmpdir=gsub(basename(paste0(dnm,"/",f)),"",paste0(dnm,"/",f),fixed=T)
          if(!dir.exists(paste0(tmpdir,"BackUp"))) dir.create(paste0(tmpdir,"BackUp")) #create backup directory
          file.copy(f,paste0(tmpdir,"BackUp/",basename(f)))
        }
        x <- readLines(f)
        y <- gsub(Find1,Replace1, x ,fixed=T)
        cat(y, file=f, sep="\n")
      }
    }
  }
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#' nd a block of text (Find1) and replace with another block (Replace1) in all files (with extension - ext or containing - ext)
#'  directory (dnm) - this can be done recursively or not. You will by default also create backups
#'  any files that you alter, but you can turn that off with backup=F
#'              NOTE: Find1, Replace1 and ext all must be quoted strings!
#' ***** WARNING: Watch out for automatic indentation - disble or use shift+tab to outdent!!!!!
blockReplace=function(dnm,Find1,Replace1,ext=NULL,recursive=F,backup=T){
  filenames=list.files(dnm,recursive=recursive)
  for( f in filenames ){
    if(!is.null(ext)){
      if(grepl(ext,x=f,fixed=T)){
        #Create a backup (if needed)
        if(backup){
          setwd(dnm)
          Sys.chmod(list.dirs("."), "774") #permissions needed to make the changes
          tmpdir=gsub(basename(paste0(dnm,"/",f)),"",paste0(dnm,"/",f),fixed=T)
          if(!dir.exists(paste0(tmpdir,"BackUp"))) dir.create(paste0(tmpdir,"BackUp")) #create backup directory
          file.copy(f,paste0(tmpdir,"BackUp/",basename(f)))
        }
        x=readChar(f, file.info(f)$size)
        #x <- readLines(f)
        y <- gsub(Find1,Replace1, x ,fixed=T)
        cat(y, file=f, sep="\n")
      }
    }
  }
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







#_______________________________________________________________________________________________________________________
#related to plotting
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#'  adjust window size regardless of platform
#' @param Width default=10 inches
#' @param Height default=10 inches
#' @param xpinch pixels per inch default=20
#' @param ypinch pixels per inch default=30
resize.win <- function(Width=10, Height=10, xpinch=20, ypinch=30)
{
  if(length(dev.list())>0) {dev.off()}
  platform <- sessionInfo()$platform
  if (grepl("linux",platform)) {
	x11(width=Width, height=Height)
  } else if (grepl("pc",platform) | grepl("windows",platform,ignore.case = T) ) {
	windows(width=Width, height=Height)
  } else if (grepl("apple", platform)) {
      quartz(width=Width, height=Height)
  }
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#'  make error bars on a plot
#'  @param x vector of x values
#'  @param y vector of y values
#'  @param upper distance (in units of y) to draw the upper error bar
#'  @param lower (default=upper)  distance (in units of y) to draw the lower error bar
#'  @param length length of cross bars at error bar ends
#'  @param col1 color of error bars
#'  @param ... other plot parameters
error.bar <- function(x, y, upper, lower=upper, length=0.1,col1="black",...){
    if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
    arrows(x
      ,y+upper
      ,x
      ,y-lower
      ,angle=90
      ,code=3
      ,length=length
      ,col=col1
      , ...)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#' plot nothing but string in the middle of the plotting region - a useful
#' placeholder for automated plotting loops
#' @param string quoted string you want displyed at the center of the blank plot
blank.plot<-function(string){
  plot(x=c(0,1),y=c(0,1)
    ,main=""
    ,axes=F
    ,ylab=""
    ,xlab=""
    ,col="white"
  )
  text(x=0.5,y=0.5
    ,labels=string
    ,cex=2.
  )
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#' Plot and conrast two correlated overlapping lognormal distributions, will make
#' a plot and return the probability of exceeding the threshold ie overfishing
#' or overfished status
#' @param mu default=NULL vector of means of the two distributions one for the estimate, one
#' for the reference point (given in real space, not logged)
#' @param cv1 default=NULL vector of cv's
#' @param cor1 default=NULL correlation of the two above
#' @param aname default=NULL  name for the a marginal distribution A[,1] - will go in legend
#' @param bname default=NULL  name for the b marginal distribution A[,2] - will go in legend
#' @param colors=c("blue","red","purple")  colors for each marginal distribution and the
#overalp between them
#' @param b1=1000 the number of breaks in the plot of the historgram of a and b
#' @param xlim default=NULL predefined limits (if you want to restrict your plot)
#' @param ylim default=NULL
#' @param xlab default=NULL other plotting info
#' @param ylab default=NULL
#' @param main default=NULL
#' @param sub1  default=NULL  subtext for plot
#' @param put.legend="topright" where should the legend go?
#' @param status.test="overfishing"  could be "overfished"
#' @examples   plot.correlated.status.check(mu=c(1000,500)
#'                   ,cv1=c(0.22,0.18)
#'                   ,cor1=0.9
#'                   ,aname="B2011"
#'                   ,bname="Threshold"
#'                   ,status.test="overfished"
#'                  )
plot.correlated.status.check <- function(
  #_____________________________________________________________________________
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  #Plot and conrast two correlated overlapping lognormal distributions, will make
  #a plot and return the probability of exceeding the threshold ie overfishing
  #or overfished status
  mu=NULL #vector of means of the two distributions one for the estimate, one
  #for the reference point (given in real space, not logged)
  ,cv1=NULL #vector of cv's
  ,cor1=NULL #correlation of the two above
  ,aname=NULL  #name for the a marginal distribution A[,1] - will go in legend
  ,bname=NULL  #name for the b marginal distribution A[,2] - will go in legend
  ,colors=c("blue","red","purple")  #colors for each marginal distribution and the
  #overalp between them
  ,b1=1000 #the number of breaks in the plot of the historgram of a and b
  ,xlim=NULL #predefined limits (if you want to restrict your plot)
  ,ylim=NULL
  ,xlab=NULL #other plotting info
  ,ylab=NULL
  ,main=NULL
  ,sub1=NULL  #subtext for plot
  ,put.legend="topright" #where should the legend go?
  ,status.test="overfishing"  #could be "overfished"
  ) {                       #DRH 2/5/13
  #library(MASS)
  #covariance = cor1*(var1*var2)
  dx1<-std.lnorm(mu[1],cv1[1])
  dx2<-std.lnorm(mu[2],cv1[2])
  var1<-dx1[,2]^2
  var2<-dx2[,2]^2
  Sigma<-matrix(c(var1,rep(cor1*(dx1[,2]*dx2[,2]),2),var2),2,2)
  n<-10000000  #one million iterations ought to be enough!
  #check
  #Sigma = var(mvrnorm(n,mu,Sigma))
  if(cv1[1]>0 & cv1[2]>0 ) {A<-MASS::mvrnorm(n,c(dx1[,1],dx2[,1]),Sigma)}
  a<-logify(A[,1])
  b<-logify(A[,2])

  #clear arrays and make hist objects
  ahist=NULL
  bhist=NULL
  ahist=hist(a,breaks=b1,plot=F)
  bhist=hist(b,breaks=b1,plot=F)
  #some jerking around to ge the histograms on the same scale...
  dist1 = ahist$breaks[2]-ahist$breaks[1]
  br1 = seq((min(ahist$breaks,bhist$breaks)-dist1)
      ,(max(ahist$breaks,bhist$breaks)+dist1),dist1)
  bhist=hist(b,breaks=br1,plot=F)
  ahist=hist(a,breaks=br1,plot=F)

  #rescaling the density portion of the histogram to force sum(density)=1
  ahist$density<-ahist$density/sum(ahist$density)
  bhist$density<-bhist$density/sum(bhist$density)

  if(status.test=="overfished") p<-length(a[a<=b]) #instances of overfishing only need to compare accross
  if(status.test=="overfishing") p<-length(a[a>=b])
  p2<-p/length(a)    #rows because each row is one draw from the correlated dists

  if(is.null(xlim)){
    xlim = c(min(ahist$breaks,bhist$breaks),max(ahist$breaks,bhist$breaks))
  }
  if(is.null(ylim)){
    ylim = c(0,max(c(ahist$density,bhist$density)))
  }
  overlap = ahist
  #the area of overlap is easily defined by taking advantage of the hist properties
  #Note: the approximation to true overlap (based on integrals) degrades as b1 gets small
  #200 seems more or less adequate for most functions, but there is no reason to skimp!
  for(i in 1:length(overlap$density)){
    if(ahist$density[i] > 0 & bhist$density[i] > 0){
      overlap$density[i] = min(ahist$density[i],bhist$density[i])
    } else {
      overlap$density[i] = 0
    }
  }
  if(is.null(main)) p1<-paste("P[",status.test,"]~",round(p2,3),sep="")
  if(!(is.null(main))) p1<-main
  print(paste("P[overlap]~",round(sum(overlap$density),3),sep=""))
  print(paste("P[",status.test,"]~",round(p2,5),sep=""))
  par(cex.main=3)
  plot(ahist
    ,freq=F
    ,xlim=xlim
    ,ylim=ylim
    ,col=colors[1]
    ,xlab=xlab
    ,ylab=ylab
    ,main=p1
    ,sub=sub1
    ,border="transparent"
  )
  plot(bhist
    ,freq=F
    ,xlim=xlim
    ,ylim=ylim
    ,col=colors[2]
    ,add=T
    ,border="transparent"
  )
  plot(overlap
    ,freq=F
    ,xlim=xlim
    ,ylim=ylim
    ,col=colors[3]
    ,add=T
    ,border="transparent"
  )
  if(!(is.null(aname)&is.null(bname))){
      leg1<-legend(x=put.legend
      ,legend=(c(aname,bname,"Overlap") )
      ,fill=colors
      ,bty="n"
      ,cex=2
    )
  }
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#' Convert a named color to a transparent equivalent
#' @param col is the color
#' @param deg is the amount of transparency desired from 1 (almost invisible)
#' to 100 (opaque).
#' @examples transparent("blue",50) #50% transparent blue
transparent<-function(col,deg){
  #col is the color, deg is the amount of transparency desired from 1 (almost invisible)
  #to 100 (opaque).
  #rescale deg to rgb (1:255)
  deg<-(deg/100)*255
  return(rgb(red=col2rgb(col)[1,1],green=col2rgb(col)[2,1],blue=col2rgb(col)[3,1],alpha=deg
      ,maxColorValue=255))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#' convert a color from names "col" to a hexadecimal representation
col2hex<-function(col){
  return(rgb(t(col2rgb(col))/255))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#'  modification by Ian Taylor of the filled.contour function
#' to remove the key and facilitate overplotting with contour()
#'  further modified by Carey McGilliard and Bridget Ferris
#'  to allow multiple plots on one page
filled.contour3 <-
  function (x = seq(0, 1, length.out = nrow(z)),
            y = seq(0, 1, length.out = ncol(z)), z, xlim = range(x, finite = TRUE),
            ylim = range(y, finite = TRUE), zlim = range(z, finite = TRUE),
            levels = pretty(zlim, nlevels), nlevels = 20, color.palette = cm.colors,
            col = color.palette(length(levels) - 1), plot.title, plot.axes,
            key.title, key.axes, asp = NA, xaxs = "i", yaxs = "i", las = 1,
            axes = TRUE, frame.plot = axes,mar, ...)
{

  # http://wiki.cbr.washington.edu/qerm/index.php/R/Contour_Plots
  if (missing(z)) {
    if (!missing(x)) {
      if (is.list(x)) {
        z <- x$z
        y <- x$y
        x <- x$x
      }
      else {
        z <- x
        x <- seq.int(0, 1, length.out = nrow(z))
      }
    }
    else stop("no 'z' matrix specified")
  }
  else if (is.list(x)) {
    y <- x$y
    x <- x$x
  }
  if (any(diff(x) <= 0) || any(diff(y) <= 0))
    stop("increasing 'x' and 'y' values expected")
 # mar.orig <- (par.orig <- par(c("mar", "las", "mfrow")))$mar
 # on.exit(par(par.orig))
 # w <- (3 + mar.orig[2]) * par("csi") * 2.54
 # par(las = las)
 # mar <- mar.orig
 plot.new()
 # par(mar=mar)
  plot.window(xlim, ylim, "", xaxs = xaxs, yaxs = yaxs, asp = asp)
  if (!is.matrix(z) || nrow(z) <= 1 || ncol(z) <= 1)
    stop("no proper 'z' matrix specified")
  if (!is.double(z))
    storage.mode(z) <- "double"
# RV - 10-03-2012
# note replacement of .Internal(filledcontour(as.double(x),...)
# with .filled.contour() as of R-2.15.0
  .filled.contour(as.double(x), as.double(y), z, as.double(levels),
                          col = col)



  if (missing(plot.axes)) {
    if (axes) {
      title(main = "", xlab = "", ylab = "")
      Axis(x, side = 1)
      Axis(y, side = 2)
    }
  }
  else plot.axes
  if (frame.plot)
    box()
  if (missing(plot.title))
    title(...)
  else plot.title
  invisible()
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#'  modification of filled.contour by Carey McGilliard and Bridget Ferris
#' designed to just plot the legend
filled.legend <-
  function (x = seq(0, 1, length.out = nrow(z)), y = seq(0, 1,
    length.out = ncol(z)), z, xlim = range(x, finite = TRUE),
    ylim = range(y, finite = TRUE), zlim = range(z, finite = TRUE),
    levels = pretty(zlim, nlevels), nlevels = 20, color.palette = cm.colors,
    col = color.palette(length(levels) - 1), plot.title, plot.axes,
    key.title, key.axes, asp = NA, xaxs = "i", yaxs = "i", las = 1,
    axes = TRUE, frame.plot = axes, ...)
{
    if (missing(z)) {
        if (!missing(x)) {
            if (is.list(x)) {
                z <- x$z
                y <- x$y
                x <- x$x
            }
            else {
                z <- x
                x <- seq.int(0, 1, length.out = nrow(z))
            }
        }
        else stop("no 'z' matrix specified")
    }
    else if (is.list(x)) {
        y <- x$y
        x <- x$x
    }
    if (any(diff(x) <= 0) || any(diff(y) <= 0))
        stop("increasing 'x' and 'y' values expected")
  #  mar.orig <- (par.orig <- par(c("mar", "las", "mfrow")))$mar
  #  on.exit(par(par.orig))
  #  w <- (3 + mar.orig[2L]) * par("csi") * 2.54
    #layout(matrix(c(2, 1), ncol = 2L), widths = c(1, lcm(w)))
  #  par(las = las)
  #  mar <- mar.orig
  #  mar[4L] <- mar[2L]
  #  mar[2L] <- 1
  #  par(mar = mar)
   # plot.new()
    plot.window(xlim = c(0, 1), ylim = range(levels), xaxs = "i",
        yaxs = "i")
    rect(0, levels[-length(levels)], 1, levels[-1L], col = col)
    if (missing(key.axes)) {
        if (axes)
            axis(4)
    }
    else key.axes
    box()
}
    #
#    if (!missing(key.title))
#        key.title
#    mar <- mar.orig
#    mar[4L] <- 1
#    par(mar = mar)
#    plot.new()
#    plot.window(xlim, ylim, "", xaxs = xaxs, yaxs = yaxs, asp = asp)
#    if (!is.matrix(z) || nrow(z) <= 1L || ncol(z) <= 1L)
#        stop("no proper 'z' matrix specified")
#    if (!is.double(z))
#        storage.mode(z) <- "double"
#    .Internal(filledcontour(as.double(x), as.double(y), z, as.double(levels),
#        col = col))
#    if (missing(plot.axes)) {
#        if (axes) {
#            title(main = "", xlab = "", ylab = "")
#            Axis(x, side = 1)
#            Axis(y, side = 2)
#        }
#    }
#    else plot.axes
#    if (frame.plot)
#        box()
#    if (missing(plot.title))
#        title(...)
#    else plot.title
#    invisible()
#}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#' Put a letter in a plot (used for labeling a panel in a group of several plots)
#' @param a default="A" the letter to put
#' @param where default="topleft"
#' @param cex default=2
MakeLetter <- function(a="A", where="topleft", cex=2)
     legend(where, pt.cex=0, bty="n", title=a, cex=cex, legend=NA)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



