function [result] = DividedDif(xinit, yinit)
    [a, n] = size(xinit);
    [b, m] = size(yinit);
    if n ~= m
        error('Invalid initial values');
    end
    result = zeros(n, n);
    for i=1:n
        result(i, i) = yinit(i);
    end
    
    for i=(n-1):-1:1
        for j=(i+1):n
            result(i, j) = (result(i+1, j) - result(i, j-1)) ./ (xinit(j) - xinit(i));
        end
    end
end
    
    
    