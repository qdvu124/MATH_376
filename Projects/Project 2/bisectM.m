function [xm] = bisectM(fun, xleft, xright, n, TOL)
    a = xleft;
    b = xright;
    fa = feval(fun, a);
    fb = feval(fun, b);
    
    fprintf('n \t approximation \t error \n');
    
    for i = 1:n
        xm(i) = (a + b) ./ 2;
        fm = feval(fun, xm(i));
        error = Inf;
        if (i > 1)
            error = abs(xm(i) - xm(i-1));
        end
        relerror = error / abs(xm(i));
        fprintf('%d \t %12.8f \t %12.8f \n', i - 1, xm(i), relerror)
        if error < TOL
            break;
        end
        if (sign(fm) == sign(fa))
            a = xm(i);
            fa = fm;
        else
            b = xm(i);
            fb = fm;
        end
        
       
    end
end