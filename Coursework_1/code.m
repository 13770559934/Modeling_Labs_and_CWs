% Main script
rho = 1;  % Value of rho
tspan = [0 6];  % Time interval

% Initial conditions
init_conditions = [-2 -4; 0.9 0.9; 0 0.5; -0.9 -1.1; -3 -5.5; -0.5 0.1; -3 -];


% Solve the system for each set of initial conditions
for i = 1:size(init_conditions, 1)
    % Solve the differential equation
    [t, y] = ode45(@dynamical_system, tspan, init_conditions(i, :));
    
    % Plot the results
    figure(1);
    hold on;
    plot(y(:,1), y(:,2),'DisplayName',sprintf('IC: (%.1f, %.1f)', init_conditions(i,:)));
end
xlabel('x');
ylabel('y');
% Plot the nullclines
x_nullcline = linspace(-15, 15, 400);
y_nullcline = x_nullcline;
plot(x_nullcline, y_nullcline, 'r--', 'DisplayName', 'x-nullcline'); 
plot([sqrt(rho), sqrt(rho)], [-15, 15], 'g--', 'DisplayName', 'y-nullcline_1'); 
plot([-sqrt(rho), -sqrt(rho)], [-15, 15], 'g--', 'DisplayName', 'y-nullcline_2');
title('Trajectories of the Dynamical System');
grid on;
hold off;
xlim([-100,100]);
ylim([-100,100]);
legend

function dydt = dynamical_system(t, y)
    dydt = [y(1) - y(2); y(1)^2 - 1];
end
