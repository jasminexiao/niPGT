##############数据预处理###############
library(ggplot2)
#install.packages("ggpubr")
library(ggpubr)
sample_name_txt <- read.table("list")
sample_name <- sample_name_txt$V1

DMR <- read.csv(file = "all_DMR.bed", header = FALSE, sep = "\t")
DMR_txt <- paste0(DMR$V1,":",DMR$V2,"_",DMR$V3)
all_methy_level <- data.frame(chr=DMR_txt)
for (i in 1:length(sample_name)) {
  file = paste0(sample_name[i], "_allDMR.single5mC")
  sample_methy <- read.table(file, header = FALSE)
  colnames(sample_methy) <- c("A", "B", "C","D","E", paste0(sample_name[i]))
  sample_methy$chr <- paste0(sample_methy$A,":",sample_methy$B,"_",sample_methy$C)
  sample_methy$A <- NULL
  sample_methy$B <- NULL
  sample_methy$C <- NULL
  sample_methy$D <- NULL
  sample_methy$E <- NULL
  all_methy_level <- merge(all_methy_level, sample_methy,
                           by = c("chr"), all = T)
  
} 

order <- as.vector(DMR_txt)
rownames(all_methy_level) <- all_methy_level$chr
merge <- all_methy_level[order, ]
merge$chr <- NULL

############################################
##############计算比例-去掉一个最大值
##############颗粒细胞特异 chr9 132482398 132482638
pn.mean <- apply(merge[1:769,c(1:dim(merge)[2])],2,function(x) mean(as.numeric(unlist(x[order(x,decreasing=T)][c(-1)])),na.rm=T))##每列都去掉最大值
C.mean <- apply(merge[1:769,c(1:dim(merge)[2])],2,function(x) mean(as.numeric(unlist(merge[1:769,][order(x,decreasing=T),1:3][c(-1),])),na.rm=T))#####1-3列去掉最大值求平均
O.mean <- apply(merge[1:769,c(9:dim(merge)[2])],2,function(x) mean(as.numeric(unlist(merge[1:769,][order(x,decreasing=T),4:6][c(-1),])),na.rm=T))
S.mean <- apply(merge[1:769,c(9:dim(merge)[2])],2,function(x) mean(as.numeric(unlist(merge[1:769,][order(x,decreasing=T),7:9][c(-1),])),na.rm=T))
C.marker <- cbind(C.mean,O.mean,S.mean,pn.mean)

##############极体细胞特异 chr22 50919001 50920501
pn.mean <- apply(merge[770:1317,c(1:dim(merge)[2])],2,function(x) mean(as.numeric(unlist(x[order(x,decreasing=T)][c(-1)])),na.rm=T))##每列都去掉最大值
C.mean <- apply(merge[770:1317,c(1:dim(merge)[2])],2,function(x) mean(as.numeric(unlist(merge[770:1317,][order(x,decreasing=T),1:3][c(-1),])),na.rm=T))#####1-3列去掉最大值求平均
O.mean <- apply(merge[770:1317,c(9:dim(merge)[2])],2,function(x) mean(as.numeric(unlist(merge[770:1317,][order(x,decreasing=T),4:6][c(-1),])),na.rm=T))
S.mean <- apply(merge[770:1317,c(9:dim(merge)[2])],2,function(x) mean(as.numeric(unlist(merge[770:1317,][order(x,decreasing=T),7:9][c(-1),])),na.rm=T))
O.marker <- cbind(C.mean,O.mean,S.mean,pn.mean)

##############精子细胞特异 chr22 50919001 50920501
pn.mean <- apply(merge[1318:1482,c(1:dim(merge)[2])],2,function(x) mean(as.numeric(unlist(x[order(x,decreasing=T)][c(-1)])),na.rm=T))##每列都去掉最大值
C.mean <- apply(merge[1318:1482,c(1:dim(merge)[2])],2,function(x) mean(as.numeric(unlist(merge[1318:1482,][order(x,decreasing=T),1:3][c(-1),])),na.rm=T))#####1-3列去掉最大值求平均
O.mean <- apply(merge[1318:1482,c(9:dim(merge)[2])],2,function(x) mean(as.numeric(unlist(merge[1318:1482,][order(x,decreasing=T),4:6][c(-1),])),na.rm=T))
S.mean <- apply(merge[1318:1482,c(9:dim(merge)[2])],2,function(x) mean(as.numeric(unlist(merge[1318:1482,][order(x,decreasing=T),7:9][c(-1),])),na.rm=T))
S.marker <- cbind(C.mean,O.mean,S.mean,pn.mean)

m <- rbind(C.marker,O.marker,S.marker) 
rs1 <- matrix(nrow=dim(merge)[2],ncol=3) #colname(C.mean,O.mean,S.mean...) rownames(pn13,pn14...)
rs2 <- matrix(nrow=4,ncol=(dim(merge)[2])*3) #rowname(1,2,3,4,5...),colnames(rs1向量化)
class(m)
library(pso)
for (j in c(1:4))###rs2的行数
{
  for (i in c(1:(dim(merge)[2])))###
  {
    ma <- m[seq(i,(dim(merge)[2])*3,by=dim(merge)[2]),1:3] #21*3,21个样品，1:3列是组织数据
    mb <- m[seq(i,(dim(merge)[2])*3,by=dim(merge)[2]),4] #21*3,21个样品，3种组织数据+1个培养液数据
    set.seed(j)
    o <- psoptim(rep(NA,3),function(x) sum((ma%*%c(x[1],x[2],x[3])-mb)^2),lower=c(rep(0,3)),upper=c(rep(1,3)))  ##%*%矩阵乘积，ma%*%c(x[1],x[2],x[3])即是组织甲基化乘以各成分比例
    rs1[i,] <- o$par
  }
  rs2[j,] <- as.vector(rs1)
}

rs <- matrix(apply(rs2,2,median),nrow=dim(merge)[2],ncol=3)
row.names(rs) <- row.names(m[1:(dim(merge)[2]),])
colnames(rs) <- colnames(m[,1:3])
rs <- as.data.frame(rs)
rs$I.mean <- 1-(rs$C.mean+rs$O.mean+rs$S.mean)
rs.new <- 100*rs
write.table(rs.new,"../ALLData_predictRatio.xls",quote=F,col.names = T,row.names = T,sep = "\t")
