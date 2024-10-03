function [x, y, rel, AM] = bruteforceSol(AM, time, step, seed, lambda_link, mu_link, lambda_node, mu_node)
    l = size(AM, 1);
    I = 1:l;

    rels = zeros(l, l);

    for j = 1:l
        for k = j+1:l
            if AM(I(j), I(k)) ~= 1
                AM(I(j), I(k)) = 1;
                AM(I(k), I(j)) = 1;
                rels(j, k) = Simulator_linkandnodefailure_rrt(AM, time, step, seed, lambda_link, mu_link, lambda_node, mu_node);
                AM(I(j), I(k)) = 0;
                AM(I(k), I(j)) = 0;
            end
        end
    end
    rel = max(rels(:));
    [x, y] = find(rels == rel,1);
    AM(x, y) = 1;
    AM(y, x) = 1;
    
    
    % fprintf('x: %d\n', x);
    % fprintf('y: %d\n', y);
    % fprintf('rel: %f\n', rel);
    % fprintf('AM:\n');
    % disp(AM);  
end
