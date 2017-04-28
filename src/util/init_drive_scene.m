% ----------------------------------------
% --------Initialize Visualization--------
% ----------------------------------------
figure(1)
drive_scene = subplot(2,3,[2,5]);
title(drive_scene,'Drive Scene');
im = imread('Racetrack.jpg');
im = rgb2gray(im);

% 
f = hgtransform;
% bg = imagesc(~rctrk(:,end:-1:1),'Parent',f); colormap gray;
bg = imagesc(drive_scene, im(:,end:-1:1),'Parent',f);
S = makehgtform('scale',0.5);
R = makehgtform('zrotate',pi);
T = makehgtform('translate',[170 175 0]);
M = T*R*S;
f.Matrix = M;
axis image

axis([-5,26,-16,15]);
view([-90 90]);
hold on

g = hgtransform;
r = rectangle(drive_scene, 'Parent',g,'Position',[0 0 3.5 1.85],'FaceColor',[0 0 0]);
C = makehgtform('translate',[-1.75,-0.925,0]);
g.Matrix = C;
axis off
