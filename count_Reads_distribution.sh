sample=$1
cat ${1}_perRead.txt | awk -F"\t" '$5==0{print $0}'> ${1}_CpGnum0_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$5==1{print $0}'> ${1}_CpGnum1_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$5==2{print $0}'> ${1}_CpGnum2_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$5==3{print $0}'> ${1}_CpGnum3_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$5>3{print $0}' | awk -F"\t" '$5<=5{print $0}'> ${1}_CpGnum3_5_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$5>=4{print $0}'> ${1}_CpGnum_greater4_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$4==0{print $0}' | awk -F"\t" '$5>0{print $0}'> ${1}_CpG1_Met0_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$4==100{print $0}' | awk -F"\t" '$5>0{print $0}'> ${1}_CpG1_Met1_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$4>0{print $0}' | awk -F"\t" '$4<100{print $0}' | awk -F"\t" '$5>0{print $0}'> ${1}_CpG1_betMet0_1_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$4>0{print $0}'| awk -F"\t" '$4<=10{print $0}' | awk -F"\t" '$5>0{print $0}'> ${1}_CpG1_betMet0_0.1_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$4>10{print $0}'| awk -F"\t" '$4<=20{print $0}' | awk -F"\t" '$5>0{print $0}'> ${1}_CpG1_betMet0.1_0.2_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$4>20{print $0}'| awk -F"\t" '$4<=30{print $0}' | awk -F"\t" '$5>0{print $0}'> ${1}_CpG1_betMet0.2_0.3_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$4>30{print $0}'| awk -F"\t" '$4<=40{print $0}' | awk -F"\t" '$5>0{print $0}'> ${1}_CpG1_betMet0.3_0.4_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$4>40{print $0}'| awk -F"\t" '$4<=50{print $0}' | awk -F"\t" '$5>0{print $0}'> ${1}_CpG1_betMet0.4_0.5_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$4>50{print $0}' | awk -F"\t" '$4<=60{print $0}' | awk -F"\t" '$5>0{print $0}'> ${1}_CpG1_betMet0.5_0.6_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$4>60{print $0}'| awk -F"\t" '$4<=70{print $0}' | awk -F"\t" '$5>0{print $0}'> ${1}_CpG1_betMet0.6_0.7_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$4>70{print $0}'| awk -F"\t" '$4<=80{print $0}' | awk -F"\t" '$5>0{print $0}'> ${1}_CpG1_betMet0.7_0.8_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$4>80{print $0}'| awk -F"\t" '$4<=90{print $0}' | awk -F"\t" '$5>0{print $0}'> ${1}_CpG1_betMet0.8_0.9_perRead.txt
cat ${1}_perRead.txt | awk -F"\t" '$4>90{print $0}'| awk -F"\t" '$4<=100{print $0}' | awk -F"\t" '$5>0{print $0}'> ${1}_CpG1_betMet0.9_1_perRead.txt
