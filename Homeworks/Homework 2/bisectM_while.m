function [xm] = bisectM_while(fun, xleft, xright, n, TOL)
    a = xleft;
    b = xright;
    fa = feval(fun, a);
    fb = feval(fun, b);
    
    xm = zeros(n);
    
    fprintf('n \t approximation \t function value \n');
    
    i = 1;
    absE = intmax;
    while i < n && absE > TOL
        xm(i) = (a + b)./2;
        fm = feval(fun, xm(i));
        
        fprintf('%d \t %12.8f \t %12.8f \n', i - 1, xm(i), fun(xm(i)))
        
        if (sign(fm) == sign(fa))
            a = xm(i);
            fa = fm;
        else
            b = xm(i);
            fb = fm;
        end
        
        if (i >= 2)
            absE = abs(xm(i) - xm(i-1));
        end
        i = i + 1;
    end
end
