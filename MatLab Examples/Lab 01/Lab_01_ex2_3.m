%%
%2.3 Reading WAV File into MATLAB and Playing an Array
% access the 'sample.wav' and plot it from 0.25 to 0.5
[xx, fs] = audioread('sample.wav'); %fill in your file name
dur = 1/fs * length(xx); %duration of sound file
len = length(xx); %length of sound array
tt1 = 0.25:1/fs:.5; %time array for plot
figure; 
plot(tt1,xx(fs*.25:fs*.5)); 
title('Sound wave from 0.25 to 0.5 seconds'); xlabel('Time (sec)');

