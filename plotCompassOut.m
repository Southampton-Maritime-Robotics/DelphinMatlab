time = compassLog(:,1);

heading = compassLog(:,2);
roll = compassLog(:,3);
pitch = compassLog(:,4);

temp = compassLog(:,5);
depth = compassLog(:,6);

ax = compassLog(:,7);
ay = compassLog(:,8);
az = compassLog(:,9);

velx = cumtrapz(time,ax);
vely = cumtrapz(time,ay);
velz = cumtrapz(time,az);

angX = compassLog(:,10);
angY = compassLog(:,11);
angZ = compassLog(:,12);

figure(1); hold on
subplot(3,1,1); hold on
title('heading')
plot(time,heading)
subplot(3,1,2); hold on
title('roll')
plot(time,roll)
subplot(3,1,3); hold on
title('pitch')
plot(time,pitch)

figure(2)
title('linear acceleration')
subplot(3,1,1); hold on
title('accX')
plot(time,ax)
subplot(3,1,2); hold on
title('accY')
plot(time,ay)
subplot(3,1,3); hold on
title('accZ')
plot(time,az)

figure(3)
title('angular velocity')
subplot(3,1,1); hold on
title('ang vel x')
plot(time,angX)
subplot(3,1,2); hold on
title('ang vel y')
plot(time,angY)
subplot(3,1,3); hold on
title('ang vel z')
plot(time,angZ)

figure(4)
title('linear velocity')
subplot(3,1,1)
plot(time,velx)
subplot(3,1,2)
plot(time,vely)
subplot(3,1,3)
plot(time,velz)