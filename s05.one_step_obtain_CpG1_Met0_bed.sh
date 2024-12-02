sample=$1
mix=$2
#######MCC20
/gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/software/anaconda3/bin/MethylDackel perRead /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/database/genome/hg19_lambda.fa merge_random_300000_${1}_0.25_mix_${2}.bam > merge_random_300000_${1}_0.25_mix_${2}_perRead.txt
cat merge_random_300000_${1}_0.25_mix${2}_perRead.txt | awk -F"\t" '$4<=0{print $0}' | awk -F"\t" '$5>0{print $0}'> merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_perRead.txt
cat merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_perRead.txt | awk '{print $1}' > merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_perRead_head.txt
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_one.pl merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_0.25_mix${2}.bed merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_select_one.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_two.pl merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_0.25_mix${2}.bed merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_select_two.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_three.pl merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_0.25_mix${2}.bed merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_select_three.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_four.pl merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_0.25_mix${2}.bed merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_select_four.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_five.pl merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_0.25_mix${2}.bed merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_select_five.bed
paste -d\\t merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_select_one.bed merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_select_two.bed merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_select_three.bed merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_select_four.bed merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0_select_five.bed > merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0.bed
rm -f *select*.bed
cat merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0.bed | sort -k1,1 -k2,2n > merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0.bed1
rm -f merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0.bed
mv merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0.bed1 merge_random_300000_${1}_0.25_mix${2}_CpG1_Met0.bed

#####MCC33
/gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/software/anaconda3/bin/MethylDackel perRead /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/database/genome/hg19_lambda.fa merge_random_300000_${1}_0.5_mix${2}.bam > merge_random_300000_${1}_0.5_mix${2}_perRead.txt
cat merge_random_300000_${1}_0.5_mix${2}_perRead.txt | awk -F"\t" '$4<=0{print $0}' | awk -F"\t" '$5>0{print $0}'> merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_perRead.txt
cat merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_perRead.txt | awk '{print $1}' > merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_perRead_head.txt
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_one.pl merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_0.5_mix${2}.bed merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_select_one.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_two.pl merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_0.5_mix${2}.bed merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_select_two.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_three.pl merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_0.5_mix${2}.bed merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_select_three.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_four.pl merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_0.5_mix${2}.bed merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_select_four.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_five.pl merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_0.5_mix${2}.bed merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_select_five.bed
paste -d\\t merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_select_one.bed merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_select_two.bed merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_select_three.bed merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_select_four.bed merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0_select_five.bed > merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0.bed
rm -f *select*.bed
cat merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0.bed | sort -k1,1 -k2,2n > merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0.bed1
rm -f merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0.bed
mv merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0.bed1 merge_random_300000_${1}_0.5_mix${2}_CpG1_Met0.bed

######MCC50
/gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/software/anaconda3/bin/MethylDackel perRead /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/database/genome/hg19_lambda.fa merge_random_300000_${1}_1_mix${2}.bam > merge_random_300000_${1}_1_mix${2}_perRead.txt
cat merge_random_300000_${1}_1_mix${2}_perRead.txt | awk -F"\t" '$4<=0{print $0}' | awk -F"\t" '$5>0{print $0}'> merge_random_300000_${1}_1_mix${2}_CpG1_Met0_perRead.txt
cat merge_random_300000_${1}_1_mix${2}_CpG1_Met0_perRead.txt | awk '{print $1}' > merge_random_300000_${1}_1_mix${2}_CpG1_Met0_perRead_head.txt
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_one.pl merge_random_300000_${1}_1_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_1_mix${2}.bed merge_random_300000_${1}_1_mix${2}_CpG1_Met0_select_one.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_two.pl merge_random_300000_${1}_1_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_1_mix${2}.bed merge_random_300000_${1}_1_mix${2}_CpG1_Met0_select_two.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_three.pl merge_random_300000_${1}_1_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_1_mix${2}.bed merge_random_300000_${1}_1_mix${2}_CpG1_Met0_select_three.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_four.pl merge_random_300000_${1}_1_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_1_mix${2}.bed merge_random_300000_${1}_1_mix${2}_CpG1_Met0_select_four.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_five.pl merge_random_300000_${1}_1_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_1_mix${2}.bed merge_random_300000_${1}_1_mix${2}_CpG1_Met0_select_five.bed
paste -d\\t merge_random_300000_${1}_1_mix${2}_CpG1_Met0_select_one.bed merge_random_300000_${1}_1_mix${2}_CpG1_Met0_select_two.bed merge_random_300000_${1}_1_mix${2}_CpG1_Met0_select_three.bed merge_random_300000_${1}_1_mix${2}_CpG1_Met0_select_four.bed merge_random_300000_${1}_1_mix${2}_CpG1_Met0_select_five.bed > merge_random_300000_${1}_mix${2}_CpG1_Met0.bed
rm -f *select*.bed
cat merge_random_300000_${1}_mix${2}_CpG1_Met0.bed | sort -k1,1 -k2,2n > merge_random_300000_${1}_mix${2}_CpG1_Met0.bed1
rm -f merge_random_300000_${1}_mix${2}_CpG1_Met0.bed
mv merge_random_300000_${1}_mix${2}_CpG1_Met0.bed1 merge_random_300000_${1}_mix${2}_CpG1_Met0.bed

####MCC75
/gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/software/anaconda3/bin/MethylDackel perRead /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/database/genome/hg19_lambda.fa merge_random_300000_${1}_3_mix${2}.bam > merge_random_300000_${1}_3_mix${2}_perRead.txt
cat merge_random_300000_${1}_3_mix${2}_perRead.txt | awk -F"\t" '$4<=0{print $0}' | awk -F"\t" '$5>0{print $0}'> merge_random_300000_${1}_3_mix${2}_CpG1_Met0_perRead.txt
cat merge_random_300000_${1}_3_mix${2}_CpG1_Met0_perRead.txt | awk '{print $1}' > merge_random_300000_${1}_3_mix${2}_CpG1_Met0_perRead_head.txt
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_one.pl merge_random_300000_${1}_3_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_3_mix${2}.bed merge_random_300000_${1}_3_mix${2}_CpG1_Met0_select_one.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_two.pl merge_random_300000_${1}_3_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_3_mix${2}.bed merge_random_300000_${1}_3_mix${2}_CpG1_Met0_select_two.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_three.pl merge_random_300000_${1}_3_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_3_mix${2}.bed merge_random_300000_${1}_3_mix${2}_CpG1_Met0_select_three.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_four.pl merge_random_300000_${1}_3_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_3_mix${2}.bed merge_random_300000_${1}_3_mix${2}_CpG1_Met0_select_four.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_five.pl merge_random_300000_${1}_3_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_3_mix${2}.bed merge_random_300000_${1}_3_mix${2}_CpG1_Met0_select_five.bed
paste -d\\t merge_random_300000_${1}_3_mix${2}_CpG1_Met0_select_one.bed merge_random_300000_${1}_3_mix${2}_CpG1_Met0_select_two.bed merge_random_300000_${1}_3_mix${2}_CpG1_Met0_select_three.bed merge_random_300000_${1}_3_mix${2}_CpG1_Met0_select_four.bed merge_random_300000_${1}_3_mix${2}_CpG1_Met0_select_five.bed > merge_random_300000_${1}_3_mix${2}_CpG1_Met0.bed
rm -f *select*.bed
cat merge_random_300000_${1}_3_mix${2}_CpG1_Met0.bed | sort -k1,1 -k2,2n > merge_random_300000_${1}_3_mix${2}_CpG1_Met0.bed1
rm -f merge_random_300000_${1}_3_mix${2}_CpG1_Met0.bed
mv merge_random_300000_${1}_3_mix${2}_CpG1_Met0.bed1 merge_random_300000_${1}_3_mix${2}_CpG1_Met0.bed

######MCC90
/gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/software/anaconda3/bin/MethylDackel perRead /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/database/genome/hg19_lambda.fa merge_random_300000_${1}_9_mix${2}.bam > merge_random_300000_${1}_9_mix${2}_perRead.txt
cat merge_random_300000_${1}_9_mix${2}_perRead.txt | awk -F"\t" '$4<=0{print $0}' | awk -F"\t" '$5>0{print $0}'> merge_random_300000_${1}_9_mix${2}_CpG1_Met0_perRead.txt
cat merge_random_300000_${1}_9_mix${2}_CpG1_Met0_perRead.txt | awk '{print $1}' > merge_random_300000_${1}_9_mix${2}_CpG1_Met0_perRead_head.txt
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_one.pl merge_random_300000_${1}_9_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_9_mix${2}.bed merge_random_300000_${1}_9_mix${2}_CpG1_Met0_select_one.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_two.pl merge_random_300000_${1}_9_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_9_mix${2}.bed merge_random_300000_${1}_9_mix${2}_CpG1_Met0_select_two.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_three.pl merge_random_300000_${1}_9_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_9_mix${2}.bed merge_random_300000_${1}_9_mix${2}_CpG1_Met0_select_three.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_four.pl merge_random_300000_${1}_9_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_9_mix${2}.bed merge_random_300000_${1}_9_mix${2}_CpG1_Met0_select_four.bed
perl /gpfs1/tangfuchou_pkuhpc/tangfuchou_cls/chenyidong/project/GY/Project_decontamination/01.MixingExperiment/select_bed_five.pl merge_random_300000_${1}_9_mix${2}_CpG1_Met0_perRead_head.txt merge_random_300000_${1}_9_mix${2}.bed merge_random_300000_${1}_9_mix${2}_CpG1_Met0_select_five.bed
paste -d\\t merge_random_300000_${1}_9_mix${2}_CpG1_Met0_select_one.bed merge_random_300000_${1}_9_mix${2}_CpG1_Met0_select_two.bed merge_random_300000_${1}_9_mix${2}_CpG1_Met0_select_three.bed merge_random_300000_${1}_9_mix${2}_CpG1_Met0_select_four.bed merge_random_300000_${1}_9_mix${2}_CpG1_Met0_select_five.bed > merge_random_300000_${1}_9_mix${2}_CpG1_Met0.bed
rm -f *select*.bed
cat merge_random_300000_${1}_9_mix${2}_CpG1_Met0.bed | sort -k1,1 -k2,2n > merge_random_300000_${1}_9_mix${2}_CpG1_Met0.bed1
rm -f merge_random_300000_${1}_9_mix${2}_CpG1_Met0.bed
mv merge_random_300000_${1}_9_mix${2}_CpG1_Met0.bed1 merge_random_300000_${1}_9_mix${2}_CpG1_Met0.bed
