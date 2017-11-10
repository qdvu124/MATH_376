function [x] = GaussSeidel(A, b, initial, n, TOL)

    if nargin<3, TOL = 50*eps; end
    [row, col] = size(A);
    if row ~= col, error('Invalid matrix'); end
    Ab = [A b]; % Augmented matrix
    fprintf('\n Augmented matrix:\n');
    disp(Ab);
    x = zeros(1, col);
    prev = zeros(1, col);
    for i = 1:col
        x(i) = initial(i);
    end

    for i = 1:n
        for j = 1:row
            prev(j) = x(j);
        end
        for j = 1:row
            coefficient = Ab(j,j);
            current = Ab(j, col + 1);
            for k = 1:col
                if (k == j)
                    continue;
                end
                current = current - x(k) * Ab(j, k);
            end
            new_value = current / coefficient;
            x(j) = new_value;
        end
        if norm(x - prev, inf) < TOL
            break;
        end
        fprintf(i + " ");
        disp(x);
    end
