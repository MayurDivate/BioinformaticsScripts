library(ggplot2)

### input file format
# sample_id,component1,componenet2,class_name

infile = 'Clustering_components.csv'
outfile = 'Clustering.jpg'

df = read.csv(infile)
colnames(df) = c('sample_id', "c1", "c2", "label")


clusters = aggregate(df[,c(2,3)], list(df$label), median)
colnames(clusters) = c('cancer', 'c1', 'c2')

p = ggplot(NULL, aes(c1, c2)) 
p = p + theme_bw()
p = p + geom_point(data = df, aes(colour = factor(label)))
p = p + geom_text(data = clusters, aes(label = cancer) , fontface='bold')
p = p + theme(axis.title = element_blank())
p = p + theme(axis.text = element_blank())
p = p + theme(axis.ticks = element_blank())
p = p + theme(legend.position = "none")
p = p + theme(rect = element_blank())
p = p + theme(plot.background = element_rect(fill = "transparent"),
              panel.background = element_rect(fill = "transparent",colour = NA),
              panel.grid.major = element_blank(), 
              panel.grid.minor = element_blank())



jpeg("clust1.jpg", height = 2500, width = 2500, res = 300)
print(p)
dev.off()
