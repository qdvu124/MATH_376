clear all;
close all;
clc;

% File path is hard-coded. Please put the data file in the same folder
% for this to work
fid = fopen('MaunaLoa.dat','r');
data = textscan(fid, '%f%f%f', 'HeaderLines', 22);
year = data{1};
mean = data{2};
unc = data{3};
NO_OF_YEAR = length(year)
