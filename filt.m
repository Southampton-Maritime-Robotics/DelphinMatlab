clear filt_out
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

filt_out_05(1) = reckonerLog(1,12);
error(1) = 0;
a  = 0.25;

for kk = 2:length(reckonerLog)
    
    error(kk) = (reckonerLog(kk,12) - filt_out_05(kk-1));% error(kk-1) +
    filt_out_05(kk) = filt_out_05(kk-1) + error(kk)*a;
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

filt_out_1(1) = reckonerLog(1,12);
error(1) = 0;
a  = 1.0;

for kk = 2:length(reckonerLog)
    
    error(kk) = (reckonerLog(kk,12) - filt_out_1(kk-1));% error(kk-1) +
    filt_out_1(kk) = filt_out_1(kk-1) + error(kk)*a;
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

filt_out_2(1) = reckonerLog(1,12);
error(1) = 0;
a  = 2.0;

for kk = 2:length(reckonerLog)
    
    error(kk) = (reckonerLog(kk,12) - filt_out_2(kk-1));% error(kk-1) +
    filt_out_2(kk) = filt_out_2(kk-1) + error(kk)*a;
    
end



plot(reckonerLog(:,1),reckonerLog(:,12),reckonerLog(:,1),filt_out_05) %,reckonerLog(:,1),filt_out_1,reckonerLog(:,1),filt_out_2)