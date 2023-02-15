#Basic dendrogram
source("/Users/oushiei/Desktop/论文终稿/finalcode/dendro_data_k.R")
source("/Users/oushiei/Desktop/论文终稿/finalcode/font and theme.R")

dfm_my=dfm_trim(all_pattern_2gram, min_termfreq = 20)
dist_tmp = dfm_weight(dfm_my, scheme = "prop") %>% convert(to="data.frame")
dist_tmp

rownames(dist_tmp) <- dist_tmp$doc_id
dddd$doc_id <- NULL
dddd

tree <- dddd%>% 
  dist() %>% 
  hclust()
#==========
# first
#==========
hcdata <- dendro_data_k(tree, 6)
plot_ggdendro(hcdata,
              direction   = "lr",
              expand.y    = 0.2)

cols <- c("#a9a9a9", "#1f77b4", "#ff7f0e", "#2ca02c","black","red","lightblue")

p <- plot_ggdendro(hcdata,
                   direction   = "tb",
                   scale.color = cols,
                   label.size  = 2.5,
                   branch.size = 0.5,
                   expand.y    = 0.2)

p <- p + theme_void() + expand_limits(x = c(-1, 20))
p
#==========
# seconde
#==========

dend <- tree %>% 
  as.dendrogram()
dend %>% 
  plot()
par(mar=c(4,4,2,5))
dend %>% 
  set('branches_k_color', k=6) %>% 
  plot(horiz = T)


# クラスタリング
cluster <- cutree(tree=tree,k=6)
n_cluster <- length(table(cluster))
cluster <- cluster[order.dendrogram(dend)]

# カラーパレットの作成
cluster_color_palette <- viridis::plasma(n_cluster)
cluster_color <- cluster_color_palette[cluster]
names(cluster_color) <- names(cluster)

# デンドログラムのカスタマイズ
dend<- dend %>% 
  set("labels_colors", cluster_color[names(cluster)]) 
for (i in seq_len(n_cluster)){
  dend <- dend %>% 
    set("by_labels_branches_col", 
        names(cluster[cluster == i]),
        TF_values = cluster_color_palette[i]
    )
}
plot(dend, horiz = FALSE)

