library("rjson")
library("igraph")

### Read parameters ###
A = commandArgs(trailingOnly = TRUE)
input_file = A[1]
output_file = A[2]


### Import data and make graph ###
g = read.csv(file = input_file, header = FALSE, sep = " ")
g = as.matrix(g)
g = graph_from_edgelist(g, directed = FALSE)
g = simplify(g)
g = delete_vertices(g, which(degree(g)==0))


### Assign a community ID to each remaining node ###
communities_g = cluster_infomap(g)
members = membership(communities_g)


### Save the Twitter IDs within each community ###
communities.list.IDs = vector("list", max(members))
names(communities.list.IDs) = as.character(1:max(members))
for(i in 1:max(members)) communities.list.IDs[[i]] = names(members[which(communities_g$membership==i)])


### Export to JSON ###
exportJSON = toJSON(communities.list.IDs)
write(exportJSON, file = output_file)

