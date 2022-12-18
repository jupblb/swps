names(pd4_regresja_liniowa)[names(pd4_regresja_liniowa) == "wykszta\u0142cenie_ekonomiczne"] <- "wyksztalcenie_ekonomiczne"

library(dplyr)
niewyksztalcone = pd4_regresja_liniowa %>%
  filter(wyksztalcenie_ekonomiczne == 0) %>%
  select(wyniki, wiedza_ekonomiczna)

summary(lm(niewyksztalcone$wyniki ~ niewyksztalcone$wiedza_ekonomiczna))
# Residuals:
#     Min      1Q  Median      3Q     Max
# -57.061  -9.927   0.039  11.775  48.118
#
# Coefficients:
#                                    Estimate Std. Error t value Pr(>|t|)
# (Intercept)                        151.6576     5.1190   29.63   <2e-16 ***
# niewyksztalcone$wiedza_ekonomiczna   3.9389     0.1009   39.05   <2e-16 ***
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#
# Residual standard error: 16.02 on 321 degrees of freedom
# Multiple R-squared:  0.8261,	Adjusted R-squared:  0.8255
# F-statistic:  1525 on 1 and 321 DF,  p-value: < 2.2e-16
