library(loomR)
library(ggplot2)
loom <- connect(filename='GSM4363298_7053cells_highquality_ovary.loom', 
                mode='r+')

# list of all barcodes with pseudotime data & expression results
barcodes <- sampleNames(test@phenoData)
expression_matrix <- loom[['matrix']][1:7053,1:11782]

# finding the gene with the most overall expression
avg_exp <- (0)
for (i in 1:11782) {
  
  gene_exp <- mean(expression_matrix[1:7053, i])
  avg_exp <- c(avg_exp, gene_exp)
  
}
# the 'Vm26Aa' gene is expressed the highest
max_exp <- max(avg_exp)
gene_index <- which(avg_exp == max_exp) - 1 #minus one because index
gene <- loom[['row_attrs']][['Gene']][gene_index]

# matching barcodes in dataset with psuedotime barcodes
exp_plotting <- c()
for (i in 1:1666){
  
  barcode <- barcodes[i]
  loom_bc_index <-which(loom[['col_attrs']][['CellID']][1:7053] == barcode)
  exp_plotting <- c(exp_plotting, expression_matrix[loom_bc_index, gene_index])
  
}
# plotting this highly expressed gene over it's pseudotime result
pseudo_time <- test@phenoData@data$Pseudotime
plotting_df <- data.frame(pseudotime=pseudo_time, expression=exp_plotting)
p <- ggplot(plotting_df, aes(x=pseudotime, y=expression)) + geom_point()
p + labs(title=sprintf('expression of %s gene over psuedotime', gene))
