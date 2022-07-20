args <- commandArgs(T)

mydata <- read.table(args[1], header = F)

totalC <- sum(mydata[, 4], na.rm = T)

MetC <- sum(mydata[, 5], na.rm = T)

methy.rate <- MetC/totalC
median.methy.rate <- median(mydata[, 6])
write.table(data.frame(args[1],totalC,MetC, methy.rate,median.methy.rate), paste(args[2],"site_methylation.rate.xls",sep="."), row.names = F, col.names = F, sep = "\t", quote = F, append = T)
