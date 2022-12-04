## Loading
library(haven)
instagram_pd3 <- read_sav("instagram_pd3.sav")
names(instagram_pd3)[names(instagram_pd3) == "liczba_post\u00f3w_miesi\u0119czna"] <- "liczba_postow_miesieczna"
names(instagram_pd3)[names(instagram_pd3) == "obserwuj\u0105cy_instagram"] <- "obserwujacy_instagram"
names(instagram_pd3)[names(instagram_pd3) == "atrakcyjno\u015b\u0107"] <- "atrakcyjnosc"
## Question 1
shapiro.test(instagram_pd3$liczba_postow_miesieczna)
#   Shapiro-Wilk normality test
#
# data:  instagram_pd3$liczba_postow_miesieczna
# W = 0.93288, p-value = 0.1754 > 0.05 ok
shapiro.test(instagram_pd3$obserwujacy_instagram)
#   Shapiro-Wilk normality test
#
# data:  instagram_pd3$obserwujacy_instagram
# W = 0.94082, p-value = 0.2485 > 0.05 ok
cor.test(instagram_pd3$liczba_postow_miesieczna, instagram_pd3$obserwujacy_instagram, method="pearson")
#   Pearson's product-moment correlation
#
# data:  instagram_pd3$liczba_postow_miesieczna and instagram_pd3$obserwujacy_instagram
# t = 1.7604, df = 18, p-value = 0.09532 < 0.05 nok
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#  -0.07137658  0.70603036
# sample estimates:
#       cor
# 0.3832494
## Question 2
cor.test(instagram_pd3$obserwujacy_instagram, instagram_pd3$atrakcyjnosc, method="spearman")
#   Spearman's rank correlation rho
#
# data:  instagram_pd3$obserwujacy_instagram and instagram_pd3$atrakcyjnosc
# S = 147.95, p-value = 1.644e-07
# alternative hypothesis: true rho is not equal to 0
# sample estimates:
#       rho 
# 0.8887568
