#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

# test if there is at least one argument: if not, return an error
if (length(args)==0) {
  stop("At least one argument must be supplied", call.=FALSE)
} else {metric = args[1]
    if(metric != "minus" && metric != "zoltar" && metric != "mccon"  && metric != "ochiai" && metric != "jaccard"  && metric != "wong3" && metric != "tarantula"  && metric != "drt" && metric != "kulcz"  && metric != "jaccard"  && metric != "op")
      stop("Wrong metric supplied", call.=FALSE)
}

library(orddom)

sprintf("")
sprintf("%s - real faults",metric)

fdua = sprintf("%sduareal.txt", metric)
fline = sprintf("%slinereal.txt", metric)
fdua
fline

dline = read.table(fline)
ddua = read.table(fdua)
mydata = data.frame(ddua, dline)
mydata

wilcox.real = wilcox.test(mydata$V1, mydata$V1.1, alternative="less", paired=TRUE)
n.real = 163

wilcox.real

summary(mydata)

dua=mydata$V1
breaks = seq(1, 110, by=10)
dua.cut = cut(dua, breaks, right=FALSE)
dua.freq = table(dua.cut)
dua.freq

line=mydata$V1.1
#breaks = seq(1, 110, by=10)
line.cut = cut(line, breaks, right=FALSE)
line.freq = table(line.cut)
line.freq

sprintf("Effect size - Magnitude")
cliffs.delta = dmes(mydata$V1,mydata$V1.1)#dmes(C,T) -> dmes(T,C): changed control/treatment order, we want to measure which technique has lower scores

sprintf("cliffs-delta, %s-real = %s", metric, cliffs.delta$db)
sprintf("ps-probability-of-superiority, %s-real = %s", metric, cliffs.delta$PSb)

zscore.real = qnorm(wilcox.real$p.value/2)
effect.size.real = zscore.real / sqrt(n.real*2)

sprintf("Effect size - Association")
sprintf("z-score, %s-real = %s", metric, zscore.real)
sprintf("pearson-r, %s-real = %s", metric, effect.size.real)

