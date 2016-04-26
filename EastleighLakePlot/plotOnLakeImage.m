LL_1 = [50.957839, -1.367889]; % LatLon for top left corner of the image
LL_2 = [50.956322, -1.366287]; % LatLon for bottom right corner of the image
LL_ori = [50.957024,-1.366769]; % LatLon for home location

XY_1 = LL2XY(LL_1,LL_ori); % XY coordinate for top left corner of the image
XY_2 = LL2XY(LL_2,LL_ori); % XY coordinate for bottom right corner of the image

imdata = imread('EastleighLakeLong.png');
figure(1); clf; hold on;
imshow(imdata)
hold on
[h_px,w_px,~] = size(imdata);
h_m = abs(XY_2(2)-XY_1(2));
w_m = abs(XY_2(1)-XY_1(1));
XY_ori_shift = [XY_1(1),XY_1(2)]; % a shift in the origin point relative to the top left corner of the lake.

switch caseID
    case 1
        XY_wp = [O;A;B;M];
    case 2
        XY_wp = path_s_shaped;
    case 3
        XY_wp = path_lawn_mowing;
end

px = XY2px(XY_wp, h_m, w_m, h_px, w_px, XY_ori_shift);
if caseID>1
    plot(px(:,1),px(:,2),'--k')
end
plot(px(:,1),px(:,2),'*r')
for i = 1:length(XY_wp(:,1))
    px = XY2px(circle(XY_wp(i,1),XY_wp(i,2),r), h_m, w_m, h_px, w_px, XY_ori_shift);
    plot(px(:,1),px(:,2),'--k')
end

px = XY2px([X,Y], h_m, w_m, h_px, w_px, XY_ori_shift);
plot(px(:,1),px(:,2),'b')