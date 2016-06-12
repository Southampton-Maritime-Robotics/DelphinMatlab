timeStart = 90;
headingInit = 190;

timeCompass = compassLog(:,1)-timeStart;
heading = compassLog(:,2)-headingInit;

timeTail = tailLog(:,1)-timeStart;
demand_cs = tailLog(:,6);

timeThruster = thrusterLog(:,1)-timeStart;
demand_th = thrusterLog(:,4);

figure(1); clf; hold on;
plot(timeCompass,heading,'k--')
plot(timeTail,demand_cs,'r')
plot(timeThruster,demand_th/1800*30,'g')
% xlim([-20,100])
legend('heading','u_{cs}','u_{th}')