close all;

% Question 2
    A = [2 -1 1; 3 3 9; 3 3 5];
    b1 = [3 6 10]';
    b2 = [1 21 13]';
    disp(A)
    [L, U] = lu(A);
    disp(L)
    disp(U)
    A\b1
    A\b2
% Question 2
     A = [2 -1 1; 3 3 9; 3 3 5];
     [L, U, P] = lu(A);
     disp(L)
     disp(U)
     disp(P)
     clear clc;
     A = [1 1 -1 0; 1 1 4 3; 1 1 -1 0; 2 -1 2 3];
     [L, U, P] = lu(A);
     disp(L)
     disp(U)
     disp(P)
     
    