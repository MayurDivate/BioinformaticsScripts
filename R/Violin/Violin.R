library(ggplot2)

plotViolin <- function(df, outfile){
  p = ggplot(df, aes(gene, exp,  fill=label)) + geom_violin()
  p = p + theme(legend.position = 'none')
  p = p + coord_flip()
  p = p + facet_grid(~label)
  p = p + theme(strip.text.x = element_text(angle = 90, hjust = 0, size = 10, face='bold'))
  
  
  jpeg(outfile, height = 500, width = 1500, res = 100, quality = 2000)
  print(p)
  dev.off()
  print(outfileX)
  
}


#setwd('/path/dir')

# input file format
# label gene exp
# class genename fpkm value

fileX='input_file.csv'
genesX = 'gene_order.csv'

df = read.csv(fileX,stringsAsFactors = FALSE)
genes = read.csv(genesX,stringsAsFactors = FALSE)
labels = unique(genes[,1])

for( l in labels){
  outfileX = paste(l,'_violin.jpeg', sep='')
  gX = genes[genes[,1] == l, 2]
  dfX = df[df[,2] %in% gX,]
  plotViolin(dfX, outfileX)  
}