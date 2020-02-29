% In-Lab Exercise 3.2: ECE 2026 
% This script will generate a periodic full wave rectified sine wave

%% a/b) 
% <======Fill in parameters:
Amp = 1;
T = 1;
fs = 1000;
tStop = 5;
% Generate abs sin
tt = 0: 1/fs : tStop;
xx = Amp * abs(sin(2*pi*tt/T));
% <======Make your plots below:
figure(1);
subplot(2,1,1);
plot(tt,xx);


% c) 
% <======Make spectrogram
TSect = 5;
LSect=TSect*fs;
figure(1);
subplot(2,1,2);
plotspec(xx, fs, LSect), colorbar, grid on
title('3.2c')
xlabel('Time (s)')
ylabel('Frequency')

% d) 0, 2, 4, 6


% e) T0= 1/2, f0 = 2 Hz
















