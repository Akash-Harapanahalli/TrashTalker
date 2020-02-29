% In-Lab Exercise 3.1: ECE 2026 
% This script calls the function chirpSignal()
% a-b)
% Make a function seperately: [cc, tt] = chirpSignal(fSamp, tStart, tStop, f1, f2);


% <======Parameters starts here
fSamp = 2500;      %Sampling rate
tStart = 0;  %Start time
tStop = 5;   %Stop time
f1 = 625;      %Starting freq
f2 = 8125;      %Ending freq
% Call function
[cc, tt] = chirpSignal(fSamp, tStart, tStop, f1, f2);

Lsect = 128;

% <======Demo
% Play sound with soundsc
soundsc(cc,fSamp);
% Make a two sided spectrogram with plotspec
% Use 128 for Lsect  
plotspec(cc+i*10^-9,fSamp,Lsect);

% (a) when the instantaneous frequency goes past half the sampling
% frequency the slope becomes negative and the frequency starts to decrease
% (b)
    Tsect = Lsect/fSamp
% (c) aliasing

