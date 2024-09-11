function output = ode_function(t, y, mu)
    output = zeros(2,1);
    output(1) = - mu * y(1) - y(2);
    output(2) = y(1);
end