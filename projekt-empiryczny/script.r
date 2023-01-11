library(broom)
library(modeest)
library(psych)
library(qtl2)
library(tidyverse)

data <- read.csv("~/Workspace/swps/projekt-empiryczny/results.csv")

# Mode: 0 for total_met, 2 for the rest
sapply(data, mfv)
# past_negative     past_positive  present_fatalism  present_hedonism            future physical_activity         total_met
#             2                 2                 2                 2                 2                 2                 0

# Variance
sapply(data, var)
# past_negative     past_positive  present_fatalism  present_hedonism            future physical_activity         total_met
#  2.158945e-01      1.936133e-01      1.350547e-01      5.115830e-02      1.361004e-01      2.386583e-01      7.563408e+05

# Other stats
describe(data)
#                     n   mean     sd median min  max range  skew kurtosis
# past_negative     112   2.02   0.46   2.00   1    3     2  0.06     1.58
# past_positive     112   2.12   0.44   2.00   1    3     2  0.56     1.47
# present_fatalism  112   1.87   0.37   2.00   1    3     2 -1.57     2.23
# present_hedonism  112   2.05   0.23   2.00   2    3     1  3.91    13.43
# future            112   2.16   0.37   2.00   2    3     1  1.82     1.34
# physical_activity 112   1.76   0.49   2.00   1    3     2 -0.48    -0.28
# total_met         112 884.44 869.68 712.25   0 4632  4632  1.81     4.18

# The distribution is not normal for any of the variables
sapply(data, shapiro.test)
#           past_negative                 past_positive
# statistic 0.6350252                     0.5967484
# p.value   2.776535e-15                  4.628918e-16
#
#           present_fatalism              present_hedonism
# statistic 0.4681387                     0.2348901
# p.value   2.481654e-18                  1.455443e-21
#
#           future                        physical_activity
# statistic 0.4412821                     0.6482576
# p.value   9.407982e-19                  5.323708e-15
#
#           total_met
# statistic 0.8319927
# p.value   5.934688e-10

# Chi squared test for independence
# - past_negative:
#   - present_fatalism: OK
#   - future: OK
#   - other: NOK
# - past_positive:
#   - physical_activity: OK
#   - other: NOK
# - present_fatalism:
#   - past_negative: OK
#   - other: NOK
# - present_hedonism: NOK
# - future:
#   - past_negative: OK
#   - other: NOK
# - physical_activity:
#   - past_positive: OK
#   - other: NOK
# https://pastebin.com/MXDrvzS0
#                   past_negative past_positive present_fatalism present_hedonism     future physical_activity
# past_negative                NA     0.3872834     4.660089e-07        0.6768017 0.01738453       0.513059122
# past_positive      3.872834e-01            NA     9.729041e-01        0.4517884 0.23133982       0.015222304
# present_fatalism   4.660089e-07     0.9729041               NA        0.5670945 0.18959610       0.906860522
# present_hedonism   6.768017e-01     0.4517884     5.670945e-01               NA 1.00000000       0.867303258
# future             1.738453e-02     0.2313398     1.895961e-01        1.0000000         NA       0.657664630
# physical_activity  5.130591e-01     0.0152223     9.068605e-01        0.8673033 0.65766463                NA

cor.test(data$past_negative, source$physical_activity, method="spearman")
# -0.07191542 
cor.test(data$past_positive, source$physical_activity, method="spearman")
# 0.1883779
cor.test(data$present_fatalism, source$physical_activity, method="spearman")
# 0.01313418
cor.test(data$present_hedonism, source$physical_activity, method="spearman")
# -0.04327044
cor.test(data$future, source$physical_activity, method="spearman")
# 0.06253247

# t-test for dependent samples
t.test(data$total_met, data$past_negative_raw, paired = TRUE)
# Skip past_positive_raw, because it's not normally distributed
t.test(data$total_met, data$present_fatalism_raw, paired = TRUE)
t.test(data$total_met, data$present_hedonism_raw, paired = TRUE)
# Skip future_raw, because it's not normally distributed

# Correlation quantitative
cor.test(data$total_met, data$past_negative_raw, method="pearson")
cor.test(data$total_met, data$past_positive_raw, method="pearson")
cor.test(data$total_met, data$present_fatalism_raw, method="pearson")
cor.test(data$total_met, data$present_hedonism_raw, method="pearson")
cor.test(data$total_met, data$future_raw, method="pearson")
