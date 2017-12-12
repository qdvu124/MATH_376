clear all;
close all;

H = 30;
intervals = 6;
h = H / intervals;
f = @(z) 200 .* (z / (5 + z)) .* exp(-2 .* z / H);
fz = @(z) 200 .* (z.^2 / (5 + z)) .* exp(-2 .* z / H);

% Part a, using Trapezoidal rule
current_x = 0;
F = 0;
Fz = 0;
for i=1:(intervals + 1)
   mult = 1;
   if i ~= 1 && i ~= (intervals + 1)
       mult = 2;
   end
   F = F + f(current_x) * mult;
   Fz = Fz + fz(current_x) * mult;
   current_x = current_x + h;
end
F = F * h / 2
% 1.4027e+03
% Error term is f''(c) * h.^2 * 30 / 12
Fz = Fz * h / 2;
d = Fz / F
% 13.7199
% Part b, using the composite Simpson's rule
current_x = 0;
F = 0;
Fz = 0;
for i=1:(intervals + 1)
   mult = 1;
   if i == 1 || i == (intervals + 1)
       mult = 1;
   elseif mod(i,2) == 0
       mult = 4;
   else
       mult = 2;
   end
   F = F + f(current_x) * mult;
   Fz = Fz + fz(current_x) * mult;
   current_x = current_x + h;
end
F = F * h / 3
% 1.4629e+03
% Error term is f''''(c) * h.^4 * 30 / 180 
Fz = Fz * h / 3;
d = Fz / F
% = 13.2662