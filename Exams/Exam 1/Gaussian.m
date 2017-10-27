function [x] = Gaussian (A, b, ptol);
    if nargin < 3
        ptol = 50 * eps;
    end

    [m,n] = size(A);

    if m ~= n
        error('Error, size mismatch');
    end

    [l, k] = size(b);

    if k ~= 1 || l ~= n
        error('b is not a column vector or does not match with A');
    end

    Ab = [A b];

    for i = 1:(n-1)
        pivot = Ab(i, i);
        if abs(pivot) < ptol
            continue;
        end
        for k = (i+1):n
            mult = Ab(k, i) / pivot;
            Ab(k, i:(n+1)) = Ab(k, i:(n+1)) - mult * Ab(i, i:(n+1));
        end
    end
    
    x = zeros(n, 1);
    x(n) = Ab(n, n+1) / Ab(n, n);
    for i = (n-1):-1:1
        x(i) = (Ab(i, n+1) - Ab(i, (i+1):n) * x((i+1):n)) ./ Ab(i,i)
    end
end