clear all;
clc;

timeStart = 90;
headingInit = 190;

caseName = 'ZigZag_manoeuvre_cs';

load([caseName,'/','compassLog.csv'])
load([caseName,'/','tailLog.csv'])
load([caseName,'/','thrusterLog.csv'])

timeCompass = compassLog(:,1)-timeStart;
heading = compassLog(:,2)-headingInit;

timeTail = tailLog(:,1)-timeStart;
demand_cs = tailLog(:,6);


timeThruster = thrusterLog(:,1)-timeStart;
demand_th = thrusterLog(:,4);

figure(1); clf; hold on;
plot(timeCompass,heading)
plot(timeTail,demand_cs)
plot(timeThruster,demand_th/1800*30)
xlim([-20,100])