library(dplyr)

# Select rows by condition
# | and ! are also accepted conjunctions
# https://sparkbyexamples.com/r-programming/r-select-rows-by-condition/
ankieta_nowa[ankieta_nowa$q1_plec == 1 & ankieta_nowa$q3_kolor_oczu %in% c(1,3),]
# Map column (q1_plec: 0 -> 3)
ankieta1$q1_plec <- mapvalues(ankieta_nowa$q1_plec, from=c(0), to=c(3))
# Copy column
ankieta_nowa$qx_test = ankieta_nowa$q1_plec
# Create column
ankieta_nowa$qx_test = vector(mode="integer", length=nrow(ankieta_nowa))

# Age average and standard deviation
ankieta_nowa %>%
  filter(q1_plec == 1) %>%
  mutate(wiek = 2022 - q2_r_urodzenia) %>%
  select(wiek) %>%
  summarise(mean = mean(wiek), sd = sd(wiek))

# Most frequently appearing age
ankieta_nowa %>%
  filter(q1_plec == 1) %>%
  mutate(wiek = 2022 - q2_r_urodzenia) %>%
  select(wiek) %>%
  tally(sort = TRUE)
