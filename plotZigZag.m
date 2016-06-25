timeStart = 90;
headingInit = 225;

timeCompass = compassLog(:,1)-timeStart;
heading = compassLog(:,2)-headingInit;

timeTail = tailLog(:,1)-timeStart;
demand_cs = tailLog(:,6);
demand_prop = tailLog(:,10);

timeThruster = thrusterLog(:,1)-timeStart;
demand_th = thrusterLog(:,4);

figure(1); clf; hold on;
subplot(4,1,1); hold on;
plot(timeCompass,heading,'k--')
ylabel('heading')
subplot(4,1,2); hold on;
plot(timeTail,demand_cs,'r')
ylabel('cs')
subplot(4,1,3); hold on;
plot(timeThruster,demand_th,'g')
ylabel('th')
subplot(4,1,4); hold on;
plot(timeTail,demand_prop,'g')
ylabel('prop')
% xlim([-20,100])
% legend('heading','u_{cs}','u_{th}')