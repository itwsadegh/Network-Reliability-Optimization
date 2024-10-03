function resultMatrix_rem = rem_modifymat(network, i, j)
    if ~ismatrix(network) || size(network, 1) ~= size(network, 2)
        error('First input must be a square matrix.');
    end
    
    n = size(network, 1); 
    if ~isscalar(i) || i <= 0 || i > n || ~isscalar(j) || j <= 0 || j > n
        error('node1 and node2 must be scalar integers within the matrix dimensions.');
    end

    resultMatrix_rem = network;
    resultMatrix_rem(i, j) = 0;
    resultMatrix_rem(j, i) = 0;
end

