%%
%2.2 Generating Sinusoids and Decaying Sinusoids
% testing the given code in lab report
amp = 6;
freq = 80;
pha = pi/6;
fs = 8000;
tsta = 0;
tend = 3; %a 3-sec long signal
xs = mySinusoid(amp, freq, pha, fs, tsta, tend);
%<--- plot first three cycles of the generated sinusoid
ts = tsta:1/fs:tsta+3/freq;
Lt = length(ts);
plot( ts, xs(1:Lt), 'b-', ts, 2*xs(1:Lt), 'r--' ), grid on
title('TEST PLOT of TWO SINUSOIDS (scaling by 2)')
xlabel('TIME (sec)')

%%
% test decaying sinusoid with 2 decaying factor
% fill in the parameters
Amp = 10;
b = .8; %decay parameter
fs = 800; %sampling freq
freq = 40; % given freq
w = 80*pi; %omega
s = 0; %Start time
e = 2; % End time
phase = pi/4; %phase
tt = s:1/fs:e; %time vector

xDecay = myDecayingSinusoid(Amp, b, w, phase, fs, s, e);    %finish function below

figure;
plot(tt, xDecay); title('xDecay for time 2 seconds'); xlabel('Time (sec)');

figure;
b = 3; %set new decay parameter
xDecay_new = myDecayingSinusoid(Amp, b, w, phase, fs, s, e);
plot(tt, xDecay_new); title('xDecay_new for time 2 seconds'); xlabel('Time (sec)');
save('Lab_1_decay.mat');
%%
function xs = mySinusoid(amp, freq, pha, fs, tsta, tend)
% amp = amplitude
% freq = frequency in cycle per second
% pha = phase, time offset for the first peak
% fs = number of sample values per second
% tsta = starting time in sec
% tend = ending time in sec
tt = tsta : 1/fs : tend; % time indices for all the values
xs = amp * cos( freq*2*pi*tt + pha );

end

function X = myDecayingSinusoid(A, b, omega, phi, fs, tStart, tEnd)
%A=starting amplitude
%b=decay rate
%omega=frequency
%phi=phase
%fs=frequency
%tStart=start time
%tEnd=end time
%write your command below:
tt = tStart : 1/fs : tEnd; % time indices for all the values
X = A * exp(-b*tt) .* cos( omega*2*pi*tt + phi );

end
