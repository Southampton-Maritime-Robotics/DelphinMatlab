% function to visualise the performance of the depthPitchPID controller

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

pitchBias = depthPitchPIDLog(:,15);
pitchBias_Pterm = depthPitchPIDLog(:,17).*depthPitchPIDLog(:,4);
pitchBias_Iterm = depthPitchPIDLog(:,45).*depthPitchPIDLog(:,46);
pitchBias_Dterm = depthPitchPIDLog(:,43).*depthPitchPIDLog(:,6);

Thruster0 = depthPitchPIDLog(:,33);
Thruster1 = depthPitchPIDLog(:,34);

cs_Pterm = depthPitchPIDLog(:,39);
cs_Iterm = depthPitchPIDLog(:,40);
cs_Dterm = depthPitchPIDLog(:,41);
cs_demand = depthPitchPIDLog(:,42);

time_thruster = thrusterLog(:,1);
Thruster0_measured = thrusterLog(:,6);
Thruster1_measured = thrusterLog(:,7);
dir0 = sign(thrusterLog(:,2));
dir1 = sign(thrusterLog(:,3));
Thruster0_measured = dir0.*Thruster0_measured;
Thruster1_measured = dir1.*Thruster1_measured;

x_min = 0;
x_max = time_thruster(end);

%% plot
figure(1)

subplot(4,1,1); hold on; grid on
plot(time_depth,depth)
plot(time_depth,depth_demand,'r--')
title('depth')
legend('actual','demand')
xlim([x_min, x_max])

subplot(4,1,2); hold on; grid on
plot(time_depth,Thrust_Pterm)
plot(time_depth,Thrust_Iterm,'r')
plot(time_depth,Thrust_Dterm,'k')
plot(time_depth,Thrust_Sum,'g')
title('depth controller terms (thrusters)')
legend('P\_term','I\_term','D\_term','sum')
xlim([x_min, x_max])

subplot(4,1,3); hold on; grid on
plot(time_depth,Thruster0)
plot(time_depth,Thruster1,'r')
title('thruster demands')
legend('front','rear')
xlim([x_min, x_max])

subplot(4,1,4); hold on; grid on
plot(tailLog(:,1),tailLog(:,10))
try
    plot(depthPitchPIDLog(:,1),depthPitchPIDLog(:,44))
catch
    disp('Error: no such speed information')
end
title('propeller demand/ surge velocity')
xlim([x_min, x_max])

figure(2)

subplot(4,1,1); hold on; grid on
plot(time_depth,pitch)
plot(time_depth,pitch_demand-pitchBias,'r--')
title('pitch')
legend('actual','demand')
xlim([x_min, x_max])

subplot(4,1,2); hold on; grid on
plot(time_depth,Pitch_Pterm)
plot(time_depth,Pitch_Iterm,'r')
plot(time_depth,Pitch_Dterm,'k')
plot(time_depth,cr,'g')
title('pitch controller terms (thrusters)')
legend('P\_term','I\_term','D\_term','sum')
xlim([x_min, x_max])

subplot(4,1,3); hold on; grid on
plot(time_depth,cs_Pterm)
plot(time_depth,cs_Iterm,'r')
plot(time_depth,cs_Dterm,'k')
plot(time_depth,cs_demand,'g')
title('pitch controller terms (control surfaces)')
ylim([-1,1]*90)
legend('P\_term','I\_term','D\_term','sum')
xlim([x_min, x_max])

subplot(4,1,4); hold on; grid on
plot(tailLog(:,1),tailLog(:,10),'--k')
plot(time_depth,pitchBias,'k')
plot(time_depth,pitchBias_Pterm,'r')
plot(time_depth,pitchBias_Iterm,'g')
plot(time_depth,pitchBias_Dterm,'b')
title('pitchBias terms/ propeller demand')
xlim([x_min, x_max])

figure; 
subplot(4,1,1); hold on; grid on
plot(energyLog(:,1),energyLog(:,3))
plot(energyLog(:,1),energyLog(:,4))
subplot(4,1,2); hold on; grid on
plot(energyLog(:,1),energyLog(:,5))
plot(energyLog(:,1),energyLog(:,6))
subplot(4,1,3); hold on; grid on
plot(energyLog(:,1),energyLog(:,7))
subplot(4,1,4); hold on; grid on
plot(energyLog(:,1),energyLog(:,8))