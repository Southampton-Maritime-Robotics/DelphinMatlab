if exist('folder', 'var') == 1
    ask = input('Load current folder? (y/n)    ', 's');
    
    if ask == 'y'
        folder = folder;
    end
end

if (exist('folder', 'var') ~= 1) || ask == 'n'
    [filename, folder] = uigetfile('*.csv', 'Select a file in the folder you wish to load', '/home/delphin2laptop/Delphin_LogFiles/');
end

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

try
    load(sprintf('%srate_gyroLog.csv',folder),'\,')
end

try
    load(sprintf('%sdepthandpitchMPC_Log.csv',folder),'\,')
end

try
    load(sprintf('%sthrusterLog.csv',folder),'\,')
end

try
    load(sprintf('%sIMU_Log.csv',folder),'\,')
end

try
    load(sprintf('%sdepthPitchPIDLog.csv',folder),'\,')
end