figure(2)
subplot 211
subplot 212
steer_plot = animatedline('MaximumNumPoints',200,'Parent',gca);
title('Steering');
xlabel('Time (s)');
ylabel('Steering Angle (rad)');