function [xm] = fixedpointM(g, x0, n, TOL)
    xm(1) = x0;
    for i = 2:n
        xm(i) = g(xm(i-1));
        absE = abs(xm(i) - xm(i-1));
        relerror = absE / abs(xm(i-1));
        fprintf('%d \t %12.8f \t %12.8f \n', i - 1, xm(i), relerror)
        if (absE < TOL)
            break;
        end
    end
end