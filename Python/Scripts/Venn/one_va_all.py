import os

cg = 'coding_genes.txt'
coding_genes =  [g.rstrip() for g in open(cg,'r')]
coding_genes = coding_genes[1:]

root_dir = '/Users/mayurdivate/QUT/Work/Projects/All_Gene_list/Genes/1_Coding_genes'

cg_genes = os.listdir(root_dir)


for i in range(len(cg_genes)):
    a = [g.rstrip() for g in open(root_dir+'/'+cg_genes[i], 'r')]
    b = []

    for j in range(len(cg_genes)):
        if i != j:
            bx = [g.rstrip() for g in open(root_dir+'/'+cg_genes[j], 'r')]
            b = b + bx
            
    a_genes = list(set(a) - set(b))
    outfile = '/Users/mayurdivate/QUT/Work/Projects/All_Gene_list/Genes/2_Specific/' + cg_genes[i]

    with open(outfile, 'w') as f:
        for g in a_genes:
            f.write(g + '\n')

    print(outfile)
