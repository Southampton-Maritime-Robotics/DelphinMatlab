DelphinMatlab
=============

contain matlab file that are utilized as an interface between delphin2 and delphin2laptop

sendCode: not in use
sendCode2: send the codes to delphin2 without checking if there is something in the destination folder that is not in used
getCode: get the code from delphin2 and store locally in '~/Delphin_LoadedCode/'
         (recommend using getData)
getData: load logfile from delphin2 and store locally in '~/Delphin_LogFiles/', then import data into the matlab workspace
         It can also be used for downloading code

plotHeadingPID: plot responses of PID based heading controller
plotDepthPitchPID: plot response of PID based depth-pitch controller
plotEastleighLake: display overview of the lake trial