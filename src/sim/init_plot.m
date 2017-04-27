% ----------------------------------------
% --------Initialize Visualization--------
% ----------------------------------------

load('rctrk.mat');
figure(1)

im = imread('Racetrack.jpg');
im = rgb2gray(im);

% 
f = hgtransform;
% bg = imagesc(~rctrk(:,end:-1:1),'Parent',f); colormap gray;
bg = imagesc(im(:,end:-1:1),'Parent',f);
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
r = rectangle('Parent',g,'Position',[0 0 3.5 1.85],'FaceColor',[0 0 0]);
C = makehgtform('translate',[-1.75,-0.925,0]);
g.Matrix = C;
drawnow
axis off

