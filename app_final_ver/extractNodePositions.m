function nodePositions = extractNodePositions(originalGraph, UIAxes)
    h = plot(UIAxes, originalGraph, 'Layout', 'force');
    nodePositions = [h.XData' h.YData']; 
end

