function plotClusterGraph(x,y,ax, AM, cluster_idx, nodePositions,titleText)
    
    G = graph(AM);
    
    h = plot(ax, G, 'NodeCData', cluster_idx, 'MarkerSize', 5, 'XData', nodePositions(:,1), 'YData', nodePositions(:,2));
    colormap(ax, jet(max(cluster_idx)));
    
    newEdgeIndex = findedge(G, x, y);
    highlight(h, 'Edges', newEdgeIndex, 'EdgeColor', 'r', 'LineWidth', 2);
    
   
    title(ax, titleText);
end