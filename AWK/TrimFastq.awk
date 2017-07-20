# Author MayurDivate mayur.divate91@gmail.com
# Replace A by start position
# Replace B by number of positions after A to keep
# Replace test.fastq by FastQ file name

awk '{if(NR%2==0 || NR%4==0){s=substr($0,A,B); print s;}else{print $0;}}' test.fastq


