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
subplot(3,2,1); hold on; grid on
ylim([0,1.2])
xlim([0,xMax])
ylabel({'$u$ [m/s]'},'Interpreter','latex')
plot(time_heading,forwardVel)

subplot(3,2,3); hold on; grid on
plot(time_heading,heading_demand,'r--')
plot(time_heading,heading)
ylim([200,360])
xlim([0,xMax])
ylabel('$\psi$ [deg]','Interpreter','latex')

subplot(3,2,5); hold on; grid on
ylabel('$r$ [rad/s]','Interpreter','latex')
ylim([-0.5,0.5])
xlim([0,xMax])
plot(time_heading,yawRate)
xlabel('time [sec]','Interpreter','latex')

subplot(3,2,2); hold on; grid on
plot(time_heading,N_Pterm+N_Dterm)
ylim([-28,28])
xlim([0,xMax])
ylabel('$N$ [N.m]','Interpreter','latex')

subplot(3,2,4); hold on; grid on
plot(time_heading,CS_demand)
ylabel('$\delta_{R}$','Interpreter','latex')
ylim([-32,32])
xlim([0,xMax])
xlabel('time [sec]')

subplot(3,2,6); hold on; grid on
plot(time_heading,Thruster0)
plot(time_heading,Thruster1,'r')
ylim([-2600,2600])
xlim([0,xMax])
ylabel('u$_{th}$','Interpreter','latex')
% legend('thruster0','thruster1')