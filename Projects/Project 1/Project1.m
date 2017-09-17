clear all;
close all;
clc;

format long;

% File path is hard-coded. Please put the data file in the same folder
% for this to work
fid = fopen('MaunaLoa.dat','r');
data = textscan(fid, '%f%f%f', 'HeaderLines', 22);
year = data{1};
mean = data{2};
unc = data{3};
NO_OF_YEAR = length(year);

pH = zeros([1 NO_OF_YEAR]);

% Defining constants to use
KH = 10^(-1.46);
K1 = 10^(-6.3);
K2 = 10^(-10.3);
Ko = 10^(-14);

% Since pH lies between 2 and 12, [H+] lies between 1e-12 and 1e-2
upperBound = 1e-2;
lowerBound = 1e-12;

% Tolerance of 1e^-10 should be enough. This is TOL for [H+].
% Having 10 correct decimal places for [H+] ensures at least 2 correct for pH 
% (as we are taking log10, a small change in [H+] leads to an even smaller 
% change in pH). We are taking 1e-10 since our search space is inherently
% small, and taking 1e-2 would terminate the search prematurely
TOL = 1e-10;

% Loop through the year, extract current level of CO2, and calculate pH
for i = 1:NO_OF_YEAR
   currentYear = year(i);
   CO2 =  mean(i);
   f = @(x) (KH * K1 * CO2 + 10^6 * Ko) ./ (x * 10^6) + (2 * KH * K1 * K2 * CO2) ./ (x.^2 * 10^6) - x;
   pH(i) = -log10(bisectM(f, lowerBound, upperBound, 300, TOL));
end

pH(1)
pH(NO_OF_YEAR)
x = linspace(1959, 2016, NO_OF_YEAR);
fid = fopen('output.csv', 'wt');
fprintf(fid, '%s,%s\n', 'Year','pH');
fclose(fid);
output = horzcat(x(:), pH(:));
dlmwrite('output.csv', output, 'delimiter', ',','-append');
polyfit(x, pH, 2)
plot(x, pH, 'k.-');
xlabel('Year');
ylabel('pH');
title('Graph of pH of rainwater for each year from 1959 to 2016');

function result = bisectM(fun, xleft, xright, n, TOL)
    a = xleft;
    b = xright;
    fa = feval(fun, a);
    fb = feval(fun, b);
    
    %fprintf('n \t approximation \n');
    
    for i = 1:n
        xm(i) = (a + b)./2;
        result = xm(i);
        fm = feval(fun, xm(i));
        
        %fprintf('%d \t %12.12f \n', i - 1, xm(i))
        
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
                return;
            end
        end
    end
end

