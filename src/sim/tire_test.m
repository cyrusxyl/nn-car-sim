m = 2010;           % mass (kg)
L = 2.45;          % wheelbase (m)
g = 9.81;     

b = 0.98;        % CoG to rear axle
a = 1.47;            % CoG to front axle
G_front = m*g*b/L;   % calculated load or specify front rear load directly
G_rear = m*g*a/L;

C_x = 200000;          % longitude stiffness
C_alpha = 1200000;      % laternal stiffness
Iz = 3994; % roatation inertia
mu = 1.1;   
mu_spin = 0.6; 

Ux = 10;
K = [];
Fx = [];
Fy = [];
for Ux_cmd = 0:0.01:20
    [Fxr,Fyr] = tire_dyn(Ux, Ux_cmd, mu, mu_spin, G_rear, C_x, C_alpha, 0);
    K = [K,(Ux_cmd-Ux)/abs(Ux)];
    Fx = [Fx, Fxr];
end

for alpha = -1:0.01:1
    [Fxr,Fyr] = tire_dyn(Ux, Ux, mu, mu_spin, G_rear, C_x, C_alpha, alpha);
    Fy = [Fy, Fyr];
end

subplot(2,1,1);
plot(K,Fx);
title('Longitude Tire Force Analysis')

subplot(2,1,2);
plot(-1:0.01:1,Fy);
title('Lateral Tire Force Analysis')