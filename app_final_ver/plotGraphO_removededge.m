function plotGraphO_removededge(x, y, UIAxes, newGraph, nodePositions, titleText)
    newGraph = rmedge(newGraph, x, y);

    h = plot(UIAxes, newGraph, 'XData', nodePositions(:,1), 'YData', nodePositions(:,2));

    xlabel(UIAxes, 'Node Index');
    ylabel(UIAxes, 'Node Index');
    axis(UIAxes, 'equal');
    title(UIAxes, titleText);
end


