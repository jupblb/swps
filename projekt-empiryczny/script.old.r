library(haven)
library(tidyverse)

# After import
source = source %>% filter(Finished == 1) %>% select(-(1:11))

result = source %>% mutate(
    Q3_9r = recode(as.numeric(source$Q3_9), `1` = 5L, `2` = 4L, `3` = 3L, `4` = 2L, `5` = 1L),
    Q3_24r = recode(as.numeric(source$Q3_24), `1` = 5L, `2` = 4L, `3` = 3L, `4` = 2L, `5` = 1L),
    Q3_25r = recode(as.numeric(source$Q3_25), `1` = 5L, `2` = 4L, `3` = 3L, `4` = 2L, `5` = 1L),
    Q3_41r = recode(as.numeric(source$Q3_41), `1` = 5L, `2` = 4L, `3` = 3L, `4` = 2L, `5` = 1L),
    Q3_56r = recode(as.numeric(source$Q3_56), `1` = 5L, `2` = 4L, `3` = 3L, `4` = 2L, `5` = 1L),
    intensywne_dni = as.numeric(recode(source$Pytanie_1_1_TEXT, `1` = 1L, `2` = 2L, `3` = 3L, `4` = 4L, `5` = 5L, `6` = 6L, `7` = 7L, .default = 0L)),
) %>% transmute(
    przeszla_negatywna = rowMeans(select(., Q3_4, Q3_5, Q3_16, Q3_22, Q3_27, Q3_33, Q3_34, Q3_36, Q3_50, Q3_54)),
    przeszla_pozytywna = rowMeans(select(., Q3_2, Q3_7, Q3_11, Q3_15, Q3_20, Q3_25r, Q3_29, Q3_41r, Q3_49)),
    terazniejsza_fatalistyczna = rowMeans(select(., Q3_3, Q3_14, Q3_35, Q3_37, Q3_38, Q3_39, Q3_47, Q3_52, Q3_53)),
    terazniejsza_hedonistyczna = rowMeans(select(., Q3_1, Q3_8, Q3_12, Q3_17, Q3_19, Q3_23, Q3_26, Q3_28, Q3_31, Q3_32, Q3_42, Q3_44, Q3_46, Q3_48, Q3_55)),
    przyszla = rowMeans(select(., Q3_6, Q3_9r, Q3_10, Q3_13, Q3_18, Q3_21, Q3_24r, Q3_30, Q3_40, Q3_43, Q3_45, Q3_51, Q3_56r)),
    intensywne_dni,
)
