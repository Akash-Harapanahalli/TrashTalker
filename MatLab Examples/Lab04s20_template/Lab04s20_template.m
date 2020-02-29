%% ECE 2026 - Lab 04 - Spring 2020
%
% Lab 04 Notes:
%
% * Show the formula for calculating instanstatious frequency.
% * Spectrum is conjugate symetric. At negative frequencies
% we see the conjugate of the complex exponential at the
% positive frequency.


%% 3.1 Using Matlab Debugger

% 1. Set a breakpoint to stop execution when an error occurs 
% and jump into “Keyboard” mode,

% 2. display the contents of important vectors while stopped, 

% 3. determine the size of all vectors by using either the 
% size() function or the whos command. 

% 4. and, lastly, modify variables while in the “Keyboard” mode 
% of the debugger. 

% 5. Another useful activity is to set a breakpoint in the ?rst 
% line of the coscos function, and then singlestep one line at 
% a time through the function.

% Call the function with:
[xn,tn] = coscos(2,3,20,1);
%% 3.2 Adding Short Sinusoid to a Long Signal Vector
% <=====Fill your code starts here
fs = 8000
sa = shortSinus(1,1200,0,fs,.6,.5);
sb = shortSinus(1,750,0,fs,.2,1.6);

ss = zeros(1,max((sa.end+1),max(sb.end+1)));
ss(sa.start:sa.end) = ss(sa.start:sa.end) + sa.wave;
ss(sb.start:sb.end) = ss(sb.start:sb.end) + sb.wave;

% To see spectrogram (required for checkoff)
figure(1);
plotspec(ss,fs,256)


%% 3.3 Spectrogram: Section Length and Negative Frequency
% Spectrogram of signal from 3.2 with negative frequencies.
figure(2);
plotspec(ss+j*1e-9,fs,128); colorbar
xlabel('Time (s)')
ylabel('Frequency (Hz)')
title('Section length = 128')
% Example code
% fs=8000; 
% tt=0:1/fs:0.5; 
% xx = cos(4000*pi*tt);
% yy=xx+cos(1600*pi*tt); 
% figure;
% plotspec(yy + 1i*1e-9, fs, 1024); colorbar;
% xlabel('Time (s)')
% ylabel('Frequency (Hz)')
% title('Section length = 1024')
% figure;
% plotspec(yy + 1i*1e-9, fs, 128); colorbar;
% xlabel('Time (s)')
% ylabel('Frequency (Hz)')
% title('Section length = 128')

% Spectrogram of DTMF digit 8 from previeous lab with negative frequencies.
% Fill in the code below:
% DTMFsig = load('DTMFsig.mat');
DTMFsigtt = 0:1/fs:0.3;
DTMFsig = cos(2*pi*852*DTMFsigtt+rand(1)) + cos(2*pi*1209*DTMFsigtt+rand(1)); %- Use random phases
DTMFsigxx = zeros(1,round(2*fs)); %- pre-allocate vector to hold DTMF signals
DTMFsign1 = round(0.6*fs); 
DTMFsign2 = DTMFsign1+length(DTMFsig)-1;
DTMFsigxx(DTMFsign1:DTMFsign2) = DTMFsigxx(DTMFsign1:DTMFsign2) + DTMFsig;

% Make the spectrogram for DTMFsig with 128 samples and 1024 samples.
% <===== Fill in your code here
figure(3);
subplot(2,1,1);
plotspec(DTMFsigxx,fs,128);
subplot(2,1,2);
plotspec(DTMFsigxx,fs,1024);
%% 3.4 Function for a Chirp
% Testing the function
% <===== Fill in Function makeLFMvals.m
myLFMsig.f1 = 200;
myLFMsig.t1 = 0; 
myLFMsig.t2 = 1.5;
myLFMsig.slope = 1800;
myLFMsig.complexAmp = 10*exp(1i*0.3*pi);
dt = 1/8000; % 8000 samples per sec is the sample rate
figure(4);
subplot(3,1,1);
outLFMsig = makeLFMvals(myLFMsig, dt);
% <===== Plot the values in outLFMsig 
plot(outLFMsig.times,outLFMsig.values)
% <===== Make a spectrogram for outLFMsig to see the linear frequency change 
subplot(3,1,2);
plotspec(outLFMsig.values,fs,128)
soundsc(outLFMsig.values,fs);
subplot(3,1,3);
plotspec(outLFMsig.values+j*1e-9,fs,128);

