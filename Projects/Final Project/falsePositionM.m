function [xm] = falsePositionM(f, x0, x1, n, TOL)
    xm(1) = x0;
    xm(2) = x1;
    fprintf('n \t approximation \t error \n');
    b = x0;
    a = x1;
    for i = 3:n
        xm(i) =  a - f(a) * (b - a) / (f(b) - f(a));
        error = Inf;
        if i > 3
            error = abs(xm(i) - xm(i-1));
        end
        relerror = error / abs(xm(i-1));
        fprintf('%d \t %12.8f \t %12.8f\n', i - 3, xm(i), relerror);
        if (error < TOL || f(xm(i)) == 0)
            break;
        end
        if (sign(f(xm(i))) == sign(f(a)))   
            a = xm(i);
        else
            b = xm(i);
        end
       
    end
end