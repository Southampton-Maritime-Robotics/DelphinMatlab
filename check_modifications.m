% delete modified dir and create it %
disp('')

if exist('~/Matlab/modified/','dir') == 7
    system('rm -r ~/Matlab/modified');
    %disp('modified dir deleted')
end

if exist('~/Matlab/modified/','dir') == 0
    system('mkdir ~/Matlab/modified');
    %disp('modified dir created')
end

if exist('~/Matlab/modified/nodes','dir') == 0
    system('mkdir ~/Matlab/modified/nodes');
    %disp('modified/nodes dir created')
end

if exist('~/Matlab/modified/msg','dir') == 0
    system('mkdir ~/Matlab/modified/msg');
    %disp('modified/msg dir created')
end

if exist('~/Matlab/modified/launch','dir') == 0
    system('mkdir ~/Matlab/modified/launch');
    %disp('modified/launch dir created')
end

%%% Check files that have been modified in DelphinROSv2/nodes compared to
%%% previous files in temp/nodes 
[status, result] = system('diff -r ~/Matlab/DelphinROSv2/nodes ~/Matlab/temp/nodes ');
clear files dots slashes

dots = find(result == '.');
slashes = find(result == '/');

for k = 1:length(dots)
    
    x = find(slashes < dots(k));
    
    files(k,:) = cellstr(result(slashes(x(length(x)))+1:dots(k)+2));
    
end

%%% Copy modified files to modified dir %%%
try
    if isempty(files) == 0
        stop1 = 0;
        x = [1:2:length(files)-1];
        files = files(x);

        disp('Modified files:  ')

        for k=1:length(files)
            file = sprintf('%s%s','~/Matlab/DelphinROSv2/nodes/',char(files(k)));
            dest = sprintf('%s%s','~/Matlab/modified/nodes/',char(files(k)));
            copyfile(file,dest)
            disp(sprintf('%s%s','           ',char(files(k))))
        end
        fprintf('\n')
    else
        disp('No modified files in nodes dir')
        stop1 = 1;
    end
catch err
    disp('No modified files in nodes dir')
    stop1 = 1;
end

%%% Check files that have been modified in DelphinROSv2/nodes compared to
%%% previous files in temp/nodes 
[status, result] = system('diff -r ~/Matlab/DelphinROSv2/msg ~/Matlab/temp/msg ');
clear files dots slashes

dots = find(result == '.');
slashes = find(result == '/');

for k = 1:length(dots)
    
    x = find(slashes < dots(k));
    
    files(k,:) = cellstr(result(slashes(x(length(x)))+1:dots(k)+2));
    
end

%%% Copy modified files to modified dir %%%
try
    if isempty(files) == 0
        stop2 = 0;
        x = [1:2:length(files)-1];
        files = files(x);

        for k=1:length(files)
            file = sprintf('%s%s','~/Matlab/DelphinROSv2/msg/',char(files(k)));
            dest = sprintf('%s%s','~/Matlab/modified/msg/',char(files(k)));
            copyfile(file,dest)
            disp(sprintf('%s%s','           ',char(files(k))))
        end
        disp(sprintf('\n'))
    else
        disp('No modified files in msg dir')
        stop2 = 1;
    end
catch err
    disp('No modified files in msg dir')
    stop2 = 1;
end

%%% Check files that have been modified in DelphinROSv2/nodes compared to
%%% previous files in temp/nodes 
[status, result] = system('diff -r ~/Matlab/DelphinROSv2/launch ~/Matlab/temp/launch ');
clear files dots slashes

dots = find(result == '.');
slashes = find(result == '/');

for k = 1:length(dots)
    
    x = find(slashes < dots(k));
    
    files(k,:) = cellstr(result(slashes(x(length(x)))+1:dots(k)+2));
    
end

%%% Copy modified files to modified dir %%%
try
    if isempty(files) == 0
        stop3 = 0;
        x = [1:2:length(files)-1];
        files = files(x);

        disp('Modified files:  ')

        for k=1:length(files)
            file = sprintf('%s%s','~/Matlab/DelphinROSv2/launch/',char(files(k)));
            dest = sprintf('%s%s','~/Matlab/modified/launch/',char(files(k)));
            copyfile(file,dest)
            disp(sprintf('%s%s','           ',char(files(k))))
        end
        disp(sprintf('\n'))
    else
        disp('No modified files in launch dir')
        stop3 = 1;
    end
catch err
    disp('No modified files in launch dir')
    stop3 = 1;
end

if stop1 == 1 && stop2 == 1 && stop3 == 1
    stop = 1;
else
    stop = 0;
end
