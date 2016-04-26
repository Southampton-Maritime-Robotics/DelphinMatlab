function XY = LL2XY(LL, LL_ori)
    
    % transform Lat and Long (in a decimal degree) ...
    % into coordinate (in metre) in relative to the Lat and Long of the origin

    %% extract component
    lat = LL(1);
    lon = LL(2);
    lat_ori = LL_ori(1);
    lon_ori = LL_ori(2);
    
    %% define variables and convert their unit to radians
    R = 6371000; % Radius of the earth in m
    dLat = degtorad(lat-lat_ori);
    dLon = degtorad(lon-lon_ori);
    lat1 = degtorad(lat_ori);
    lat2 = degtorad(lat);
    
    %% determine range between two point
    a = sin(dLat/2)*sin(dLat/2)+sin(dLon/2)*sin(dLon/2)*cos(lat1)*cos(lat2);
    c = 2*atan2(sqrt(a),sqrt(1-a));
    rnge = R*c;
    
    %% determine bearing between two point
    y = sin(dLon) * cos(lat2);
    x = cos(lat1)*sin(lat2) - sin(lat1)*cos(lat2)*cos(dLon);
    brng = atan2(y, x);
    
    XY = [rnge*sin(brng), rnge*cos(brng)];