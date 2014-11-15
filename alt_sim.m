close all
clear

posx = 1;
alt  = 1;
d_alt= 0.2;

velx = 0.15;
head_angle = 30;
pitch = 0;
targety = 0;

wallx = [15 15 15.1 15.1];
wally = [0 1.5 1.5 0];

auvx = [0 0.25 0.5 0.75 1.0 1.25 1.5 1.75 2.0 2.0 1.75 1.5 1.25 1.0 0.75 0.5 0.25 0];
auvy = [0 0.025 0.05 0.075  0.1 0.1  0.1 0.05 0.0 0.0 -0.05 -0.1 -0.1 -0.1 -0.075 -0.05 -0.025 0];


for k = 1:250
    
    posx = posx + velx;
    
    %%%%% SONAR %%%%%
    expected_return_H = alt/cos((90 - pitch - head_angle)*pi/180);
    expected_return_x = (expected_return_H^2 - alt^2)^0.5;
    
    if ((wallx(1) - posx) < expected_return_x) && (posx < wallx(1))
        alt    = alt + d_alt;
        targety = (wallx(1) - posx)/sin((90 - pitch - head_angle)*pi/180);
        targetx = (wallx(1) - posx);
    elseif alt > 1
        alt = alt - d_alt;
    else
        targety = alt;
        targetx = expected_return_x;
    end
    
    beamx = [posx (targetx + posx)];
    beamy = [alt (alt - targety)];
    
   
    
    
    plot((auvx + posx - 2),(auvy + alt),'-',wallx,wally,beamx,beamy,'-*')    
    axis([(posx - 3) (posx + 15) 0 3])
    
    pause(0.1)
    
end
    
    
    
    