% main function to send the code to delphin2
% note1: files with same name will be replaced
% note2: files that has been delected from delphin2laptop will still available on the delhpin2 HD.

% TODO: may need to add a verification step to properly sync two folders.

% send entire pkgs to delphin2 at once {navigation,delphin2_misison,hardware_interfaces,lowlevel_controllers,xsens_driver}
% % % % system('scp -r ~/DelphinROSv3/src/{delphin2_mission,lowlevel_controllers,hardware_interfaces,xsens_driver,navigation} delphin2@delphin2:~/DelphinROSv3/src/'); %>temp.txt
system('rsync -av --exclude={not-maintained,archive,diagnostics,tests,*.pyc,camera_scripts,readme*} ~/DelphinROSv3/src/{delphin2_mission,lowlevel_controllers,hardware_interfaces,xsens_driver,navigation} delphin2@delphin2:~/DelphinROSv3/src/'); %>temp.txt

x = fix(clock);
fprintf('Code sent at time: %d:%d:%d \n\r',x(4),x(5),x(6))