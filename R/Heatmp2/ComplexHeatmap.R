library('ComplexHeatmap')
library(circlize)

setwd('/Users/mayurdivate/QUT/data_verify')

infile = 'BRAIN_hm.csv'
gx = 'BRAIN_hm_csep.csv'
outfile = 'BRAIN_hm.jpeg'


df = read.csv(infile)
csep = read.csv(gx)

head(df[,c(1:5)])

mat = as.matrix(t(df))

max(df)

# colors
hcols=colorRampPalette(c("gray", "orange"))(3)
hcols2=colorRampPalette(c('orange', 'red'))(10)
hcols = c(hcols[0:2], hcols2)
hcols


# restrict colors within a range
#hcols = circlize::colorRamp2(c(0, 2, 4), c("gray", "orange", "red"))
#hcols

jpeg(outfile, width = 8000, height = 5000, quality = 1000, res = 300)

hm = Heatmap(mat,
             # clustering 
             cluster_rows = T,
             cluster_columns = T,
             
             # cancer seperator
             column_split = csep['label'],
             
             # Cancer names
             column_names_gp = gpar(fontsize = 20, fontface = "bold"),
             #column_title_rot = 90,
             
             # gene names 
             #row_names_rot = 45,
             row_names_gp = gpar(fontsize = 2, fontface = "bold"),
             
             #Color key
             name = 'FPKM',
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

