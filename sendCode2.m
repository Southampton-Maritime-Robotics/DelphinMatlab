% this code help to transfer file from delphin2laptop to delphin2
% note1: files with same name will be replaced
% note2: files that has been delected from delphin2laptop will still
% available on the delhpin2 HD.

% send entire pkgs to delphin2 at once {navigation,delphin2_misison,hardware_interfaces,lowlevel_controllers,xsens_driver}
system('scp -r /home/delphin2laptop/DelphinROSv3_mock_up/src/{delphin2_mission,hardware_interfaces,lowlevel_controllers,xsens_driver} delphin2@delphin2:~/DelphinROSv3/src/'); %>temp.txt

% % % send navigation pkg to delphin2 {launch,scripts,msg,maps}
% % system('scp -r /home/delphin2laptop/DelphinROSv3_mock_up/src/navigation/{launch,scripts,msg} delphin2@delphin2:~/DelphinROSv3/src/navigation/'); %>temp.txt
% % 
% % % send de0123lphin2_mission pkg to delphin2 {launch,scripts,msg}
% % system('scp -r /home/delphin2laptop/DelphinROSv3_mock_up/src/delphin2_mission/{launch,scripts,msg} delphin2@delphin2:~/DelphinROSv3/src/delphin2_mission/'); %>temp.txt
% % 
% % % send hardware_interfaces pkg to delphin2 {launch,scripts,msg}
% % system('scp -r /home/delphin2laptop/DelphinROSv3_mock_up/src/hardware_interfaces/{launch,scripts,msg} delphin2@delphin2:~/DelphinROSv3/src/hardware_interfaces/'); %>temp.txt
% % 012345

% % % send lowlevel_controllers pkg to delphin2 {launch,scripts,msg}
% % system('scp -r /home/delphin2laptop/DelphinROSv3_mock_up/src/lowlevel_controllers/{launch,scripts,msg} delphin2@delphin2:~/DelphinROSv3/src/lowlevel_controllers/'); %>temp.txt

x = fix(clock);
fprintf('Code sent at time: %d:%d:%d \n\r',x(4),x(5),x(6))