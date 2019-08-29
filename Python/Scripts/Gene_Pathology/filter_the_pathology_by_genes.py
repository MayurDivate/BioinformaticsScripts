import pandas as pd
import re

pathology_file = '/Users/n10337547/Projects/1_CUP/2_TCGA/10_meta_data/pathology.tsv'
sig_gene_file = '/Users/n10337547/Projects/1_CUP/2_TCGA/10_meta_data/FPKM_5_CG_signatures.txt'
outfile = '/Users/n10337547/Projects/1_CUP/2_TCGA/10_meta_data/sig_gene_pathology.tsv'
pattern = re.compile("\..*\n")
sig_genes = [re.sub(pattern, "", gene) for gene in open(sig_gene_file, 'r')]


df = pd.read_csv(pathology_file, sep='\t')
df_sig_genes = df.loc[df.Gene.isin(sig_genes),]
print(df_sig_genes.info())


df_sig_genes.to_csv(outfile,sep='\t', index=False)


