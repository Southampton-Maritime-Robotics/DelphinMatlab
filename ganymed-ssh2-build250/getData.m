clear % clear all parameter in the workspace
warning 'off'
sshfrommatlabinstall;
folder = downloadLatestFolder;

if (input('Download code into logfolder?  (y/n) ','s')=='y')
% Make code folder
    password = '012345';
    
    if exist([folder,'Code/']) == 0
        system(sprintf('mkdir %s%s',folder,'Code/'));
    end
    
    getCode_str = sprintf('sshpass -p %s scp -r delphin2@delphin2:~/DelphinROSv3/src/. %s%s',password, folder, 'Code/');
    system(getCode_str);

end

importLatestData;
