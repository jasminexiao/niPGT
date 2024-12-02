sample=$1
cat ${sample}.bed | awk '{print $4}' > ${sample}.txt
java -jar /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/software/picard-tools-1.119/FilterSamReads.jar I=scBS_hSp_10ng.rmdup.bam O=${sample}.bam READ_LIST_FILE=${sample}.txt FILTER=includeReadList VALIDATION_STRINGENCY=LENIENT
