names(korelacje)[names(korelacje) == "wyk\u0142ad"] <- "wyklad"
names(ustawa)[names(ustawa) == "zamo\u017cno\u015b\u0107"] <- "zamoznosc"
# CORRELATION
# * [0, 0.3] - weak correlation
# * [0.3, 0.5] - medium correlation
# * [0.5, 0.7] - strong correlation
# * [0.7, 1] - very strong correlation
# Run shapiro test on each column to check if normal distribution
shapiro.test(korelacje$...)
# If normal distribution and quantitative
cor.test(korelacje$pogoda, korelacje$koncentracja, method="pearson")
cor(korelacje, method = "pearson") # table
# If at least one not normal and both quantitative or ordered
cor.test(korelacje$optymizm, korelacje$atrakcyjnosc, method="spearman")
cor(korelacje, method = "spearman") # table
# CONTINGENCY
# phi-yule: 2x2, nominal
phiyule <- function(col1, col2) {
  n <- length(col1)
  c <- chisq.test(col1, col2)$statistic
  print(sqrt(c / n))
}
# V Cramer: nominal (maybe nominal + ordered)
# https://rdrr.io/cran/lsr/man/cramersV.html
# MIX - nominal x quantitative = eta
etaSquared(aov(do_utrwalenia$czytelnicy ~ do_utrwalenia$psychotycznosc))
