list <- read.table(file,header = F)
sample_name <- list$V1
summary <- data.frame()
for (i in 1:length(sample_name)) {
  C.data <- read.table(paste0(sample_name[i], "_Cumulus.single5mC"), header = FALSE)
  C.met <- sum(C.data[, 5], na.rm = T)/sum(C.data[, 4], na.rm = T)
  O.data <- read.table(paste0(sample_name[i], "_polarbody.single5mC"), header = FALSE)
  O.met <- sum(O.data[, 5], na.rm = T)/sum(O.data[, 4], na.rm = T)
  chart <- data.frame(sample=sample_name[i],C.met=C.met,O.met=O.met,C.ratio=(27.2*C.met+40*C.met*O.met-0.78*O.met-1.3404)/(0.1088*C.met+0.16*C.met*O.met+0.204*O.met+0.13845),O.ratio=(51*O.met+40*O.met*C.met-5.8*C.met-11.346)/(0.204*O.met+0.16*O.met*C.met+0.1088*C.met+0.13845))
  summary=rbind(summary,chart)
} 

