% ----------------------------------------
% --------Initialize Visualization--------
% ----------------------------------------

load('rctrk.mat');
figure(1)
% 
f = hgtransform;
bg = imagesc(rctrk(:,end:-1:1),'Parent',f); colormap gray;
S = makehgtform('scale',0.5);
R = makehgtform('zrotate',pi);
T = makehgtform('translate',[170 175 0]);
M = T*R*S;
f.Matrix = M;
axis image
view([-90 90]);
% axis([-10,10,-10,10])
hold on

g = hgtransform;
r = rectangle('Parent',g,'Position',[0 0 3.5 1.85],'FaceColor',[1 1 1]);
C = makehgtform('translate',[-1.75,-0.925,0]);
g.Matrix = C;
drawnow


