function [xm] = NewtonsM(f, fder, x0, n, TOL)
    xm(1) = x0;
    fprintf('n \t approximation \n');
    for i = 2:n
        xm(i) = xm(i-1) - feval(f, xm(i-1)) / feval(fder, xm(i-1));
        
        absE = xm(i) - xm(i-1);
        if (absE < TOL)
            break;
        end
    end
end