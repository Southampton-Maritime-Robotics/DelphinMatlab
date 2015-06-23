% get code from delphin2 and keep locally
dirName = datestr(now,'yyyy-mm-dd_HH-MM-ss');
mkdir('~/Delphin_LoadedCode',dirName)
cmd = ['scp -r delphin2@delphin2:~/DelphinROSv3/src/{delphin2_mission,lowlevel_controllers,hardware_interfaces} ~/Delphin_LoadedCode/',dirName];
system(cmd);
