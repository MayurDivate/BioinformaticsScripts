import os
import re


class OneVsOne:

    def __init__(self, root_dir, out_dir):
        self.root_dir = root_dir
        self.out_dir = out_dir

    def get_filenames(self):
        return [f for f in os.listdir(self.root_dir)]

    def one_vs_one_venn(self):

        filenames =  self.get_filenames()

        for file1 in filenames:
            for file2 in filenames:
                if not file1 is file2:
                    gene_list1 = [g.rstrip() for g in open(self.root_dir + '/' + file1, 'r')]
                    gene_list2 = [g.rstrip() for g in open(self.root_dir + '/' + file2, 'r')]
                    list_specific =  list(set(gene_list1) - set(gene_list2))

                    out = file1 + '_vs_'+ file2
                    out = out.replace("_expression_FPKM_1_coding_genes.txt","") + "_gene.txt"
                    output_file = os.path.join(self.out_dir, out)
                    print(output_file)
                    
                    with open(output_file, 'w') as f:
                        for g in list_specific:
                            f.write(g + '\n')


root_dir = "/Users/mayurdivate/QUT/Work/Projects/2_Genes/1_coding_genes/FPKM_5"
out_dir = "/Users/mayurdivate/QUT/Work/Projects/2_Genes/2_OneVsOne"
test = OneVsOne(root_dir, out_dir)
test.one_vs_one_venn()