clear all;
close all;
% Question 4
    m = 80;
    A = 0.55;
    C = 1.1;
    z = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20, 25, 30, 40];
    rho = [1.225, 1.112, 1.007, .9093, .8194, .7364, .6601, .5900, .5258, .4671, .4135, .1948, .08891, .04008, .01841, .003996];
    v = zeros(16, 1);
    for i=1:16
        v(i) =  sqrt((9.806412 - 0.003039734 * z(i)) * m / (0.5 * rho(i) * A * C));
    end
    
    disp(v)
    zz = 0:0.5:40;
    vv = spline(z, v, zz);
    plot(z, v, 'o', zz, vv);
    title('Graph of terminal velocity versus elevation');
    ylabel('Terminal velcity, m/s');
    xlabel('Elevation, m');