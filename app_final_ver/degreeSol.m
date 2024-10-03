function [x,y,rel,AM] = degreeSol(AM, time, step, seed, lambda_link, mu_link, lambda_node, mu_node)
G = graph(AM);
deg = degree(G);
[b,I] = sort(deg);
idx = I (b==min(b));
l = size(idx,1);
rels = zeros(l,l);

for j = 1:l
    for k = j+1:l
        if AM(idx(j),idx(k)) ~= 1
            AM(idx(j),idx(k)) = 1;
            AM(idx(k),idx(j)) = 1;
            rels(j,k) = Simulator_linkandnodefailure_rrt(AM, time, step, seed, lambda_link, mu_link, lambda_node, mu_node);
            AM(idx(j),idx(k)) = 0;
            AM(idx(k),idx(j)) = 0;
        end
    end
end
rel = max(rels(:));
[i,j] = find(rels == rel,1);
x = idx(i);
y = idx(j);
AM(x,y) = 1;
AM(y,x) = 1;


fprintf('x: %d\n', x);
fprintf('y: %d\n', y);
fprintf('rel: %f\n', rel);
fprintf('AM:\n');
disp(AM); 
end