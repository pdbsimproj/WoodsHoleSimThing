# Variable Names and definitions, loosely arranged by code layout

### Flags for intended use (default position is F)
+ testAssmtModel - test performance of assessment model (T) or not (F) [boolean]
+ testSampling - create data to test sampling (T) or not (F)  [boolean]
+ spatialOM - single spatial unit (T) or multiple spatial units (F)  [boolean]
+ testMSE - perform MSE testing (T) or not (F)  [boolean]
+ testHCR - perform HCR testing T) or not (F)  [boolean]
+ testRisk - perform testing for risk policy (T) or not (F)  [boolean]
+ testEnsemble - perform model ensemble testing (T) or not (F)  [boolean]
+ testEnvDriver - test inclusion of environmental drivers (T) or not (F)  [boolean]

### Dimension-related variables
+ nSims - number of simulated data sets  [integer]
+ nYearsOM - number of years simulated by OM [integer] (depending on flags checked above, we could have nYearsEM, etc..)
+ nAgesOM - number of ages simulated by OM [integer]


### Biology (depending on where process error is added, these could have another dimension of nSims)
+ natM - natural mortality [array: nYearsOM x nAgesOM]
+ vonB - von Bertalanffy parameters [array: nYearsOM x 3] (default is all years equal)
+ matAge - maturity at age [array: nYearsOM x nAgesOM]
+ typeSR - stock recruit function to be used [char: BevHolt, Ricker, Hockey, Geomean, etc]
+ parSR - parameters for stock recruit function [array: depends on typeSR]

