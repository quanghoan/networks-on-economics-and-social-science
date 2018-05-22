# need to install some relevant packages
library(rmatio)
library(igraph)
library(R.matlab)

#This part is to play with some statical analysis in several graph (4 graphs), let check 10th, 40th, 110th and 150th grapth in the dataset
for (i in c(10, 40,110,150)) {
  input = paste("/home/harry/R/adjacentMatrix/adj_mat_",i,".mat", sep="")
  mat = read.mat(file = input)
  checkna = is.nan(mat$adj)
  chk = mat$adj>0
  adjstar=mat$adj
  adjstar[which(chk)] = 1
  adjstar[which(checkna)] = 0
  net = graph_from_adjacency_matrix(adjstar)

  ######################################

  dg = degree(net, mode="all")
  n=vcount(net)
  density = ecount(net)/(n*(n-1))
  diameter = diameter(net, directed = TRUE)
  mean_distance = mean_distance(net)
  title = paste("n=", n, "density=",density,"diameter=",diameter,"mean_distance=",mean_distance)

  ######################################
  
  vcol = rep("grey80", n)
  #vcol[unlist(largest_cliques(net))] = "red"

  l = layout_with_fr(net)

  plot(net, vertex.label=NA, vertex.color=vcol, cex.main=3.5, main=title, edge.arrow.size=.02, vertex.size=(dg*20/n), edge.curved=0.2, layout=l, rescale=T)
}

# This part is to implement node degree and degree distribution in all graphs
degree_average = c()
degree = c()
for (i in c(1:210)) {
  input = paste("/home/harry/R/adjacentMatrix/adj_mat_",i,".mat", sep="")
  mat = read.mat(input)
  adjstar=mat$adj
  net = graph_from_adjacency_matrix(adjstar)
  
  node_number = vcount(net)
  dg = degree(net, mode="all")
  sum = sum(dg)
  degree_average = append(degree_average,c(sum/node_number))
  degree=append(degree,c(dg))
  
}

#display some plots and histograms correspondings to the degree average with a collection 100 graphs
boxplot(degree, ylab="Degree", main="Boxplot of degree")
boxplot(degree_average, ylab = "Degree average", main = "Boxplot of Degree average")
plot(degree_average, ylab = "Degree average", xlab = "Graph number")
hist(degree_average,main="Histogram of node degree", xlab = "Degree average")

# Degree Distribution
deg.dist <- degree_distribution(net, cumulative=T, mode="all")
plot(x=0:max(dg), y=1-deg.dist, pch=19, cex=1.2, col="orange",xlab="Degree", ylab="Cumulative Frequency")