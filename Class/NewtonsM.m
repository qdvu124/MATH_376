function [xm] = NewtonsM(f, fder, x0, n, TOL)
    xm(1) = x0;
    fprintf('n \t approximation \n');
    for i = 2:n
        xm(i) = xm(i-1) - f(xm(i)) / fder(xm(i-1));
        fprintf('%d \t %12.8f \t %12.8f \n', i - 1, xm(i), f(xm(i)))
        absE = abs(xm(i) - xm(i-1));
        if (absE < TOL)
            break;
        end
    end
end