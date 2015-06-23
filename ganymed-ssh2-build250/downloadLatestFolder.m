function [latestFolderPath] = downloadLatestFolder

%Setup and open ssh 
clear
hostName = 'delphin2';
userName = 'delphin2';
password = '012345';
command = char('ls ~/.ros/logFiles -t --group-directories-first');

logDir = ['~/Delphin_LogFiles/'];
import ch.ethz.ssh2.SCPClient;   %added the .java

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

latest = sprintf('~/.ros/logFiles/%s',char(result(folder_number)));         %Latest folder name in log directory

%Copy latest folder over.  Nb currently no support in scp library to simply
%copy folder therefore latest folder is first made then files copied.

logFolder     = sprintf('%s%s/',logDir,char(result(folder_number)));

if exist(logFolder,'dir') == 0
    mkdir(logFolder)
end


%%%%% GET FILENAMES %%%%%%
command = sprintf('ls %s -t --group-directories-first',latest);
command = char(command);

[channel, files] = sshfrommatlabissue(channel,command);

scp1 = SCPClient(channel);

if char(files(1)) == char('videos')  
    kk = 2;
else
    kk = 1;
end

for k = kk:length(files)
        file = sprintf('%s/%s',latest, char(files(k)));
        fprintf('Downloading %s, File %d of %d \n',char(files(k)),k-1,length(files)-1)
%         scp1.get(file,logFolder); % old command to get the file; 
%         replaced since it will not work with the relative path
        cmd = ['sshpass -p ', password, ' scp -r delphin2@delphin2:',file,' ',logFolder];
        system(cmd);
end

latestFolderPath = logFolder;