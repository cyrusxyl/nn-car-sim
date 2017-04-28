% ----------------------------------------
% ----------Update Track View-------------
% ----------------------------------------
pos_x = x(1);
pos_y = x(2);
pos_phi = wrapToPi(x(3));

T = makehgtform('translate',[x(1),x(2),0]);
R = makehgtform('zrotate',pos_phi);

g_track.Matrix = T*R*C;