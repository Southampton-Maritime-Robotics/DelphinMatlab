% function to visualise the performance of the headingPID controller

time_heading = headingPIDLog(:,1);
heading = headingPIDLog(:,2);
heading_demand = headingPIDLog(:,4);
Thrust_Pterm = headingPIDLog(:,22);
Thrust_Dterm = headingPIDLog(:,24);

Thruster0 = headingPIDLog(:,26);
Thruster1 = headingPIDLog(:,27);

CS_Pterm = headingPIDLog(:,14);
CS_Dterm = headingPIDLog(:,16);
CS_demand = headingPIDLog(:,17);

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
ylim([-1,1]*3e5)
legend('thrust\_Pterm','thrust\_Dterm')

subplot(4,1,3); hold on; grid on
plot(time_heading,Thruster0)
plot(time_heading,Thruster1,'r')
title('thruster setpoint (saturated)')
xlim([0,x_max])
ylim([-1,1]*2e3)
legend('thruster0','thruster1')

subplot(4,1,4); hold on; grid on
plot(time_heading,CS_Pterm)
plot(time_heading,CS_Dterm,'r')
plot(time_heading,CS_demand,'k')
title('control surface demand')
xlim([0,x_max])
ylim([-1,1]*35)
legend('cs\_Pterm','cs\_Dterm','cs\_demand')