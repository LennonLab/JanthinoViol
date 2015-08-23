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

pred.log <- log(pred)
pred.log.melt <- melt(pred.log)
wilcox.test(value ~ variable, data=pred.log.melt)

ggplot(pred.melt, aes(x=variable, y=value, fill=variable)) + geom_boxplot() + xlab("Experimental Groups") + ylab("CFU/mL")+ scale_fill_manual(values=c("darkorchid4", "white"), name="Phenotype", labels=c("Purple", "White"))  + geom_blank() 

mixpred <- read.csv("Predation_07302015_2_WJB.csv", header = T)
mixpred.melt <- melt(mixpred)
wilcox.test(value ~ variable, data=mixpred.melt)

ggplot(mixpred.melt, aes(x=variable, y=value, fill=variable)) + geom_boxplot() + xlab("Experimental Groups") + ylab("CFU/mL")+ scale_fill_manual(values=c("darkorchid4", "white"), name="Phenotype", labels=c("Purple", "White"))  + geom_blank() 

combpred <- read.csv("Predation_07302015_3_WJB.csv", header = T)
combpred.melt <- melt(combpred)
combpred.aov <- aov(value ~ variable, data=combpred.melt)
summary(combpred.aov)

ggplot(combpred.melt, aes(x=variable, y=value, fill=variable)) + geom_boxplot() + xlab("Experimental Groups") + ylab("Total CFU/mL")+ scale_fill_manual(values=c("darkorchid4", "white", "mediumorchid1"), name="Phenotype", labels=c("Purple", "White", "Mixed"))  + geom_blank() 
