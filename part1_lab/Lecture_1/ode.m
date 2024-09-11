%constant
x_0 = 4;
k = 3/5;
max_t = 10;
min_t = 0;

%% step = 0.01
h = 0.01;

time = [0];
x_values = [x_0];

for i = 1:round(10/h)
    time = [time time(end)+h];
    x_values = [x_values x_values(end)-h*k*x_values(end)];
end

%% step = 0.03
h = 0.03;

time_2 = [0];
x_values_2 = [x_0];

for i = 1:round(10/h)
    time_2 = [time_2 time_2(end)+h];
    x_values_2 = [x_values_2 x_values_2(end)-h*k*x_values_2(end)];
end

%% ode45
[time_3,x_values_3] = ode45(@ode_function, [0,10], 4);

%% plot

figure;
plot(time,x_values, 'DisplayName','h = 0.01');
hold on;

plot(time_2, x_values_2, 'DisplayName', 'h = 0.03');
plot(time_3,x_values_3, 'DisplayName', 'ode45');
legend;
hold off;