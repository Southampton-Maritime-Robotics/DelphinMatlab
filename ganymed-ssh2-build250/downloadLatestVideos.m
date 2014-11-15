function [latestFolderPath] = downloadLatestFolder

%Setup and open ssh 
clear
hostName = '169.254.51.57';
userName = 'delphin2';
password = '012345';
command = char('ls ~/.ros/logFiles -t --group-directories-first');

logDir = '/home/delphin2laptop/Delphin_LogFiles/';

import ch.ethz.ssh2.SCPClient;

try
    import ch.ethz.ssh2.*;
    try
      channel  =  Connection(hostName);
      channel.connect();
    catch
      error(['Error: SSHFROMMATLAB could not connect to the'...
        ' remote machine %s ...'],...
        hostName);
    end
  catch
    error('Error: SSHFROMMATLAB could not find the SSH2 java package');
  end
%
%  Check the authentication for login...
%
  isAuthenticated = channel.authenticateWithPassword(userName,password);
    
  if(~isAuthenticated)
    error...
      (['Error: SSHFROMMATLAB could not authenticate the',...
        ' SSH connection...']);
  end
  

[channel, result] = sshfrommatlabissue(channel,command);

folder_number = 1;
while length(char(result(folder_number))) ~= 19
    folder_number = folder_number +1;
end

latest = sprintf('~/.ros/logFiles/%s/%s',char(result(folder_number)),'videos');         %Latest folder name in log directory

%Copy latest folder over.  Nb currently no support in scp library to simply
%copy folder therefore latest folder is first made then files copied.

logFolder     = sprintf('%s%s/videos/',logDir,char(result(folder_number)));

if exist(logFolder,'dir') == 0
    mkdir(logFolder)
end


getVideo_str = sprintf('scp -r delphin2@delphin2:%s %s',latest, logFolder);
system(getVideo_str);

% 
% %%%%% GET FILENAMES %%%%%%
% command = sprintf('ls %s -t --group-directories-first',latest);
% command = char(command);
% 
% [channel, files] = sshfrommatlabissue(channel,command);
% 
% scp1 = SCPClient(channel);
% 
% if isempty(char(files))
%     disp('Error: No files found in video directory')
% else
%     for k = 1:length(files)
%             
%             file = sprintf('%s/%s',latest, char(files(k)));
%             fprintf('Downloading video file:\r\n %s \r\n',file)
%             scp1.get(file,logFolder);
%             disp('Download completed')
%     end
% end
% % altimeterLog      = sprintf('%s/altimeterLog.csv',latest);
% % gpsLog            = sprintf('%s/gpsLog.csv',latest);
% % sonarLog          = sprintf('%s/sonarLog.csv',latest);
% % tslHorz           = sprintf('%s/tslHorzLog.csv',latest);
% % tslVertLog        = sprintf('%s/tslVertLog.csv',latest);
% % compassLog        = sprintf('%s/compassLog.csv',latest);
% % tailLog           = sprintf('%s/altimeterLog.csv',latest);
% % positionLog       = sprintf('%s/positionLog.csv',latest);
% % depthcontrolLog   = sprintf('%s/depthcontrolLog.csv',latest);
% % headingcontrolLog = sprintf('%s/headingcontrolLog.csv',latest);
% % depthandpitchMPCLog = sprintf('%s/depthandpitchMPCLog.csv',latest);
% % 
% % %Get files
% % scp1 = SCPClient(channel);
% % scp1.get(altimeterLog,logFolder);
% % scp1.get(gpsLog,logFolder);
% % scp1.get(sonarLog,logFolder);
% % scp1.get(tslHorz,logFolder);
% % scp1.get(tslVertLog,logFolder);
% % scp1.get(compassLog,logFolder);
% % scp1.get(tailLog,logFolder);
% % scp1.get(positionLog,logFolder);
% % scp1.get(depthcontrolLog,logFolder);
% % scp1.get(headingcontrolLog,logFolder);
% % scp1.get(depthandpitchMPCLog,logFolder);

latestFolderPath = logFolder;