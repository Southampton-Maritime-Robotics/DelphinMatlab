% Send code from ~/Matlab/DelphinROSv2/ to AUV %
clc

% compare local DelphinROSv2 folder to temp folder and create folder with
% modified files %
check_modifications

stop = 0;

if stop ~= 1

    % send code folders to AUV %
    disp('Attempting to send code to AUV')
    [status] = system('scp -r ~/Matlab/modified/{nodes,msg,launch} delphin2@delphin2:~/DelphinROSv2/ '); %>temp.txt
    
    if status == 1
        disp('Sending failed.  Check network connection to AUV')
        break
    elseif status == 0
        disp('Code sent successfully')
    end
    
    z = input('Verify code is on AUV? (y/N)  ','s');
    
    while (z == 'y' || z == 'N') == 0
        disp('Invalid key, please try again... ')
        z = input('Verify code is on AUV? (y/N)  ','s');
    end
    
    if z == 'y'
        disp('Deleting contents of temp directory')

        % delete contents in temp directory %
        system('rm -r ~/Matlab/temp/{nodes,msg,launch}');
        disp('Contents of temp directory deleted')
        disp(' ')

        % download code from AUV to temp folder for error checking %
        disp('Downloading code from AUV for verification')
        system('scp -r delphin2@delphin2:~/DelphinROSv2/{nodes,msg,launch} ~/Matlab/temp');
    else
        if z == 'N'
            zz = input('Update local temp dir (recommended)? (y/N)  ','s');
            while zz ~= 'y' || z ~= 'N'
                disp('Invalid key, please try again... ')
                zz = input('Update local temp dir (recommended)? (y/N)  ','s');
            end
            
            if zz == 'y'
                copyfile('~/Matlab/DelphinROSv2/nodes','~/Matlab/temp/nodes');
                copyfile('~/Matlab/DelphinROSv2/nodes','~/Matlab/temp/nodes');
                copyfile('~/Matlab/DelphinROSv2/nodes','~/Matlab/temp/nodes');
            else
                disp('Warning:  temp dir not in sync with current DelphinROSv2 dir')
            end
        end
    end

    % check nodes folder contents %
    disp ('Checking code')

    x = 0;

    if system('diff -r ~/Matlab/DelphinROSv2/nodes ~/Matlab/temp/nodes ') == 1
        disp('Nodes folder check  --> failed')
        x = 1;
    else
        disp('Nodes folder check  --> ok')
    end

    % check nodes folder contents %
    if system('diff -r ~/Matlab/DelphinROSv2/msg ~/Matlab/temp/msg') == 1
        disp('Msg folder check    --> failed')
        x = 1;
    else
        disp('Msg folder check    --> ok')
    end

    % check nodes folder contents %
    if system('diff -r ~/Matlab/DelphinROSv2/launch ~/Matlab/temp/launch') == 1
        disp('Launch folder check --> failed')
        x = 1;
    else
        disp('Launch folder check --> ok')
    end

    %system('rm temp.txt');

    if x == 0
        disp('Code sent to AUV and verified')
    else
        disp('Code sent to AUV but verification failed')
    end
    
end
