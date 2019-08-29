import os

cg = 'coding_genes.txt'
coding_genes = [g.rstrip() for g in open(cg,'r')]
coding_genes = coding_genes[1:]

# root dir : all genes located
root_dir = '/Users/n10337547/Projects/2_Cancer_Genes/2_Genes/0_All_Genes/'

# output folder path
outdir = '/Users/n10337547/Projects/2_Cancer_Genes/2_Genes/1_Coding_Genes/'

for fileX in os.listdir(root_dir):
    # one by one all genes files

    genes = [g.rstrip() for g in open(os.path.join(root_dir,fileX), 'r')]
    genes = genes[1:]
    file_cg = list(set(genes) & set(coding_genes))
    outfile = os.path.join(outdir, fileX)
    with open(outfile, 'w') as f:
        for g in file_cg:
            f.write(g+'\n')

    print(outfile)

