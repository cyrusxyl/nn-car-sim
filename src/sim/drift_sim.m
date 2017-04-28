% Cyrus Liu
% the Robotics Institute, Carnegie Mellon University
% 01/22/2017

% Vehicle Drifting Dynamics Simulation

init_drive_scene;
record = false;
% --------Initialize Joystick--------
joy = vrjoystick(1)
x = [0;0;0;0;0;0;0];
dt = 0.02;

throttle = 0;
steer = 0;

data = {};
labels = [];

%%

t = 1;
while ~button(joy,1)     
    
    % --------Use Joystick Input--------
    throttle = 10;
    steer = -0.5*axis(joy,1);
    if button(joy,1)
        pause()   
    end 
    
    % ------Calculate Car Dynamics------
    u = [throttle; steer];
    x = dynamics_finite(x,u,dt);
    
    update_drive_scene;
    if record
        data{t} = getframe(gca);
        labels(t) = steer;
    end
    pause(0.01);
    t = t+1;
end