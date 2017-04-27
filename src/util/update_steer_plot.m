figure(2);
subplot 211
plot([-0.3:.02:0.3],y1);
% title('Steering Response');
% xlabel('Steering Angle (rad)');
% ylabel('Network Response');

subplot 212
addpoints(steer_plot,t,steer);
axis([t-5,t+5,-0.3,0.3])