import os

cg = 'coding_genes.txt'
coding_genes = [g.rstrip() for g in open(cg,'r')]
coding_genes = coding_genes[1:]

root_dir = '/Users/mayurdivate/QUT/Work/Projects/All_Gene_list/Genes/0_All_genes/'

for fileX in os.listdir(root_dir):
    genes = [g.rstrip() for g in open(root_dir+'/'+fileX, 'r')]
    genes = genes[1:]
    file_cg = list(set(genes) & set(coding_genes))
    outfile = '/Users/mayurdivate/QUT/Work/Projects/All_Gene_list/Genes/1_Coding_genes/'+fileX
    with open(outfile,'w') as f:
        for g in file_cg:
            f.write(g+'\n')

    print(outfile)

