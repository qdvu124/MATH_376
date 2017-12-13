function [x] = GE(A, b, ptol)

% Gauss elimination and back sub

% No pivoting is used

% INPUT
% A =  coefficient matrix; b = constant matrix;
% ptol = [optional], tolerance for detection of zero pviot
% set [Default ] ptol = 50 * eps

% OUTPUT
% x = solution vector, if solution exists

if nargin<3, ptol = 50*eps; end
[m,n] = size(A);
if m ~= n, error('Matrix A must be square'); end
Ab = [A b]; % Augmented matrix
fprintf('\n Begin GE with augmented matrix:\n');
disp(Ab);

% Elimination
for i = 1:(n-1)
    pivot = Ab(i,i);
    if abs(pivot) < ptol
        fprintf("Partial pivoting");
        for k = i+1:n
            if abs(Ab(k,i)) > ptol
               swapRow(Ab, i, k);
            end
        end
    end
    
    for k = (i+1):n % j = index of next row to be eliminated
        M = Ab(k,i)/pivot;
        Ab(k, i:(n+1)) = Ab(k, i:(n+1)) - M * Ab(i, i:(n+1));
    end
end

disp(Ab);

% Back substitution
x = zeros(n,1); % initialize x
x(n) = Ab(n, n+1)/Ab(n,n);

for j=(n-1):-1:1
	x(j) = (Ab(j, n+1) - Ab(j, (j+1:n)) * x(j+1:n))./Ab(j, j);
end
