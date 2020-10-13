library(ggplot2)


## example data frame
data <- c('Total', 'FPKM 1', 'FPKM 5' )
genes <- c(19801, 16286,13250)
df = data.frame(data, genes)
df

## or load from file 
# df = read.csv(infile)

p <- ggplot(df, aes(x= reorder(data, -genes), y=genes, fill=data)) 
p <- p + geom_bar(stat = 'identity',width = 0.6)
p <- p + theme(legend.position = 'none')
p <- p + ylab('Number of protein coding genes')
p <- p + theme(axis.ticks.x = element_blank())
p <- p + theme(axis.ticks.y = element_blank())
p <- p + theme(axis.text.x = element_text( size = 10,colour = 'black'))
p <- p + theme(axis.title.y = element_text( size = 10,colour = 'black'))
p <- p + xlab('') + geom_text(aes(label=genes), vjust=2)
p 


jpeg("BarChart.jpeg", height = 1500, width = 2400, res = 300, quality = 0.1)
print(p)
dev.off()



