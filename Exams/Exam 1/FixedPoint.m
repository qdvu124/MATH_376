function [x] = FixedPoint(f, x0, n, TOL)
    x(1) = x0;
    for i = 2:n
        x(i) = f(x(i-1));
        fprintf('%d \t %12.8f \t %12.8f \n', i - 1, x(i), f(x(i)))
        error = abs(x(i) - x(i-1));
        if (error < TOL)
            break;
        end
    end
end