[t, x] = ode45(@ode_function, [0,4], 1.1);
[t_2, x_2] = ode45(@ode_function, [0,4], 0.9);


h = 0.01;

time_3 = [0];
x_values_3 = [1.1];

for i = 1:round(10/h)
    time_3 = [time_3 time_3(end)+h];
    x_values_3 = [x_values_3 x_values_3(end)-h*];
end

%% plot
figure; 
plot(t,x, 'DisplayName', 'x(0) = 1.1');
hold on;
plot(t_2, x_2, "DisplayName", 'x(0) = 0.9');

legend;
hold off;