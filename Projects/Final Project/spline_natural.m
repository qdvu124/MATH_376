function [result] = spline_natural(x, y)
    [k, n] = size(x);
    [l, m] = size(y);
    if n ~= m || k ~= l
        error('Wrong arguments given. Exiting');
    end
    % Matrix to hold results. bi is at entry 3 * (i-1) + 1, ci is at 3 *
    % (i-1) + 2, di is at 3 * (i-1) + 3
    result = zeros(3 * (n - 1), 1);
    
    % Matrix to hold all equations
    eq = zeros(3 * (n-1), 3 * (n-1));
    
    % Column vector to hold the constants of the equations
    const = zeros(3 * (n - 1), 1);
    % constructing equations according to the first property
    % Use a currentInterval variable to keep track of what intervals we are
    % dealing with
    
    % Use currentEquation to keep track of which equation we are
    % constructing
    
    currentEquation = 1;
    % Applying endpoint conditions (natural)
    eq(currentEquation, 2) = 2;
    currentEquation = currentEquation + 1;
    for currentInterval=1:n-1
        % Construct equation according to the first property
        xdiff = x(currentInterval + 1) - x(currentInterval);
        ydiff = y(currentInterval + 1) - y(currentInterval);
        % bi
        eq(currentEquation, 3 * (currentInterval - 1) + 1) = xdiff;
        % ci
        eq(currentEquation, 3 * (currentInterval - 1) + 2) = xdiff.^2;
        % di
        eq(currentEquation, 3 * (currentInterval - 1) + 3) = xdiff.^3;
        % constant
        const(currentEquation) = ydiff;
        currentEquation = currentEquation + 1;
        
        if currentInterval ~= n - 1
            % Construct equation according to the second property
            eq(currentEquation, 3 * (currentInterval - 1) + 1) = 1;
            eq(currentEquation, 3 * (currentInterval - 1) + 2) = 2 * xdiff;
            eq(currentEquation, 3 * (currentInterval - 1) + 3) = 3 * xdiff.^2;
            eq(currentEquation, 3 * (currentInterval - 1) + 4) = -1;
            currentEquation = currentEquation + 1;
            % Construct the equation according to the third property
            eq(currentEquation, 3 * (currentInterval - 1) + 2) = 2;
            eq(currentEquation, 3 * (currentInterval - 1) + 3) = 6 * xdiff;
            eq(currentEquation, 3 * (currentInterval - 1) + 5) = -2;
            currentEquation = currentEquation + 1;
        end
        
        if currentInterval == n - 1
            % Apply last endpoint condition (natural)
            eq(currentEquation, 3 * (currentInterval - 1) + 2) = 2;
            eq(currentEquation, 3 * (currentInterval - 1) + 3) = 6 * xdiff;
            currentEquation = currentEquation + 1;
        end
    end
    cond(eq)
    result = eq\const;
end