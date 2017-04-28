% Cyrus Liu
% the Robotics Institute, Carnegie Mellon University
% 01/22/2017

% Vehicle Drifting Dynamics Simulation

init_drive_scene;
init_track_scene;
init_steer_plot;

% --------Initialize Joystick--------
joy = vrjoystick(1)
x = [0;0;0;0;0;0];
dt = 0.1;

throttle = 0;
steer = 0;

data = {};
labels = [];

classes = 31;
s = linspace(-0.3,0.3,classes);


%%

t = 0;
while ~button(joy,1)     
    % --------Use Joystick Input--------
    throttle = 10;
    
    frame = getframe(drive_scene);
    
    im = frame.cdata;
    im = imresize(im,[32 32]);
    im = rgb2gray(im);
    im = im2double(im);
    x1 = reshape(im, 1024, 1);
    
%     y1 = matlab_nn(x1);
    y1 = Classify(W,b,x1');
    [~,Idx] = max(y1);
    steer = s(Idx);
    
    % ------Calculate Car Dynamics------
    u = [throttle; steer];
    x = dynamics_finite(x,u,dt);
    
    figure(1)
    update_drive_scene;
    update_track_scene;
    update_steer_plot;
%     pause(0.01);
    t = t+dt;
end