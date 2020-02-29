% In-Lab Exercise 3.4: ECE 2026 
% Spectrogram in dB
% Use the given function to play with dB plots
% a) 20,75,175,225,250
Amp = 1;
T = 1;
fs = 1000;
tStop = 5;
% Generate abs sin
tt = 0: 1/fs : tStop;
xx = Amp * abs(sin(2*pi*tt/T));
DBrange = 80;
figure(1);
subplot(2,1,1);
plot(tt,xx);
TSect = 5;
LSect=TSect*fs;


subplot(2,1,2);
dBspec = plotspecDB(xx,fs,LSect,DBrange);

% b)25,75,125,175,225,250
figure(2);
T = 2;
xx = Amp * abs(sin(2*pi*tt/T));
TSect = 5;
LSect=TSect*fs;
subplot(2,1,1);
plot(tt,xx);
subplot(2,1,2);
dBspec = plotspecDB(xx,fs,LSect,DBrange);




