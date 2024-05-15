# Load DESeq2 library
library(DESeq2)

counts_data <- read.table("feature_count/combined_counts.txt", header=TRUE, row.names=1)

head(counts_data)

colData <- read.table("colData.txt")

# makeing sure the row names in colData matches the column names in counts_data
all(colnames(counts_data) %in% rownames(colData))

# are they in the same order?
all(colnames(counts_data) == rownames(colData)) 

# construct a DESeqDataSet object 
dds <- DESeqDataSetFromMatrix(countData = counts_data,
                       colData = colData,
                       design = ~ Type )
dds
rownames(dds)


# pre-filtering: removing rows with low gene counts
# keep rows with at least 10 reads total
keep <- rowSums(counts(dds)) >= 10
keep

dds <- dds[keep,]
dds

# run DESeq -------------------
dds <- DESeq(dds)

res <- results(dds)

res

# explore results ------------
summary(res)

#change alpha to 0.01 instead of 0.1
res0.01 <- results(dds, alpha = 0.01)
summary(res0.01)

# MA plot 
plotMA(res)

# Transform 
# log2(n + 1)
ntd <- normTransform(dds)

vsd <- vst(dds, blind=FALSE)
head(assay(vsd, 3))

# Heatmap 
library("pheatmap")
select <- order(rowMeans(counts(dds, normalized=TRUE)),
                decreasing=TRUE)[1:20]

df <- as.data.frame(colData(dds)[,c("Type", "Sample")])

#ntd
pheatmap(assay(ntd)[select,], cluster_rows = FALSE, show_rownames = TRUE, 
         cluster_cols = FALSE, annotation_col = df)

#vsd
pheatmap(assay(vsd)[select,], cluster_rows = FALSE, show_rownames = TRUE, 
         cluster_cols = FALSE, annotation_col = df)

# PCA plot
plotPCA(ntd, intgroup=c("Type", "Sample"))

