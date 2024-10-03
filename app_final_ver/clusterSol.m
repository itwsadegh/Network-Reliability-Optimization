function [x, y, rel, AM] = clusterSol(AM, cluster_idx, time, step, seed, lambda_link, mu_link, lambda_node, mu_node)
    l = size(AM, 1);
    I = 1:l;

    rels = zeros(l, l);

    for j = 1:l
        for k = j+1:l
            if AM(I(j), I(k)) ~= 1 && cluster_idx(j) ~= cluster_idx(k)
                AM(I(j), I(k)) = 1;
                AM(I(k), I(j)) = 1;
                rels(j, k) = Simulator_linkandnodefailure_rrt(AM, time, step, seed, lambda_link, mu_link, lambda_node, mu_node);
                AM(I(j), I(k)) = 0;
                AM(I(k), I(j)) = 0;
            end
        end
    end
    rel = max(rels(:));
    [x, y] = find(rels == rel, 1);
    AM(x, y) = 1;
    AM(y, x) = 1;

    % Print the output values using fprintf
    fprintf('Best Link x: %d\n', x);
    fprintf('Best Link y: %d\n', y);
    fprintf('Reliability: %f\n', rel);
    fprintf('Adjacency Matrix after adding the best link:\n');
    disp(AM);  % Display the updated adjacency matrix
end
