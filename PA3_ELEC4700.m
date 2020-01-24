% Parameters
Pd = 0.05; % Probability of electron deflection
Ne = 100; % Number of electroncs
dt = 1E-6; % Timestep
tmax = 1E-3; % End time
E_q = 1.60217662E-19; % coulombs (charge of electron)
E_m = 9.11E-31; % kg (mass of electron)
Field = 1E5; % Volt/m (extrally induced electric field)

% State variables
E_p = zeros(Ne, 1); % Electron position
E_v = zeros(Ne, 1); % Electron velocity

% Set plot title
subplot(3,1,1);
title('Electron Position');
ylabel('Displacement (m)');
hold on;
subplot(3,1,2); 
title('Electron Velocity');
ylabel('Velocity (m/s)');
hold on;
subplot(3,1,3); 
title('Drift Velocity');
ylabel('Velocity (m/s)');
xlabel('time (s)');
hold on;
    
% Simulation loop
for t=0:dt:tmax 
    % Calculate time step
    E_p = E_p + E_v*dt;
    E_v = E_v + (E_q*Field/E_m)*dt;
    
    % Scatter electrons
    E_v(rand(Ne,1) < Pd) = 0;
    
    % Calculate Drift velocity
    V_p = mean(E_v);
    
    % Plotting stuff %
    % plot position
    subplot(3,1,1);
    plot(repmat(t, Ne ,1), E_p, 'bX');
    hold on;
    
    % Plot velocity
    subplot(3,1,2); 
    plot(repmat(t, Ne ,1), E_v, 'rO');
    hold on;

    
    % Plot drift velocity
    subplot(3,1,3); 
    plot(t, V_p,'gX');
    hold on;
    
    pause(0.01);
end