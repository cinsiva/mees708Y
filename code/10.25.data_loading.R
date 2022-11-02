# Data ----

## data. frame ----
worm <- read.table("./dataraw/10.25/worms.missing.txt", head  = TRUE)
head(worm)
is.data.frame(worm)

worm[order(worm$Area), ] # order creates index/rank of observation

tmp <- scan("./dataraw/10.25/Lengths.dat",
            what = list(Name = "", Family = "", Length = 0),
            na.string = ".") # View(tmp)
marine = as.data.frame(tmp)
na.omit(marine)
is.na(marine$Family)
marine2 <- marine[!is.na(marine$Family)]

marine[order(marine$Family, marine$Length), ]

aggregate(Length ~ Family, data = marine, FUN = "mean", trim = 0.3) # trim removes outliers, 30%

# NA
x = c(1, 3, 5, NA)
mean(x, na.rm = TRUE)
lm()

# data.table ----

## tibble/dplyr ----
library(dplyr)
worm_tbl = as_tibble(worm)
head(worm_tbl)

marine %>%
    # arrange(Family, Length) %>%
    group_by(Family) %>%
    summarise(Length = mean(Length))

filter(starwars,
       hair_color == "none" &
           eye_color == "black")

filter(starwars,
       is.element(hair_color, c("blond", "none")) &
           eye_color == "black")

# merging

descriptions <- read.fwf("./dataraw/10.25/Chocolate.dat",
                         widths = c(4, 10, 46),
                         col.names = c("CodeNum", "Name", "Description"))
descriptions <- na.omit(descriptions)
sales <- read.table("./dataraw/10.25/Chocsales.dat", header = FALSE,
                    col.names = c("CodeNum", "PiecesSold"))

# base R
X <- merge(sales, descriptions, all = TRUE)
dim(X) # 7 obs, 4 variables in data frame

# dplyr
X2 <- sales %>%
    full_join(descriptions)

# modifying code - converting from long/short format

library(reshape2)
baseball <- read.table("./dataraw/10.25/Transpos.dat", header = FALSE,
                       col.names = c("Team", "Player", "Type", "Entry"))
baseball.m <- melt(baseball,
                   idvars = c("Team", "Player", "Type"), # which vars you are not melting
                   measure.vars = "Entry") # which are getting measured
head(baseball.m)
