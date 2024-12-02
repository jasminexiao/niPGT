sample=$1
sample2=$2
shuf -n 2700000 ${1}.bed > ${2}.bed
