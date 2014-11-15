%[filename, folder] = uigetfile('*.csv', 'Select a file in the folder you wish to load', '/home/delphin2laptop/.ros/logFiles');
clear

listing = dir('~/.ros/logFiles');

[num, x] = size(listing);

folder = listing(num).name;

folder = sprintf('/home/delphin2laptop/.ros/logFiles/%s/',folder);

try
    load(sprintf('%scompassLog.csv',folder),'\,')
end

try
load(sprintf('%sgpsLog.csv',folder),'\,')
end

try
    load(sprintf('%spositionLog.csv',folder),'\,')
end

try
    load(sprintf('%stslLog.csv',folder),'\,')
end

try
    load(sprintf('%stailLog.csv',folder),'\,')
end

try
    load(sprintf('%sdepthandspeedMPCLog.csv',folder),'\,')
end

try
    load(sprintf('%sheadingMPCLog.csv',folder),'\,')
end

try
    load(sprintf('%sheadingPIDLog.csv',folder),'\,')
end

try
    load(sprintf('%sreckonerLog.csv',folder),'\,')
end

try
    load(sprintf('%saltimeterLog.csv',folder),'\,')
end

try
    load(sprintf('%ssonarLog.csv',folder),'\,')
end

try
    load(sprintf('%scamera_infoLog.csv',folder),'\,')
end

try
    load(sprintf('%ssms_infoLog.csv',folder),'\,')
end

try
    load(sprintf('%stempLog.csv',folder),'\,')
end

try
    load(sprintf('%sForceAndMomentLog.csv',folder),'\,')
end

plotMPCsim