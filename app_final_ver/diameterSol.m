function [i, j, oldDiameter, newDiameter, rel, AM] = diameterSol(AM, time, step, seed, lambda_link, mu_link, lambda_node, mu_node)
    rng(seed);
    G = graph(AM);
    D = distances(G);
    diameter = max(D(:));
    oldDiameter = diameter;
    [maxRow, maxCol] = find(D == diameter);
    idx = randi(length(maxCol));
    i = maxRow(idx);
    j = maxCol(idx);
    AM(i, j) = 1;
    AM(j, i) = 1;
    G = graph(AM);
    D = distances(G);
    diameter = max(D(:));
    newDiameter = diameter;
    [x, y] = find(D == diameter,1);
    rel = Simulator_linkandnodefailure_rrt(AM, time, step, seed, lambda_link, mu_link, lambda_node, mu_node);

    % Print the output values using fprintf
    fprintf('i: %d\n', i);
    fprintf('j: %d\n', j);
    fprintf('oldDiameter: %f\n', oldDiameter);
    fprintf('newDiameter: %f\n', newDiameter);
    fprintf('rel: %f\n', rel);
    fprintf('AM:\n');
    disp(AM);  % Assuming fprintf can print matrices or use an alternative if necessary
end
