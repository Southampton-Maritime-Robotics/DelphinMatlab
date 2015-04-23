timePosi = positionLog(:,1);
X = positionLog(:,2);
Y = positionLog(:,3);
Z = positionLog(:,4);
velSurge = positionLog(:,5);
velSway = positionLog(:,6);

figure(1); hold on
plot(X,Y)
% reference points defined relative to the north pier of Eastleigh lake
plot(-32,4,'r*')
plot(-2,64,'r*')
plot(-17,34,'r*')
% pathTest
% plot([5,100,20,120],[5,40,80,120],'r*')
axis equal

timeCompass = compassLog(:,1);
heading = compassLog(:,2);

figure(2); hold on
subplot(2,1,1)
plot(timePosi,velSurge)
subplot(2,1,2)
plot(timeCompass,heading)