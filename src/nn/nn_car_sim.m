% Cyrus Liu
% the Robotics Institute, Carnegie Mellon University
% 01/22/2017

% Vehicle Drifting Dynamics Simulation

init_plot;
record = true;
% --------Initialize Joystick--------
joy = vrjoystick(1)
x = [0;0;0;0;0;0];
dt = 0.05;

throttle = 0;
steer = 0;

data = {};
labels = [];

%%

t = 1;
while ~button(joy,1)     
    
    % --------Use Joystick Input--------
    throttle = 10;
    
    frame = getframe(gca);
    
    im = frame.cdata;
    im = imresize(im,[32 32]);
    im = rgb2gray(im);
    im = im2double(im);
    x1 = reshape(im, 1024, 1);
    
    y1 = matlab_nn(x1);
    [a,Idx] = max(y1);
    steer = (Idx-1)*0.02 - 0.3;
    
    % ------Calculate Car Dynamics------
    u = [throttle; steer];
    x = dynamics_finite(x,u,dt);
    
    update_plot;
    pause(0.01);
    t = t+1;
end