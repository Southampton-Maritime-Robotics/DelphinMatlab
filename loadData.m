clear
close all


for filenumber = 1:5
    
    
    folder = sprintf('%s%d%s','/home/delphin2laptop/Delphin_LogFiles/testwood',filenumber,'/');

    gps_file = sprintf('%s%s',folder,'gpsLog.csv');
    altimeter_file = sprintf('%s%s',folder,'altimeterLog.csv');
    
    gps = importdata(gps_file);
    altitude = importdata(altimeter_file,',');

    x = find(altitude(:,2) < 0.25);
    time_zero = altitude(1,1);
    altitude(x,:) =[];
    altitude(:,1) = altitude(:,1)-time_zero;
    clear x

    x = find(gps(:,2) == 0);
    gps(x,:) = [];
    gps(:,1) = gps(:,1) - time_zero;
    clear x

    data = zeros(length(altitude),4);
    data(:,1) = altitude(:,1);
    data(:,4) = medfilt1(altitude(:,2),11);

    for k = 1:length(altitude)

        t = find(gps(:,1) >= altitude(k,1));
        
        if isempty(t) ~= 1
            if t(1) > 1
                data(k,2) = gps(t(1)-1,2) + (gps(t(1),2)-gps(t(1)-1,2))*(gps(t(1),1)-altitude(k,1))/(gps(t(1),1)-gps(t(1)-1,1));
                data(k,3) = gps(t(1)-1,3) + (gps(t(1),3)-gps(t(1)-1,3))*(gps(t(1),1)-altitude(k,1))/(gps(t(1),1)-gps(t(1)-1,1));
            else
                data(k,2) = gps(t(1),2);
                data(k,3) = gps(t(1),3);
            end
        end

        clear t
    end
    
    if exist('DATA') == 1
        DATA(length(DATA)+1:length(DATA)+length(data),1:4) = data;
    else
        DATA = data;
    end
    
    %filename = sprintf('%s%d%s','trial',filenumber,'/processed_data.mat');
    %save(filename);
    clear data gps altitude k
    
    
end

x = find(DATA(:,2)==0);
DATA(x,:) = [];

    
    