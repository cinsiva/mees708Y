# if else
temp = -50

if (temp < 0) {
    print("It's freezing!")
    if (temp < 32) {
        print("And kids don't go to school.")
    }
} else {
    print("It's not freezing.")
}

source("./code/fun_checkweather.R")


tempF = checkweather(55, verbose = TRUE, y = "hojoj")
checkweather(verbose = TRUE, 55)

10 %% 3
x = 9
(x %% 4) == 0
(x %% 400) == 0

lm(weight ~ group - 1) # formula is the 1st argument in lm()
lm(formula = weight ~ group - 1)


checkweather <- function(x, verbose = FALSE, y) {
    # x is temperature, degrees C
    # verbose is logical value, indicating to print results
    if (FALSE) {
        x = 5
    }
    # xf <- 32 + 1.8*x
    # print(paste0("In Farenheit it is ", xf, "."))
    if (verbose) {
        if (x < 0) {
            print("It's freezing!")
            if (x < 32) {
                print("And kids don't go to school.")
                print(x ^ y)
            }
        } else {
            print("It's not freezing.")
        }
    }
    # return(xf)
    32 + 1.8*x
}

checkyear =function(year){
    if((year %% 4) == 0) {
        if((year %% 100) == 0) {
            if((year %% 400) == 0) {
                print(paste(year,"is a leap year"))
            } else {
                print(paste(year,"is not a leap year"))
            }
        } else {
            print(paste(year,"is a leap year"))
        }
    } else {
        print(paste(year,"is not a leap year"))
    }}
checkyear(2008)
checkyear(2010)
