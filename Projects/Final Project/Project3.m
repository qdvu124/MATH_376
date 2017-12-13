format long;

A = [225, 0, -25, 0; 0, 175, 0, -125; 225, 0, -275, 50; 0, 25, 250, -275]
b = [1400; 100; -2000; 0];

TOL = 10e-6;
% Using Gaussian Elimination 
GE(A, b, TOL)

% Using LU Factorization
[L, U] = lu(A);
y =  L\b;
x = U\y

% Using the Jacobi method
initial = [1; 1; 1; 1]
Jacobi(A, b, initial, 30, TOL);

% Finding inverses of the matrix
disp(inv(A));

% Question e
b1 = [400; 100; 0; 0];
[L, U] = lu(A);
y =  L\b1;
x = U\y


A1 = [225, 0, -25, 0; 0, 155, 0, -105; 225, 0, -275, 50; 0, 5, 250, -255]
GE(A1, b, TOL)
