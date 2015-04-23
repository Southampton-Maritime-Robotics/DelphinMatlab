time_depth = depthPitchPIDLog(:,1);
depth = depthPitchPIDLog(:,2);
depth_demand = depthPitchPIDLog(:,3);

Thrust_Pterm = depthPitchPIDLog(:,11);
Thrust_Iterm = depthPitchPIDLog(:,12);
Thrust_Dterm = depthPitchPIDLog(:,13);
Thrust_Sum = depthPitchPIDLog(:,14);

pitch = depthPitchPIDLog(:,18);
pitch_demand = depthPitchPIDLog(:,19);

Pitch_Pterm = depthPitchPIDLog(:,27);
Pitch_Iterm = depthPitchPIDLog(:,28);
Pitch_Dterm = depthPitchPIDLog(:,29);
cr = depthPitchPIDLog(:,30);

Thruster0 = depthPitchPIDLog(:,33);
Thruster1 = depthPitchPIDLog(:,34);

Ltf = depthPitchPIDLog(:,43);
Ltr = depthPitchPIDLog(:,44);
crNose = depthPitchPIDLog(:,45);

time_thruster = thrusterLog(:,1);
Thruster0_measured = thrusterLog(:,6);
Thruster1_measured = thrusterLog(:,7);
dir0 = sign(thrusterLog(:,2));
dir1 = sign(thrusterLog(:,3));
Thruster0_measured = dir0.*Thruster0_measured;
Thruster1_measured = dir1.*Thruster1_measured;

%% plot
figure(1)

subplot(3,1,1); hold on
plot(time_depth,depth)
plot(time_depth,depth_demand,'r--')

subplot(3,1,2); hold on; grid on
plot(time_depth,Thrust_Pterm)
plot(time_depth,Thrust_Iterm,'r')
plot(time_depth,Thrust_Dterm,'k')
plot(time_depth,Thrust_Sum,'g')

subplot(3,1,3); hold on
plot(time_depth,Thruster0)
plot(time_depth,Thruster1,'r')

figure(2)

subplot(3,1,1); hold on; grid on
plot(time_depth,pitch)
plot(time_depth,pitch_demand,'r--')

subplot(3,1,2); hold on; grid on
plot(time_depth,Pitch_Pterm)
plot(time_depth,Pitch_Iterm,'r')
plot(time_depth,Pitch_Dterm,'k')
plot(time_depth,cr,'g')

subplot(3,1,3); hold on
plot(time_depth,Thruster0,'b--')
plot(time_depth,Thruster1,'r--')
plot(time_thruster,Thruster0_measured)
plot(time_thruster,Thruster1_measured,'r')

% figure(3); hold on; grid on
% 
% plot(time_depth,Ltf,'b')
% plot(time_depth,Ltr,'r')
% plot(time_depth,crNose,'g')