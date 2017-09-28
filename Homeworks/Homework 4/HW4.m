clear all;
clear clc;
close all;
format long;

% Testing for written part
f = @(x) x.^2 - x - 3;
secantM(f, 1.7, 1.67, 30, 1e-6);

clear all;
f = @(x) -x.^3 - cos(x);
secantM(f, -1.5, -1.52, 30, 1e-6);