rm(list=ls())
getwd()
setwd('~/github/JanthinoViol/data/')
getwd()

library(ggplot2)
library(lattice)
library(lsmeans)
library(multcompView)
library(plyr)
library(reshape)

pred <- read.csv("Predation_07302015_WJB.csv", header = T)
pred.melt <- melt(pred)
wilcox.test(value ~ variable, data=pred.melt)

ggplot(pred.melt, aes(x=variable, y=value, fill=variable)) + geom_boxplot() + xlab("Experimental Groups") + ylab("CFU/mL")+ scale_fill_manual(values=c("darkorchid4", "white"), name="Phenotype", labels=c("Purple", "White"))  + geom_blank() 

mixpred <- read.csv("Predation_07302015_2_WJB.csv", header = T)
mixpred.melt <- melt(mixpred)
wilcox.test(value ~ variable, data=mixpred.melt)

ggplot(mixpred.melt, aes(x=variable, y=value, fill=variable)) + geom_boxplot() + xlab("Experimental Groups") + ylab("CFU/mL")+ scale_fill_manual(values=c("darkorchid4", "white"), name="Phenotype", labels=c("Purple", "White"))  + geom_blank() 
