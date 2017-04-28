% ----------------------------------------
% --------Initialize Visualization--------
% ----------------------------------------
track_scene = subplot(2,3,[1,4]);
title(track_scene, 'Track Scene');
im = imread('Racetrack.jpg');
im = rgb2gray(im);

% 
f_track = hgtransform;
% bg = imagesc(~rctrk(:,end:-1:1),'Parent',f); colormap gray;
bg = imagesc(track_scene, im(:,end:-1:1),'Parent',f_track);
S = makehgtform('scale',0.5);
R = makehgtform('zrotate',pi);
T = makehgtform('translate',[170 175 0]);
M = T*R*S;
f_track.Matrix = M;
axis image

view([-90 90]);
hold on

g_track = hgtransform;
r = rectangle(track_scene, 'Parent',g_track,'Position',[0 0 3.5 1.85],'FaceColor',[0 0 0]);
C = makehgtform('translate',[-1.75,-0.925,0]);
g_track.Matrix = C;
axis off

