library(dplyr)
g0 = pajaki_nzal %>% filter(grupa == 0)
g1 = pajaki_nzal %>% filter(grupa == 1)
# Renaming a field with non-ASCII characters
names(pajaki_nzal)[names(pajaki_nzal) == "l\u0119k"] <- "lek"
# Count the number of samples
pajaki_nzal %>% group_by(grupa) %>% tally()
# Chi-square test
pajaki_nzal %>% group_by(grupa) %>% summarise(chi = chisq.test(samoocena, lek)$p.value)
# Histogram of lek values
pajaki_nzal %>% filter(grupa == 0) %>% with(hist(lek))
# Shapiro-Wilk test; if p-value < 0.05 then NOT normal distribution
shapiro.test(g0$lek)
#   Shapiro-Wilk normality test
#
# data:  g0$lek
# W = 0.95058, p-value = 0.6454
shapiro.test(g1$lek)
#   Shapiro-Wilk normality test
#
# data:  g1$lek
# W = 0.93588, p-value = 0.4466
# student-t test - compares two means
# * d > 0.2 => weak effect
# * d > 0.5 => medium effect
# * d > 0.8 => strong effect
t.test(g0$lek, g1$lek)
#    Welch Two Sample t-test
#
# data:  g0$lek and g1$lek
# t = -2.5384, df = 19.604, p-value = 0.01975
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -18.987907  -1.845427
# sample estimates:
# mean of x mean of y 
#  39.58333  50.00000
# student-t test for paired variables
t.test(terapia$przed, terapia$po, paired=TRUE)
#    Paired t-test
#
# data:  terapia$przed and terapia$po
# t = -0.39765, df = 24, p-value = 0.6944
# alternative hypothesis: true mean difference is not equal to 0
# 95 percent confidence interval:
#  -0.7428279  0.5028279
# sample estimates:
# mean difference 
#           -0.12
