function [x] = FalsePosition(f, x0, x1, n, tol)
    x(1) = x0;
    x(2) = x1;
    a = x0;
    b = x1;
    for i = 3:n
        x(i) = a - f(a) * (a - b) / (f(a) - f(b));

        fprintf('%d \t %12.8f \t %12.8f\n', i - 2, x(i), f(x(i)));
        if (sign(f(x(i))) == sign(f(b)))
            b = x(i);
        else
            a = x(i);
        end
        if i > 3
           error = abs(x(i) - x(i-1));
           if (error < tol || f(x(i)) == 0)
               break;
           end
        end 
    end
end