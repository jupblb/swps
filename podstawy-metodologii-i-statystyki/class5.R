names(X2_ksiazki)[names(X2_ksiazki) == "sprzeda\u017c"] <- "sprzedaz"
names(X2_ksiazki)[names(X2_ksiazki) == "atrakcyjno\u015b\u0107"] <- "atrakcyjnosc"
# Linear regression y = ax + b. On the left we should have dependent variable.
lm(X2_ksiazki$sprzedaz ~ X2_ksiazki$reklama)
# Coefficients:
#        (Intercept)  X2_ksiazki$reklama
#          134.13994             0.09612
# sprzedaz = 0.096 * reklama + 134

# https://www.rdocumentation.org/packages/lme4/versions/1.1-31/topics/glmer
# https://www.rdocumentation.org/packages/lmerTest/versions/3.1-3/topics/lmer

summary(lm(X2_ksiazki$sprzedaz ~ X2_ksiazki$reklama+X2_ksiazki$gratisy+X2_ksiazki$atrakcyjnosc))
# Call:
# lm(formula = X2_ksiazki$sprzedaz ~ X2_ksiazki$reklama + X2_ksiazki$gratisy + 
#     X2_ksiazki$atrakcyjnosc)
#
# Residuals:
#      Min       1Q   Median       3Q      Max 
# -121.324  -28.336   -0.451   28.967  144.132 
#
# Coefficients:
#                           Estimate Std. Error t value Pr(>|t|)
# (Intercept)             -26.612958  17.350001  -1.534    0.127
# X2_ksiazki$reklama        0.084885   0.006923  12.261  < 2e-16 ***
# X2_ksiazki$gratisy        3.367425   0.277771  12.123  < 2e-16 ***
# X2_ksiazki$atrakcyjnosc  11.086335   2.437849   4.548 9.49e-06 ***
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#
# Residual standard error: 47.09 on 196 degrees of freedom
# Multiple R-squared:  0.6647,	Adjusted R-squared:  0.6595 
# F-statistic: 129.5 on 3 and 196 DF,  p-value: < 2.2e-16
