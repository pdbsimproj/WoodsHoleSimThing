# Variable Names and definitions, loosely arranged by code layout

### Flags for intended use (default position is F)
testAssmtModel - test performance of assessment model (T) or not (F) [boolean]
testSampling - create data to test sampling (T) or not (F)  [boolean]
spatialOM - single spatial unit (T) or multiple spatial units (F)  [boolean]
testMSE - perform MSE testing (T) or not (F)  [boolean]
testHCR - perform HCR testing T) or not (F)  [boolean]
testRisk - perform testing for risk policy (T) or not (F)  [boolean]
testEnsemble - perform model ensemble testing (T) or not (F)  [boolean]
testEnvDriver - test inclusion of environmental drivers (T) or not (F)  [boolean]

### Dimension-related variables
nSims - number of simulated data sets  [integer]
nYearsOM - number of years simulated by OM [integer] (depending on flags checked above, we could have nYearsEM, etc..)
nAgesOM - number of ages simulated by OM [integer]


### Biology
natM - natural mortality [array: nYearsOM x nAgesOM]
