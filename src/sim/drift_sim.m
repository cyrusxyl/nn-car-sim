% Cyrus Liu
% the Robotics Institute, Carnegie Mellon University
% 01/22/2017

% Vehicle Drifting Dynamics Simulation

init_plot;

% --------Initialize Joystick--------
joy = vrjoystick(1)
x = [0;0;0;0;0;0];
dt = 0.02;

throttle = 0;
steer = 0;

while ~button(joy,2)     
    
    % --------Use Joystick Input--------
    throttle = 10;
    steer = -0.6*axis(joy,1);
    if button(joy,1)
        pause()   
    end 
    
    % ------Calculate Car Dynamics------
    u = [throttle; steer];
    x = dynamics_finite(x,u,dt);
    
    update_plot;
end