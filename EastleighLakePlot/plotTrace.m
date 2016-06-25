% function to plot the result obtain from lake trial
% close all
% clear all
% clc
% load positionLog.csv

% TODO
% plot image
% plot waypoint with circle
% plot trial

%% specify key reference points
% North pier of the Eastleigh lake (50.957024,-1.366769)
O = [4,0];
A = [-28,-20];
B = [-1,50];
M = (A+B)/2;

% 1: A,B,M,O, 2: S-shaped path, 3: lawn mowing path
caseID = 2;

r = 3; % circle of acceptance for waypoint switching criteria

path_s_shaped = [-3.77039131177951,36.2047531320966;-5.73836130583437,44.0978496620225;-12.9209041044603,47.9168754113641;-20.5650525464916,45.1346329121524;-23.6123771120926,37.5922399417409;-20.0463449387670,30.2807904775761;-11.3581490090425,21.9662932676627;-7.79211683571697,14.6548438034979;-10.8394414013180,7.11245083308638;-18.4835898433492,4.33020833387466;-25.6661326419751,8.14923408321632;-27.6341026360300,16.0423306131422];
path_lawn_mowing = [4.5096, 37.8109; -12.8109, 47.8109; -17.8109, 39.1506; -0.4904, 29.1506; -5.4904, 20.4904; -22.8109, 30.4904; -26.3109, 24.4282; -8.9904, 14.4282; -12.4904, 8.3660; -29.8109, 18.3660; -31.8109, 14.9019; -14.4904, 4.9019; -16.4904, 1.4378; -33.8109, 11.4378];

%% get trace
X = positionLog(:,2);
Y = positionLog(:,3);

plotOnLakeImage

title('Trace')
axis equal