%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Modelling in Biology MATLAB Training excercise 2
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
hold off

%% Q1 - numerical solutions around x*=1


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ode45 (Runge-Kutta) solution starting from x=1.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Parameters:
boundaries = [0 4]; % range of integration
X0=1.1; %initial value

%Call ode45 using function handle, integration range and initial value.
%It will return an array of times and an array of X values at those times.
[T1 X1] = ode45(@myderivative2, boundaries, X0);

plot(T1,X1,'DisplayName', 'iv = 1.1');
hold on;

title('Time courses')
xlabel('Time t');
ylabel('x');


%% 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ode45 (Runge-Kutta) solution starting from x=0.9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Parameters:
boundaries = [0 4]; % range of integration
X0=0.9; %initial value

%Call ode45 using function handle, integration range and initial value.
%It will return an array of times and an array of X values at those times.
[T2 X2] = ode45(@myderivative2, boundaries, X0);

plot(T2,X2,"DisplayName", 'iv = 0.9');

%The fixed point is stable

%% Q2 Analytics of approximate solution near x*=1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Taylor expansion and analytical solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Taylor expansion around x*=1
%dx/dt = (2x*-3) (x-x*) = -(x-x*)

%initial value of x-x*=0.1

%Thus x - x* = 0.1 exp(-t) and x = x* + 0.1 exp(-t)
X1analytical = 1+ 0.1*exp(-T1);
plot(T1,X1analytical, 'Displayname','iv = 1.1 maybe ana');

legend
%initial value of x-x*=-0.1

%Thus x - x* = -0.1 exp(-t) and x = x* - 0.1 exp(-t)
X2analytical = 1- 0.1*exp(-T2);
plot(T2,X2analytical,'DisplayName','iv = 0.9 ana');
legend
%We see that the linearised ODEs approximate the exact solution pretty
%well.

%% Q3 trajectories near x*=2


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ode45 (Runge-Kutta) solution starting from x=2.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold off


figure(2);
%Parameters:
boundaries = [0 2]; % range of integration
X0=2.1; %initial value

%Call ode45 using function handle, integration range and initial value.
%It will return an array of times and an array of X values at those times.
[T1 X1] = ode45(@myderivative2, boundaries, X0);

plot(T1,X1,'DisplayName', 'iv = 2.1');
title('Time courses')
xlabel('Time t');
ylabel('x');

hold on;

%% 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ode45 (Runge-Kutta) solution starting from x=1.9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Parameters:
boundaries = [0 2]; % range of integration
X0=1.9; %initial value

%Call ode45 using function handle, integration range and initial value.
%It will return an array of times and an array of X values at those times.
[T2 X2] = ode45(@myderivative2, boundaries, X0);

plot(T2,X2,'DisplayName', 'iv = 1.9');

%The fixed point is unstable

%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Taylor expansion and analytical solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Taylor expansion around x*=2
%dx/dt = (2x*-3) (x-x*) = (x-x*)

%initial value of x-x*=0.1

%Thus x - x* = 0.1 exp(t) and x = x* + 0.1 exp(t)
X1analytical = 2+ 0.1*exp(T1);
plot(T1,X1analytical,'DisplayName', 'iv = 2.1 ana');


%initial value of x-x*=-0.1

%Thus x - x* = -0.1 exp(t) and x = x* - 0.1 exp(t)
X2analytical = 2- 0.1*exp(T2);
plot(T2,X2analytical,'DisplayName', 'iv = 1.9 ana');

legend
%We see that the linearised ODEs approximate the exact solution pretty
%well closed to the fixed point, but less well as you move further away.