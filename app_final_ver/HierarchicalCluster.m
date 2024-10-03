function [cluster_idx] = HierarchicalCluster(AM)
G = graph(AM);
D = distances(G);
tree = linkage(D, 'ward'); % Use Ward's method for linkage

k = 2;

cluster_idx = cluster(tree, 'maxclust', k);

end