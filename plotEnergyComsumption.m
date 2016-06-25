%% extract data
timeEnergy = energyLog(:,1);
vol_motor = energyLog(:,2)/1000; % [vol]
vol_fins = 12 * ones(length(energyLog(:,2)),1); % [vol]
TH_0_amp = -energyLog(:,3)/1000; % [amp]
TH_1_amp = -energyLog(:,4)/1000; % [amp]
TH_2_amp = -energyLog(:,5)/1000; % [amp]
TH_3_amp = -energyLog(:,6)/1000; % [amp]
fins_amp = energyLog(:,7)/1000; % [amp]
prop_amp = energyLog(:,8)/1000; % [amp]

TH_0_watt = TH_0_amp .* vol_motor; % [watt]
TH_1_watt = TH_1_amp .* vol_motor; % [watt]
TH_2_watt = TH_2_amp .* vol_motor; % [watt]
TH_3_watt = TH_3_amp .* vol_motor; % [watt]
fins_watt = fins_amp .* vol_fins; % [watt]
prop_watt = prop_amp .* vol_motor; % [watt]

% wSpan = 20; % window size for filtering
% offsetFore = 10; % offset to trim off the first part of the data
% offsetAft = 35; % offset to trim off the last part of the data
% 
% %% smooth data
% TH_0_watt_smoothed = smooth(TH_0_watt,wSpan/2);
% TH_0_watt_smoothed_calibrated = TH_0_watt_smoothed - TH_0_watt_smoothed(50);
% TH_1_watt_smoothed = smooth(TH_1_watt,wSpan/2);
% TH_1_watt_smoothed_calibrated = TH_1_watt_smoothed - TH_1_watt_smoothed(50);

%% plotting
figure(1); clf; hold on; grid on;

% depth tracking
subplot(4,1,1); hold on; grid on; grid minor;
plot(timeEnergy,TH_0_watt,'b')
plot(timeEnergy,TH_1_watt,'r')
ylabel('th\_ver [W]')

subplot(4,1,2); hold on; grid on; grid minor;
plot(timeEnergy,TH_2_watt,'b')
plot(timeEnergy,TH_3_watt,'r')
ylabel('th\_hor [W]')

subplot(4,1,3); hold on; grid on; grid minor;
plot(timeEnergy,fins_watt,'b')
ylabel('fins [W]')

subplot(4,1,4); hold on; grid on; grid minor;
plot(timeEnergy,prop_watt,'b')
ylabel('prop [W]')

% TH_0_watt = TH_0_amp .* vol_motor; % [watt]
% TH_1_watt = TH_1_amp .* vol_motor; % [watt]
% TH_2_watt = TH_2_amp .* vol_motor; % [watt]
% TH_3_watt = TH_3_amp .* vol_motor; % [watt]
% fins_watt = fins_amp .* vol_fins; % [watt]
% prop_watt = prop_amp .* vol_motor; % [watt]
% 
% subplot(5,1,2); hold on; grid on; grid minor;
% plot(time,pitch_demand,'--r')
% plot(time,pitch,'b')
% ylabel('\theta [deg]')
% xlim([0, xlim_max])
% ylim([-20, 10])
% h = legend({'demand','actual','Location','SouthEast'},'Position',[0.8,0.73,0.01,0.05],'Orientation','horizontal')
% set(h, 'FontSize', 7)
% 
% % vertical thrusters
% subplot(5,1,3); hold on; grid on; grid minor;
% plot(timeEnergy(offsetFore:end-offsetAft),TH_0_watt_smoothed_calibrated(offsetFore:end-offsetAft))
% plot(timeEnergy(offsetFore:end-offsetAft),TH_1_watt_smoothed_calibrated(offsetFore:end-offsetAft))
% xlim([0,xlim_max])
% ylim([-5 50])
% h = legend({'frt','aft','Location','NorthEast'},'Position',[0.8,0.56,0.01,0.05],'Orientation','horizontal')
% set(h, 'FontSize', 7)
% ylabel('thrusters [W]')
% 
% % stern planes
% subplot(5,1,4); hold on; grid on; grid minor;
% plot(timeEnergy,smooth(fins_watt,wSpan))
% xlim([0,xlim_max])
% ylim([-2 15])
% ylabel('fins [W]')
% 
% % propeller
% subplot(5,1,5); hold on; grid on; grid minor;
% plot(timeEnergy,prop_watt_smoothed)
% xlim([0,xlim_max])
% ylim([-10 50])
% ylabel('prop [W]')
% xlabel('time [sec]')

% print('-dpng','-r325',[caseName,'_energy'])