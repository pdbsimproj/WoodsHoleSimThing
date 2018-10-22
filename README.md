# WoodsHoleSimThing
USES
1.       Assessment Model Testing
2.       Sampling Request Testing
3.       Spatial Dynamics
4.       MSE Capability
5.       HCR
6.       PDT – Risk Policy Development
7.       Ensemble
8.       Testing Environmental Drivers
 
 
FEATURES / INPUTS
1.       Separate specification of observation and process error
2.       Take existing ASAP run and use that to parameterize the simulator
3.       Recruitment pattern, F patter, (other) that include user-defined inputs
4.       Variety of error distribution choices
5.       Adding bias in various components
6.       Sex-specificity
7.       Sex-changing
8.       Define Time step (annual, season, monthly, etc.)
 
OUTPUTS
1.       Summary of specifications (nsims, seed, time, date, all entries passed to functions)
2.       Structure with true values to easily facilitate comparison with EMs
3.       Initial plots to illustrate simulation specs – make sure it’s what you wanted
4.       Shiny front end for some simple set-up and feedback about function options?
 
PROJECT MANAGEMENT / DOCUMENTATION
1.       Roxygen – defining inputs/outputs
2.       Rmarkdown – defining workflow
3.       Data Dictionary – to define object time, dimension, name, etc.
4.       Check out the test feature in Github (to see what happens if a modification breaks existing code
5.       ***Create GitHub account with fake email address (or could we make a “group” email address like simulators@noaa.gov)?
 

Dan's much worse version:
Project Notes 10/19/18:
The idea here is to create a population simulation engine that can feed ASAP/SAM/VPA assessment models seemlessly. We intend to build using modular design to facilitate group coding. 

Goals (things to think about while building):

Power analysis of survey sampling: Sampling request tool.

How should error be incorporated - build in flexibility.

How should we incorpate bias?

Read in ASAP file to establish starting conditions?

Risk policy analysis? Control rules? 

Documentation maybe via Roxygen (should be done as coding occurs)

Think about data structures.

Functions should be as general as possible so they can be used in other projects. 

Spatial components may be added later so think about how that might be done.

Same for sexes.

Look at Github testing - should probably use this before pushing things up.

What outputs do we need?

