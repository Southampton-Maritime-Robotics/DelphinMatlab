warning 'off'
sshfrommatlabinstall;
folder = downloadLatestFolder;

if (input('Download code into logfolder?  (Y/n) ','s')=='Y')
% Make code folder
    system(sprintf('mkdir %s%s',folder,'Code/'));
% /home/delphin2laptop/DelphinROSv3_mock_up/src/{delphin2_mission,hardware_interfaces} delphin2@delphin2:~/DelphinROSv3/src/'
    getCode_str = sprintf('scp -r delphin2@delphin2:~/DelphinROSv3/src/{delphin2_mission,hardware_interfaces,lowlevel_controllers} %s%s',folder, 'Code/');
    system(getCode_str);
end
importLatestData;

%clear folder