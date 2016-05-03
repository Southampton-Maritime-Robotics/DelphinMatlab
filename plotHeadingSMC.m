% function to visualise the performance of the headingPID controller

timeVector = headingSMCLog(:,1);
heading = headingSMCLog(:,2); %  deg
yawRate = headingSMCLog(:,3); % rad/s
forwardVel = headingSMCLog(:,4);
swayVel = headingSMCLog(:,5);
controller_onOff = headingSMCLog(:,6);
heading_demand = headingSMCLog(:,7);
heading_error = headingSMCLog(:,8);
yawRateDemand = headingSMCLog(:,9);
s = headingSMCLog(:,10);
s_dot = headingSMCLog(:,11);
N_eq = headingSMCLog(:,12);
N_sw = headingSMCLog(:,13);
u_R = headingSMCLog(:,14);
u_th = headingSMCLog(:,15);

% plot response
figure(1); clf; hold on;
subplot(5,1,1); hold on; grid on
ylabel({'$u$ [m/s]'},'Interpreter','latex')
plot(timeVector,forwardVel)
subplot(5,1,2); hold on; grid on
ylabel('$\psi$ [deg]','Interpreter','latex')
plot(timeVector,heading)
plot(timeVector,heading_demand,'--r')
% legend('actual','demand','Location','SouthEast')
subplot(5,1,3); hold on; grid on
ylabel('$r$ [rad/s]','Interpreter','latex')
plot(timeVector,yawRate)
plot(timeVector,yawRateDemand,'--r')
subplot(5,1,4); hold on; grid on
plot(timeVector,u_R)
ylabel('$\delta_{R}$','Interpreter','latex')
subplot(5,1,5); hold on; grid on
plot(timeVector,u_th)
ylabel('u$_{th}$','Interpreter','latex')

% plot phase portrait
x2 = min(heading_error):0.1:max(heading_error);
h1 = 1;
h2 = 0.01*h1;
for i = 1:length(x2)
    x1(i) = -h2/h1*x2(i);
end
figure(2); clf; hold on;
% subplot(2,1,1); hold on;
plot(x2,x1*180/pi,'r--')
plot(heading_error,(yawRate-yawRateDemand)*180/pi)
title('Phase Portrait')
xlabel('$\tilde{\psi}$ heading error [deg]','Interpreter','latex')
ylabel('$\tilde{r}$ [rad/s]','Interpreter','latex')
ylim([-15, 15])
legend('sliding surface','trajedtory')