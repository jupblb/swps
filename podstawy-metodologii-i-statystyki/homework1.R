# Loading
library(haven)
pd1 = read_sav("pd1.sav")
View(pd1)
 
library(dplyr)
# Respondents grouped by city size
pd1 %>%
  group_by(rodzaj_miasta = cut(ludnosc, breaks=c(0, 20000, 100000, Inf))) %>%
  tally()
#   rodzaj_miasta     n
# 1 (0,2e+04]       306
# 2 (2e+04,1e+05]   126
# 3 (1e+05,Inf]     137
# Respondents grouped by city size and education
pd1 %>%
  group_by(rodzaj_miasta = cut(ludnosc, breaks=c(0, 20000, 100000, Inf)), wykszt) %>%
  tally()
#    rodzaj_miasta         wykszt     n
#  1 (0,2e+04]     1 [Podstawowe]    82
#  2 (0,2e+04]     3 [Zawodowe]      99
#  3 (0,2e+04]     5 [?rednie]       85
#  4 (0,2e+04]     9 [Wy?sze]        40
#  5 (2e+04,1e+05] 1 [Podstawowe]    24
#  6 (2e+04,1e+05] 3 [Zawodowe]      35
#  7 (2e+04,1e+05] 5 [?rednie]       48
#  8 (2e+04,1e+05] 9 [Wy?sze]        19
#  9 (1e+05,Inf]   1 [Podstawowe]    19
# 10 (1e+05,Inf]   3 [Zawodowe]      31
# 11 (1e+05,Inf]   5 [?rednie]       57
# 12 (1e+05,Inf]   9 [Wy?sze]        30
# Mean and standard deviation of agreeableness per gender
library(e1071)
pd1 %>%
  group_by(Plec) %>%
  mutate(ugodowosc = neo_p4 + neo_p19 + neo_p24 + neo_p34 + neo_p49 + 6 * 7 - (neo_p9 + neo_p14 + neo_p29 + neo_p39 + neo_p44 + neo_p54 + neo_p59)) %>%
  summarise(mean = mean(ugodowosc), sd = sd(ugodowosc), kurtosis = kurtosis(ugodowosc, type = 2))
#          Plec  mean    sd kurtosis
# 1 [kobieta]    37.6  2.76  -0.0820
# 2 [mężczyzna]  37.5  2.79  -0.141
