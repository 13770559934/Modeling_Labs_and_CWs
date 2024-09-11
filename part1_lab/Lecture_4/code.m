mu = [0, 0.03, 7];
y_0 = [10, 2];
figure(1);

hold on;
figure(2);
hold on;
for i = mu
    [time, y_values] = ode45(@(time, y_value) ode_function(time, y_value, i),  [0,100], y_0);
    
    figure(1);plot(time, y_values(:,2), 'DisplayName', sprintf('mu = %d', i));

    figure(2);plot(y_values(:,1), y_values(:,2) , 'DisplayName', sprintf('mu = %d', i))

end

legend;
hold off;
hold off;