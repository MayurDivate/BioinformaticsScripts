library(ggplot2)

plotViolin <- function(df, outfile){
  p = ggplot(df, aes(gene, exp,  fill=label)) + geom_violin()
  p = p + theme(legend.position = 'none')
  p = p + coord_flip()
  p = p + facet_grid(~label)
  p = p + theme(strip.text.x = element_text(hjust = 0.5, size = 20, face='bold'))
  p = p + theme(axis.text.y = element_text(size = 20))
  jpeg(outfile, height = 5000, width = 8000, quality = 1000, res = 200)
  print(p)
  dev.off()
}


#setwd('/Path/dir')

# input file 
# label gene exp
fx = 'Vhm_107'
fileX= paste0(fx, '.csv')
gx = paste0(fx,'_gs.csv')
outfileX = paste0(fx, '.jpeg')

df = read.csv(fileX,stringsAsFactors = FALSE)
colnames(df) = c('label', 'gene', 'exp')

glevels = read.csv(gx)
df[,2] = factor(df[,2], levels = rev(glevels[,1]))

plotViolin(df, outfileX)

