%% ECE 2026 - Lab 06 - Spring 2020
clear all
close all
clc

%% 3 In-Lab Exercises
%% 3.1 Sampling and Aliasing

% This section is using the GUI to explore sampling and aliasing. 
% Using con2dis GUI


%% 3.2 Aliasing a Siusoidal-FM Signal

%% a) 
% Write a function called sinChirp to generate a FM signal with
% sinusoidal instantaneous frequency
% <====== Finish the function before running the test code
% Testing the function 
A = 2; 
fc = 800;
alpha = 1000; 
beta = 1.5;
gamma = 0;
fs = 4000; 
dur = 2;
tStart = 0;
tt = tStart:1/fs:tStart+dur;
chirp = A*cos(2*pi*fc*tt+alpha*cos(2*pi*beta*tt+gamma)); 
[cc] = chirp;% <====== Fill in your sinChirp function here with out put cc

figure(1)
plotspec(cc + 1i*1e-9, fs, 128); colorbar; grid on;
xlabel('Time (s)')
ylabel('Frequency (Hz)')
soundsc(cc);

%% 3.3 Synthesizing a Test Image
clear all 
close all
clc
%% a) 
xpix = ones(256,1)*cos(2*pi*(0:255)/32);
% <====== use imshow or imshow to plot
figure(2)
imshow(xpix);


%% 3.4 Aliasing in a Test Image
clear all
close all
clc
%% a) 
% <====== your code starts here
wd = 2*pi*4/32; xpix4 = ones(256,1)*cos(wd*(0:255));
figure(3);
subplot(2,2,1);
imshow(xpix4);

wd = 2*pi*12/32; xpix12 = ones(256,1)*cos(wd*(0:255));
subplot(2,2,2)
imshow(xpix12);




%% b)  
dsxpix4 = xpix4(1:2:end,1:2:end);
dsxpix12 = xpix12(1:2:end,1:2:end);

figure(4)
subplot(2,2,1);
imshow(xpix4);

subplot(2,2,2);
imshow(xpix12);

subplot(2,2,3);
imshow(dsxpix4);

subplot(2,2,4);
imshow(dsxpix12);



