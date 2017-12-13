function [xm] = bisectM(fun, xleft, xright, n, TOL)
    a = xleft;
    b = xright;
    fa = feval(fun, a);
    fb = feval(fun, b);
    
    fprintf('n \t approximation \n');
    
    for i = 1:n
        xm(i) = (a + b)./2;
        fm = feval(fun, xm(i));
        
        fprintf('%d \t %12.10f \n', i - 1, xm(i))
        
        if (sign(fm) == sign(fa))
            a = xm(i);
            fa = fm;
        else
            b = xm(i);
            fb = fm;
        end
        
        if (i >= 2)
            absE = abs(xm(i) - xm(i-1));
            if absE < TOL
                break;
            end
        end
    end
end