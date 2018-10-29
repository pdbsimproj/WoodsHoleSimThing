
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

source("UsefulFunctions.R")

library(testthat)

context("Testing Simulation Functions")

test_that("add error is finite and numeric", {
    evar=0.2
    
    expect_that(add.error(evar), is_a("numeric"))      
    expect_that(!is.na(add.error(evar)), is_true())  
})

test_that("add error returns 0, if evar = 0", {
  evar=0.
  expect_that(log(add.error(evar)), equals(0))      
})

test_that("get auto correlated error is finite and numeric", {
  ac=0.5;prev.err=1.1;evar=0.2
  
  expect_that(get.error.ac(ac,prev.err,evar), is_a("numeric"))      
  expect_that(!is.na(get.error.ac(ac,prev.err,evar)), is_true())  
})

test_that("add auto correlated error is finite and numeric", {
  ac.err=0.3;evar=0.2
  
  expect_that(add.error.ac(ac.err,evar), is_a("numeric"))      
  expect_that(!is.na(add.error.ac(ac.err,evar)), is_true())  
})
