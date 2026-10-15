## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----impute, eval = FALSE-----------------------------------------------------
# library(glemb)
# library(rio)
# library(dplyr)
# library(mice)
# library(knitr)
# 
# nlsy <- rio::import("https://statisticalhorizons.com/wp-content/uploads/2022/01/nlsymiss.dta")
# 
# nlsy <- nlsy %>%
#   select(pov, race, momwork, divorce, gender, self, anti)
# 
# imp <- glemb(nlsy, m = 50,
#              noms = c(pov, race, momwork, divorce, gender),
#              seed = 456)

## ----analyse, eval = FALSE----------------------------------------------------
# fit <- with(imp, lm(anti ~ pov + race + momwork + divorce + gender + self))
# 
# kable(summary(mice::pool(fit)), digits = 3)

## ----results, echo = FALSE----------------------------------------------------
results <- data.frame(
  term      = c("(Intercept)", "pov1", "race2", "race3", "momwork1",
                "divorce1", "gender1", "self"),
  estimate  = c( 3.050,  0.629,  0.077, -0.354,  0.221, -0.090, -0.563, -0.070),
  std.error = c( 0.456,  0.168,  0.159,  0.164,  0.141,  0.147,  0.118,  0.021),
  statistic = c( 6.686,  3.736,  0.483, -2.157,  1.562, -0.614, -4.767, -3.356),
  df        = c(371.157, 191.940, 316.242, 390.862, 343.093, 514.252, 541.983, 378.792),
  p.value   = c( 0.000,  0.000,  0.630,  0.032,  0.119,  0.540,  0.000,  0.001)
)
knitr::kable(results, digits = 3)

