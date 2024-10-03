function [cluster_idx,C] = clusterKmeans(AM)
G = graph(AM);
D = distances(G);
k = 2;
[cluster_idx, C] = kmeans(D, k,'Distance','cityblock','Replicates',3);
end