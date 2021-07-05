import pandas as pd
import matplotlib.pyplot as plt

infile = '/Users/mayurdivate/QUT/Work/Projects/3_CUP_TCGA/3_Results/QIMR_FPKM_5/bxplt.tsv'

sckm =  pd.read_csv(infile, sep='\t')

sckm.plot(kind='box')

plt.savefig('FPKM_MOK_BRAF.png')

plt.show()