clc
clear all

%% Parameters
L = 1; % Length of axon in mm
D = 1e-4; % Diffusion coefficient in mm^2/s
delta_t = 1; % Time step in seconds
num_trajectories = 10000; % Number of trajectories to simulate



% Preallocation
diffusion_times = zeros(num_trajectories, 1);


%% q2.4
% Simulation
for i = 1:num_trajectories
    x = L/2; % Initial position of the protein
    while x > 0 && x < L
        delta_x = sqrt(2 * D * delta_t) * randn;
        x = x + delta_x;
        diffusion_times(i) = diffusion_times(i) + delta_t;
    end
end

edges = 0:75:max(diffusion_times);
% Histogram of diffusion times
histogram(diffusion_times,edges, 'Normalization', 'pdf');
title('PDF of Diffusion Times');
xlabel('Diffusion Time (s)');
ylabel('Probability Density');
grid on;


%% q2.5

mean_diff = mean(diffusion_times);
var_diff = var(diffusion_times);

%% q3.1

v = 1/mean_diff;

figure(2)

% Define the function
p = @(t) v * exp(-v * t);

% Plot the function over a specified range of t
% For example, from t = 0 to 10000 seconds
t_range = linspace(0, 10000, 10000);
plot(t_range, p(t_range),"LineWidth",1,'DisplayName','PDF for decay');

hold on

[f, xi] = ksdensity(diffusion_times);

plot(xi,f,'LineWidth',1,'DisplayName','PDF for defusion')

% Add labels and title
xlabel('Time(s)');
ylabel('Probability Density');
title('Comparison between distribution of decay and diffusion');
grid on;
xlim([0, 9000])
legend




%% q3.3

t_dec = -log(rand(num_trajectories,1))./ v;
faster = t_dec < diffusion_times;
prob = sum(faster)/num_trajectories;


%% q3.4
new_diff = [];
new_dec = [];
for i = 1:num_trajectories
    if t_dec(i) > diffusion_times(i)%%diff before dec
        new_diff = [new_diff diffusion_times(i)];
    end
    if t_dec(i) < diffusion_times(i)%%dec before diff
        new_dec = [new_dec t_dec(i)];
    end
end

new_mean_dec = sum(new_dec)/length(new_dec);
new_mean_diff = sum(new_diff)/length(new_diff);
