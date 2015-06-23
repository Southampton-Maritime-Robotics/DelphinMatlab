% function to visualise the performance of the headingPID controller

time_heading = headingPIDLog(:,1);
heading = headingPIDLog(:,2);
heading_demand = headingPIDLog(:,4);
Thrust_Pterm = headingPIDLog(:,22);
Thrust_Dterm = headingPIDLog(:,24);

Thruster0 = headingPIDLog(:,26);
Thruster1 = headingPIDLog(:,27);

time_thruster = thrusterLog(:,1);
Thruster0_measured = thrusterLog(:,8);
Thruster1_measured = thrusterLog(:,9);
dir0 = sign(thrusterLog(:,4));
dir1 = sign(thrusterLog(:,5));
Thruster0_measured = dir0.*Thruster0_measured;
Thruster1_measured = dir1.*Thruster1_measured;

x_max = time_heading(end,1);

subplot(4,1,1); hold on; grid on
plot(time_heading,heading_demand,'r--')
plot(time_heading,heading)
title('heading [deg]')
xlim([0,x_max])
legend('heading\_demand','heading\_current')

subplot(4,1,2); hold on; grid on
plot(time_heading,Thrust_Pterm)
plot(time_heading,Thrust_Dterm,'r')
title('thruster demand')
xlim([0,x_max])
legend('thrust\_Pgain','thrust\_Dgain')

subplot(4,1,3); hold on; grid on
plot(time_heading,Thruster0)
plot(time_heading,Thruster1,'r')
title('thruster setpoint (saturated)')
xlim([0,x_max])
legend('thruster0','thruster1')

subplot(4,1,4); hold on; grid on
plot(time_thruster,Thruster0_measured)
plot(time_thruster,-Thruster1_measured,'r')
title('thruster rpm feedback')
xlim([0,x_max])
legend('thruster0','thruster1')