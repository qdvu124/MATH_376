function [xm] = falsePositionM(f, x0, x1, n, TOL)
    xm(1) = x0;
    xm(2) = x1;
    fprintf('n \t approximation \n');
    fprintf('%d \t %12.8f \t %12.8f\n', 0, xm(1), f(xm(1)))
    fprintf('%d \t %12.8f \t %12.8f\n', 1, xm(2), f(xm(2)))
    b = x0;
    a = x1;
    for i = 3:n
        xm(i) =  a - f(a) * (b - a) / (f(b) - f(a));            
        fprintf('%d \t %12.8f \t %12.8f\n', i - 1, xm(i), f(xm(i)));
        if (sign(f(xm(i))) == sign(f(a)))   
            a = xm(i);
        else
            b = xm(i);
        end
        absE = abs(xm(i) - xm(i-1));
        if (absE < TOL || f(xm(i)) == 0)
            break;
        end
    end
end