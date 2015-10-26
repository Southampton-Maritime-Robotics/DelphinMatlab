% function to visualise the performance of the depthPitchPID controller

time_depth = depthPitchMPCLog(:,1);
depth = depthPitchMPCLog(:,3);
depth_demand = depthPitchMPCLog(:,4);
pitch = depthPitchMPCLog(:,5);
pitch_demand = depthPitchMPCLog(:,6);
pitch_speed = depthPitchMPCLog(:,7);
speed = depthPitchMPCLog(:,8);
speed_demand = depthPitchMPCLog(:,9);
prop = depthPitchMPCLog(:,10);
dprop = depthPitchMPCLog(:,11);
ddelta = depthPitchMPCLog(:,12);
delta = depthPitchMPCLog(:,13);
dT0 = depthPitchMPCLog(:,14);
dT1 = depthPitchMPCLog(:,15);
T0 = depthPitchMPCLog(:,16);
T1 = depthPitchMPCLog(:,17);
thruster0 = depthPitchMPCLog(:,18);
thruster1 = depthPitchMPCLog(:,19);
Np = depthPitchMPCLog(:,20);
Nc = depthPitchMPCLog(:,21);
delta_t = depthPitchMPCLog(:,22);
propSP = depthPitchMPCLog(:,23);
Xf1 = depthPitchMPCLog(:,24);
Xf2 = depthPitchMPCLog(:,25);
Xf3 = depthPitchMPCLog(:,26);
Xf4 = depthPitchMPCLog(:,27);
Xf5 = depthPitchMPCLog(:,28);
Xf6 = depthPitchMPCLog(:,29);
Xf7 = depthPitchMPCLog(:,30);
Xf8 = depthPitchMPCLog(:,31);


figure(1)

subplot(4,1,1); hold on; grid on
plot(time_depth,depth)
plot(time_depth,depth_demand,'--r')
title('depth')
legend('actual','demand')
%xlim([x_min, x_max])

subplot(4,1,2); hold on; grid on
plot(time_depth,speed)
plot(time_depth,speed_demand,'--r')
title('speed')
legend('actual','demand')

subplot(4,1,3); hold on; grid on
plot(time_depth,pitch)
title('pitch')
legend('pitch angle')
% xlim([x_min, x_max])
subplot(4,1,4); hold on; grid on
plot(time_depth,propSP,'r')
plot(time_depth,T0,'b')
plot(time_depth,T1,'k')
plot(time_depth,delta,'g')
title('actutor')
legend('propellor','front thruster','back thruster','rudder')





% time_depth = depthPitchPIDLog(:,1);
% depth = depthPitchPIDLog(:,2);
% depth_demand = depthPitchPIDLog(:,3);
% 
% Thrust_Pterm = depthPitchPIDLog(:,11);
% Thrust_Iterm = depthPitchPIDLog(:,12);
% Thrust_Dterm = depthPitchPIDLog(:,13);
% Thrust_Sum = depthPitchPIDLog(:,14);
% 
% pitch = depthPitchPIDLog(:,18);
% pitch_demand = depthPitchPIDLog(:,19);
% 
% Pitch_Pterm = depthPitchPIDLog(:,27);
% Pitch_Iterm = depthPitchPIDLog(:,28);
% Pitch_Dterm = depthPitchPIDLog(:,29);
% cr = depthPitchPIDLog(:,30);
% 
% pitchBias = depthPitchPIDLog(:,15);
% pitchBias_Pterm = depthPitchPIDLog(:,17).*depthPitchPIDLog(:,4);
% pitchBias_Dterm = depthPitchPIDLog(:,43).*depthPitchPIDLog(:,6);
% 
% Thruster0 = depthPitchPIDLog(:,33);
% Thruster1 = depthPitchPIDLog(:,34);
% 
% cs_Pterm = depthPitchPIDLog(:,39);
% cs_Iterm = depthPitchPIDLog(:,40);
% cs_Dterm = depthPitchPIDLog(:,41);
% cs_demand = depthPitchPIDLog(:,42);
% 
% time_thruster = thrusterLog(:,1);
% Thruster0_measured = thrusterLog(:,6);
% Thruster1_measured = thrusterLog(:,7);
% dir0 = sign(thrusterLog(:,2));
% dir1 = sign(thrusterLog(:,3));
% Thruster0_measured = dir0.*Thruster0_measured;
% Thruster1_measured = dir1.*Thruster1_measured;
% 
% x_min = 0;
% x_max = time_thruster(end);
% 
% %% plot
% figure(1)
% 
% subplot(4,1,1); hold on; grid on
% plot(time_depth,depth)
% plot(time_depth,depth_demand,'r--')
% title('depth')
% legend('actual','demand')
% xlim([x_min, x_max])
% 
% subplot(4,1,2); hold on; grid on
% plot(time_depth,Thrust_Pterm)
% plot(time_depth,Thrust_Iterm,'r')
% plot(time_depth,Thrust_Dterm,'k')
% plot(time_depth,Thrust_Sum,'g')
% title('depth controller terms (thrusters)')
% legend('P\_term','I\_term','D\_term','sum')
% xlim([x_min, x_max])
% 
% subplot(4,1,3); hold on; grid on
% plot(time_depth,Thruster0)
% plot(time_depth,Thruster1,'r')
% title('thruster demands')
% legend('front','rear')
% xlim([x_min, x_max])
% 
% subplot(4,1,4); hold on; grid on
% plot(tailLog(:,1),tailLog(:,10))
% title('propeller demand')
% xlim([x_min, x_max])
% 
% figure(2)
% 
% subplot(4,1,1); hold on; grid on
% plot(time_depth,pitch)
% plot(time_depth,pitch_demand-pitchBias,'r--')
% title('pitch')
% legend('actual','demand')
% xlim([x_min, x_max])
% 
% subplot(4,1,2); hold on; grid on
% plot(time_depth,Pitch_Pterm)
% plot(time_depth,Pitch_Iterm,'r')
% plot(time_depth,Pitch_Dterm,'k')
% plot(time_depth,cr,'g')
% title('pitch controller terms (thrusters)')
% legend('P\_term','I\_term','D\_term','sum')
% xlim([x_min, x_max])
% 
% subplot(4,1,3); hold on; grid on
% plot(time_depth,cs_Pterm)
% plot(time_depth,cs_Iterm,'r')
% plot(time_depth,cs_Dterm,'k')
% plot(time_depth,cs_demand,'g')
% title('pitch controller terms (control surfaces)')
% ylim([-1,1]*90)
% legend('P\_term','I\_term','D\_term','sum')
% xlim([x_min, x_max])
% 
% subplot(4,1,4); hold on; grid on
% plot(tailLog(:,1),tailLog(:,10),'--k')
% title('propeller demand')
% plot(time_depth,pitchBias,'g')
% plot(time_depth,pitchBias_Pterm,'r')
% plot(time_depth,pitchBias_Dterm,'b')
% xlim([x_min, x_max])