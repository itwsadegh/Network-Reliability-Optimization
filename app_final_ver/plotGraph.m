function plotGraph(ax, AM, x, y, titleText)
    G = graph(AM);
    p = plot(ax, G);
    %highlight(p, x, y, 'EdgeColor', 'r', 'LineWidth', 2);
    title(ax, titleText);
    xlabel(ax, 'Node Index');
    ylabel(ax, 'Node Index');
    axis(ax, 'equal');
end
