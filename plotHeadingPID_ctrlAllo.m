% function to visualise the performance of the headingPID controller

time_heading = headingPID_ctrlAllo_Log(:,1);
heading = headingPID_ctrlAllo_Log(:,2);
yawRate = headingPID_ctrlAllo_Log(:,3);
forwardVel = headingPID_ctrlAllo_Log(:,4);
swayVel = headingPID_ctrlAllo_Log(:,5);
heading_demand = headingPID_ctrlAllo_Log(:,6);
error = headingPID_ctrlAllo_Log(:,7);
N_Pterm = headingPID_ctrlAllo_Log(:,8);
N_Iterm = headingPID_ctrlAllo_Log(:,9);
N_Dterm = headingPID_ctrlAllo_Log(:,10);
CS_demand = headingPID_ctrlAllo_Log(:,11);
Thruster0 = headingPID_ctrlAllo_Log(:,12);
Thruster1 = headingPID_ctrlAllo_Log(:,13);
controller_onOff = headingPID_ctrlAllo_Log(:,14);

figure(1); clf; hold on;
subplot(4,1,1); hold on; grid on
plot(time_heading,heading_demand,'r--')
plot(time_heading,heading)
title('heading [deg]')
legend('heading\_demand','heading\_current')

subplot(4,1,2); hold on; grid on
plot(time_heading,N_Pterm)
plot(time_heading,N_Dterm,'r')
title('thruster demand')
legend('thrust\_Pterm','thrust\_Dterm')

subplot(4,1,3); hold on; grid on
plot(time_heading,Thruster0)
plot(time_heading,Thruster1,'r')
title('thruster setpoint (saturated)')
legend('thruster0','thruster1')

subplot(4,1,4); hold on; grid on
plot(time_heading,CS_demand)
title('control surface demand')
