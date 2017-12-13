function [xm] = NewtonsM(f, fder, x0, n, TOL)
    xm(1) = x0;
    fprintf('n \t approximation \t error \n');
    for i = 2:n
        xm(i) = xm(i-1) - f(xm(i-1)) / fder(xm(i-1));
        error = abs(xm(i) - xm(i-1));
        relerror = error / abs(xm(i-1));
        fprintf('%d \t %12.8f \t %12.8f \n', i - 1, xm(i), relerror)
        if (error < TOL)
            break;
        end
    end
end