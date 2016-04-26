function px = XY2px(XY, h_m, w_m, h_px, w_px, XY_ori_shift)

    px = [(XY(:,1)-XY_ori_shift(1))*w_px/w_m, -(XY(:,2)-XY_ori_shift(2))*h_px/h_m];