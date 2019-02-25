# Variable Names and definitions, loosely arranged by code layout

### Flags for intended use (default position is F)
+ testAssmtModel - test performance of assessment model (T) or not (F) [logical]
+ testSampling - create data to test sampling (T) or not (F)  [logical]
+ spatialOM - single spatial unit (T) or multiple spatial units (F)  [logical]
+ testMSE - perform MSE testing (T) or not (F)  [logical]
+ testHCR - perform HCR testing T) or not (F)  [logical]
+ testRisk - perform testing for risk policy (T) or not (F)  [logical]
+ testEnsemble - perform model ensemble testing (T) or not (F)  [logical]
+ testEnvDriver - test inclusion of environmental drivers (T) or not (F)  [logical]

### Set-up
+ rSeed - random number seed [integer]
+ runName - prefix to pre-pend to output files [character]
+ runNote - text string that describes run, will be included in list output [character]

### Dimension-related variables
+ nSims - number of simulated data sets  [integer]
+ nYearsOM - number of years simulated by OM [integer] (depending on flags checked above, we could have nYearsEM, etc..)
+ nAgesOM - number of ages simulated by OM [integer]
+ nInd - number of indices [integer]
+ nFleet - number of fishing fleets [integer]
+ nArea - number of areas [integer]; should have *dependency* if spatialOM==T (default nArea=1)


### Biology (depending on where process error is added, these could have another dimension of nSims)
+ natM - natural mortality [array: nYearsOM x nAgesOM]
+ vonB - von Bertalanffy parameters [array: nYearsOM x 3] (default is all years equal)
+ lenWgt - length weight relationship [array: nYearsOM x 2] (default is all years equal)
+ matAge - maturity at age [array: nYearsOM x nAgesOM]
+ spawnTime - fraction of year elapsed prior to spawning [array: nYearsOM] (default is all years equal)
+ typeSR - stock recruit function to be used [char: BevHolt, Ricker, Hockey, Geomean, etc]
+ parSR - parameters for stock recruit function [array: depends on typeSR]

### Units (is this necessary? maybe just for figure captions and table headers?)
+ 

### Population
+ numAge - numbers of individuals at age on January 1 [array: nYearsOM x nAgesOM x nSims]
+ ssb - spawning stock biomass at age calculated at spawnTime [array: nYearsOM x nSims]
+ jan1B - population biomass calculatee on January 1 [array: nYearsOM x nSims]
+ expB - exploitable biomass calculated on January 1 [array: nYearsOM x nSims]

### Fishery
+ catchAge - numbers of individuals caught at age each year [array: nYearsOM x nAgesOm x nSims]
+ totCatchN - total number of individuals caught each year [array: nYearsOM x nSims]
+ totCatchB - total biomass of individuals caught each year [array: nYearsOM x nSims]
+ catchWgt - average weight at age in the catch [array: nYearsOM x nAgesOM x nSims]
+ fishSel - fishery selectivity at age [array:nYearsOM x nAgesOM X nFleet x nSims]
+ fishSelParms - parameters to define fishery selectivity [array: ]
+ fishTime - time of year when fishery operates [array: nYearsOM x 2 x nFleet] (2 to define start and end timing of each fleet, as an integer month)
+ fleetF - fishery-specific F multiplier, which multiplies fishSel to get fishery-specific FAA

### Indices

### Observation Error


### Process Error


### Reference Points


### Management Quantities


### Forecasted Quantities
