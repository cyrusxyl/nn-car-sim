steer_response = subplot(2,3,3);
h = plot(steer_response, s, zeros(classes,1))
axis(steer_response, [-0.3,0.3,0,0.3])
title(steer_response,'Steering Response');
xlabel(steer_response,'Steering Angle (rad)');
ylabel(steer_response,'Network Response');

steer_record = subplot(2,3,6);
steer_plot = animatedline(steer_record,'MaximumNumPoints',200,'Parent',gca);
title(steer_record,'Steering');
xlabel(steer_record,'Time (s)');
ylabel(steer_record,'Steering Angle (rad)');