library(gplots)

#setwd('/path/dir/Heatmp2')
input_file = 'RNAseq_expression.csv'
df =  read.csv(input_file, sep = ',', stringsAsFactors = F, nrows = 5)
rownames(df) = df[,1]
df = df[,-1]
nrow(df)


mat = as.matrix(df)
mat = mat[, c(1:500)]

hcols=colorRampPalette(c("black","red"))(5)
col_breaks = c(
  seq(-1,0, length=2),
  #seq(-0.4, 3,length=15),
  seq(0.1,5,length=4)
)




lmatx <- rbind( c(4,3), c(2,1) )
lheix <- c(0.2, 0.8)
lwidx <- c(0.2, 0.8)

jpeg('Gtest.jpg', width = 4000, height = 2500, quality = 2000, res=300)

heatmap.2(
  log(mat+1,10),
  trace = "none",
  Rowv = FALSE,
  Colv = FALSE,
  #dendrogram = 'col',
  #RowSideColors = sample_cols,
  #labRow = FALSE,
  labCol= FALSE,
  #scale='row',
  col= hcols,
  breaks = col_breaks,
  key.title = 'log10(FPKM+1)',
  main = "Expression of signature genes",
  tracecol="red",
  symkey = F,
  lmat =lmatx,
  colsep = c(50,100,150),
  sepwidth = c(0.00000001,0.1),
  lhei = lheix,
  lwid = lwidx)

dev.off()

