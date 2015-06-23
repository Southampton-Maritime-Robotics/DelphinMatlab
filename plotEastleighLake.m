% function to plot the result obtain from lake trial

%% specify key reference points
% North pier of the Eastleigh lake (50.957024,-1.366769)
O = [-2,2];
A = [-28,12];
B = [-1,64];
M = (A+B)/2;
% South pier of the Eastleigh lake (50.956473,-1.366835)
% O = [-2,2];
% A = [-20,14];
% B = [-30,64];
% M = A-B;

%% trace
X = positionLog(:,2);
Y = positionLog(:,3);
Z = positionLog(:,4);

figure; hold on; grid on
plot(X,Y)
% plot reference points defined relative to the north pier of Eastleigh lake
plot(A(1),A(2),'r*')
plot(B(1),B(2),'r*')
plot(M(1),M(2),'r*')
plot(O(1),O(2),'g*')
title('Trace')
axis equal

%% actuator demand and response
timeTh = thrusterLog(:,1);
ver_frt = 2550/255*thrusterLog(:,2);
ver_aft = 2550/255*thrusterLog(:,3);
hor_frt = 2550/255*thrusterLog(:,4);
hor_aft = 2550/255*thrusterLog(:,5);
rpm_ver_frt = thrusterLog(:,6);
rpm_ver_aft = thrusterLog(:,7);
rpm_hor_frt = thrusterLog(:,8);
rpm_hor_aft = thrusterLog(:,9);

rpm_ver_frt = rpm_ver_frt.*sign(ver_frt);
rpm_ver_aft = rpm_ver_aft.*sign(ver_aft);
rpm_hor_frt = rpm_hor_frt.*sign(hor_frt);
rpm_hor_aft = rpm_hor_aft.*sign(hor_aft);

timeTail = tailLog(:,1);
prop = tailLog(:,10);
prop_rps = tailLog(:,12); % rps
rudder = tailLog(:,2); % cs_top
sternPlane = tailLog(:,4); % cs_stb

figure; hold on
subplot(4,1,1); hold on; grid on
plot(timeTail,prop)
plot(timeTail,prop_rps,'k.')
legend('demand','rps')
title('prop')
subplot(4,1,2); hold on; grid on
plot(timeTail,rudder,'r')
plot(timeTail,sternPlane,'b')
legend('rudder','sternPlane')
subplot(4,1,3); hold on; grid on
plot(timeTh,ver_frt,'r')
plot(timeTh,ver_aft,'b')
plot(timeTh,rpm_ver_frt,'k.')
plot(timeTh,rpm_ver_aft,'k.')
legend('ver\_frt','ver\_aft')
subplot(4,1,4); hold on; grid on
plot(timeTh,hor_frt,'r')
plot(timeTh,hor_aft,'b')
plot(timeTh,rpm_hor_frt,'k.')
plot(timeTh,rpm_hor_aft,'k.')
legend('hor\_frt','hor\_aft')

%% auv state
heading = compassLog(:,2);
pitch = compassLog(:,4);
timeCompass = compassLog(:,1);
depth = depthLog(:,4);
timeDepth = depthLog(:,1);

figure
subplot(3,1,1); hold on; grid on
plot(timeCompass,heading)
title('heading [deg]')
subplot(3,1,2); hold on; grid on
plot(timeCompass,pitch)
title('pitch [deg]')
subplot(3,1,3); hold on; grid on
plot(timeDepth,depth)
title('depth [m]')
xlabel('time [sec]')