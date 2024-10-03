function plotGraphO(x, y, UIAxes, newGraph, nodePositions, titleText)
    h = plot(UIAxes, newGraph, 'XData', nodePositions(:,1), 'YData', nodePositions(:,2));
    
    newEdgeIndex = findedge(newGraph, x, y);
    
    highlight(h, 'Edges', newEdgeIndex, 'EdgeColor', 'r', 'LineWidth', 2);
    xlabel(UIAxes, 'Node Index');
    ylabel(UIAxes, 'Node Index');
    axis(UIAxes, 'equal');
    title(UIAxes, titleText);
end

