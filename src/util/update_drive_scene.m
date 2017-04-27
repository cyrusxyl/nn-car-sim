% ----------------------------------------
% ----------Update Visualization----------
% ----------------------------------------
figure(1);

pos_x = x(1);
pos_y = x(2);
pos_phi = wrapToPi(x(3));

T = makehgtform('translate',[-x(1),-x(2),0]);
R = makehgtform('zrotate',-pos_phi);

f.Matrix = R*T*M;
% 
% g.Matrix = T*R*C;
% axis([pos_x-25,pos_x+25,pos_y-25,pos_y+25])
axis([-5,26,-16,15]);