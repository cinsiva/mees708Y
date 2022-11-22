# Nicole Ibrahim

# library(dplyr)
# library(ggplot2)

# x <- read.csv("AD_cluster_3.csv")

myplot <- function(x, plotmean = TRUE, color = "red"){
            if ((is.null(dim(x))) == TRUE) {
                stop("A numeric vector can't be used to calculate quantiles in a
                     time series") # stopifnot function in the future?
            }
            x = as.data.frame(x)
            if(ncol(x)!=5){
                x <- tibble::rownames_to_column(x, "Year")
            }
            x[,1] <- as.numeric(x[,1])
            x <- subset(x,!is.na(x[,2]))
            mean <- (sum(x[,2])/nrow(x[,2]))
            q1 = apply(x, 1, quantile, na.rm = TRUE, probs = 0.25)
            q3 = apply(x, 1, quantile, na.rm = TRUE, probs = 0.75)
            if (plotmean){
                ggplot() + aes(x[,1],x[,2]) +
                    geom_point() +
                    geom_line(aes(x[,1],x[,2]), color = "black") +
                    ggtitle("Title") +
                    xlab("x-axis label") +
                    ylab("y-axis label") +
                    geom_line(aes(yintercept = mean(x[,2], na.rm = TRUE), color = "red")) +
                    geom_quantile(aes(quantiles = q1, color = "red"), method = "rqss") +
                    geom_quantile(aes(quantiles = q3, color = "green"), method = "rqss") +
                    scale_color_hue(labels = c("mean")) +
                    theme_classic() +
                    scale_color_manual(name = "Legend Title",
                                       breaks = c("Average", "Median", "Q1 & Q3"),
                                       values = c("Average" = "black", Median = "grey",
                                                  "Q1 & Q3" = "blue"))
                    theme(legend.position = "right")
            } else {
                x %>%
                    ggplot() + aes(x[,1],x[,2]) +
                    geom_point() +
                    geom_line(aes(x[,1],x[,2]), color = "black") +
                    geom_quantile(aes(quantiles = q1, color = "red"), method = "rqss") +
                    geom_quantile(aes(quantiles = q3, color = "green"), method = "rqss") +
                    ggtitle("Title") +
                    xlab("x-axis label") +
                    ylab("y-axis label") +
                    theme_classic() +
                    scale_color_manual(name = "My Title",
                                       breaks = c("Average", "Median", "Q1 & Q3"),
                                       values = c("Average" = "black", Median = "grey",
                                                  "Q1 & Q3" = "blue"))
                    theme(legend.position = "right")
            }
}
