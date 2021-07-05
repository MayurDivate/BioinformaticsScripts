library(ComplexHeatmap)
library(circlize)

setwd('/Users/n10337547/GitHub/BioinformaticsScripts/R/Heatmps')

# infile format
# genes (rows) x samples (cols) matrix
#infile = 'input_file.csv'
infile='/Users/n10337547/Downloads/test.csv'

# color key name 
ck = 'FPKM'


#output file
outfile = 'output_hm.jpeg'

# read data
df = read.csv(infile, stringsAsFactors = F)

mat = df[,c(2:ncol(df))]
mat = as.matrix(mat)
rownames(mat) = df[,1]

hcols = circlize::colorRamp2(c(0, 10, 20), c("blue", "white", "red"))
#hcols

jpeg(outfile, width = 8000, height = 5000, quality = 1000, res = 300)

hm = Heatmap(mat,
             # clustering
	           # T: Yes and F: NO 
             cluster_rows = T,
             cluster_columns = T,
             # clustering method : "pearson", "spearman" and "kendall"
	           clustering_distance_columns = "pearson",

             # cancer seperator
             # column_split = # for grouping replicates 
             # row_split = # for grouping genes 
             
             # sample names
             column_names_gp = gpar(fontsize = 15, fontface = "bold"),
             column_names_rot = 0,
             column_names_side = 'top',
             
             # gene names 
             row_names_side = 'right',
             row_names_gp = gpar(fontsize = 10),
             
             #Color key
             name = ck,
             col = hcols,
             
             heatmap_legend_param = list(title_position = "leftcenter",
                                         #legend_height = unit(30, "cm"),
                                         legend_width =  unit(5, "cm"),
                                         direction = "horizontal",
                                         grid_width = unit(50, "cm")
                                         )
             )

draw(hm, heatmap_legend_side='bottom')

dev.off()

