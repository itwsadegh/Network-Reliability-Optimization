function resultMatrix = removelink(network, i, j)
    if ~ismatrix(network) || size(network, 1) ~= size(network, 2)
        error('First input must be a square matrix.');
    end
    
    n = size(network, 1); 
    
    if ~isscalar(i) || i <= 0 || i > n || ~isscalar(j) || j <= 0 || j > n
        error('node1 and node2 must be scalar integers within the matrix dimensions.');
    end

    if network(i, j) == 0 && network(j, i) == 0
        error('There is no link between these two nodes to remove.');
    end

    resultMatrix = network;
    
    resultMatrix(i, j) = 0;
    resultMatrix(j, i) = 0;
end
