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
sw_int = headingSMCLog(:,16);

xMax = timeVector(end);

% plot response
figure(1); clf; hold on;
subplot(3,2,1); hold on; grid on
ylim([0,1.2])
xlim([0,xMax])
ylabel({'$u$ [m/s]'},'Interpreter','latex')
plot(timeVector,forwardVel)

subplot(3,2,3); hold on; grid on
ylabel('$\psi$ [deg]','Interpreter','latex')
ylim([0,360])
xlim([0,xMax])
plot(timeVector,heading)
plot(timeVector,heading_demand,'--r')

subplot(3,2,5); hold on; grid on
ylabel('$r$ [rad/s]','Interpreter','latex')
ylim([-0.5,0.5])
xlim([0,xMax])
plot(timeVector,yawRate)
plot(timeVector,yawRateDemand,'--r')
xlabel('time [sec]','Interpreter','latex')

subplot(3,2,2); hold on; grid on
plot(timeVector, N_eq+N_sw)
ylim([-28,28])
xlim([0,xMax])
ylabel('$N$ [N.m]','Interpreter','latex')

subplot(3,2,4); hold on; grid on
plot(timeVector,u_R)
xlim([0,xMax])
ylabel('$\delta_{R}$','Interpreter','latex')

subplot(3,2,6); hold on; grid on
plot(timeVector,u_th)
% plot(timeVector,-u_th,'r')
ylabel('u$_{th}$','Interpreter','latex')
xlabel('time [sec]','Interpreter','latex')
xlim([0,xMax])

% plot phase portrait
figure(2); clf; hold on;
% subplot(2,1,1); hold on;
x2 = min(heading_error):0.1:max(heading_error);
h1 = 1;
h2 = 0.01*h1;
for i = 1:length(x2)
    x1(i) = -h2/h1*x2(i);
end

plot(x2,x1*180/pi,'r--')
plot(heading_error,(yawRate-yawRateDemand)*180/pi)
title('Phase Portrait')
xlabel('$\tilde{\psi}$ heading error [deg]','Interpreter','latex')
ylabel('$\tilde{r}$ [deg/s]','Interpreter','latex')
ylim([-30, 30])
legend('sliding surface','trajedtory')

% subplot(2,1,2) ; hold on;
% plot(timeVector, sw_int)