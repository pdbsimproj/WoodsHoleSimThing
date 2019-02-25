# Variable Names and definitions, loosely arranged by code layout

## Naming Rules
+ omit 's' to make variables plural (e.g., nSim instead of nSims; nYear instead of nYears)

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
+ nSim - number of simulated data sets  [integer]
+ nYearOM - number of years simulated by OM [integer] (depending on flags checked above, we could have nYearsEM, etc..)
+ nAgeOM - number of ages simulated by OM [integer]
+ nInd - number of indices [integer]
+ nFleet - number of fishing fleets [integer]
+ nArea - number of areas [integer]; should have *dependency* if spatialOM==T (default nArea=1)


### Biology (depending on where process error is added, these could have another dimension of nSims)
+ natM - natural mortality [array: nYearOM x nAgeOM]
+ vonB - von Bertalanffy parameters [array: nYearOM x 3] (default is all years equal)
+ lenWgt - length weight relationship [array: nYearOM x 2] (default is all years equal)
+ matAge - maturity at age [array: nYearOM x nAgeOM]
+ spawnTime - fraction of year elapsed prior to spawning [array: nYearOM] (default is all years equal)
+ typeSR - stock recruit function to be used [char: BevHolt, Ricker, Hockey, Geomean, etc]
+ parSR - parameters for stock recruit function [array: depends on typeSR]

### Units (is this necessary? maybe just for figure captions and table headers?)
+ 

### Population
+ numAge - numbers of individuals at age on January 1 [array: nYearOM x nAgeOM x nSim]
+ ssb - spawning stock biomass at age calculated at spawnTime [array: nYearOM x nSim]
+ jan1B - population biomass calculatee on January 1 [array: nYearOM x nSim]
+ expB - exploitable biomass calculated on January 1 [array: nYearOM x nSim]

### Fishery
+ catchAge - numbers of individuals caught at age each year [array: nYearOM x nAgeOm x nSim]
+ totCatchN - total number of individuals caught each year [array: nYearOM x nSim]
+ totCatchB - total biomass of individuals caught each year [array: nYearOM x nSim]
+ catchWgt - average weight at age in the catch [array: nYearOM x nAgeOM x nSim]
+ fishSel - fishery selectivity at age [array:nYearOM x nAgeOM X nFleet x nSim]
+ fishSelParms - parameters to define fishery selectivity [array: ]
+ fishTime - time of year when fishery operates [array: nYearOM x 2 x nFleet] (2 to define start and end timing of each fleet, as an integer month)
+ fleetF - fishery-specific F multiplier, which multiplies fishSel to get fishery-specific FAA

### Indices

### Observation Error


### Process Error


### Reference Points


### Management Quantities


### Forecasted Quantities
