#####################################################################
#####################################################################
# Debugugging
as.Date(c("2011-04-05", 35)) # 2nd element doesn't get converted
# correctly, get NA value

X <- rep(NA, nrow(swiss))
for (i in 1:nrow(swiss)) { # i = 1
     m = lm(unlist(swiss[i, ] ~ 1)
    X[i] = m$coefficients[1]
     }
X


apply(swiss, 1, mean) # row means
apply(swiss, 2, mean) # column means

#Warning
tmp <- log(-pi)
is.na(tmp)

# Error
lm(x~y) #we do not have x and y in our environment


#### TOOLS
traceback()

mean(x)
traceback()

# browser() and debug()
source('MyFunctions.R')


debug()
