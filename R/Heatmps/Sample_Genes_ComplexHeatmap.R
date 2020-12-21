library(ComplexHeatmap)
library(circlize)

#setwd('')

# infile format
# genes (rows) x samples (cols) matrix
infile = 'input_file.csv'

# color key name 
ck = 'FPKM'


#output file
outfile = 'output_hm.jpeg'

# read data
df = read.csv(infile)

head(df[,c(1:5)])

mat = as.matrix(t(df))

max(df)

#hcols = circlize::colorRamp2(c(-2, 0, 2), c("blue", "white", "red"))
#hcols

jpeg(outfile, width = 8000, height = 5000, quality = 1000, res = 300)

hm = Heatmap(mat,
             # clustering
	     # T: Yes and F: NO 
             cluster_rows = T,
             cluster_columns = T,
             # clustering method : "pearson", "spearman" and "kendall"
	     clustering_distance_columns = "pearson"

             # cancer seperator
             # column_split = # for grouping replicates 
             # row_split = # for grouping genes 
             
             # sample names
             column_names_gp = gpar(fontsize = 20, fontface = "bold"),
             #column_title_rot = 90,
             
             # gene names 
             #row_names_rot = 45,
             row_names_gp = gpar(fontsize = 2, fontface = "bold"),
             
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

