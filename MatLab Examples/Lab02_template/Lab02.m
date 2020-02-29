%% ECE 2026 - Lab 02 - Spring 2020
%
% Notes:
%
% SPF-toolbox is needed for the first 2 sections. The download and
% directions are on t-square, and the desktops in lab should have it
% installed already.

%% 3.2 Vectorization 

% Here is the unmodified code whose inner loop needs to be vectorized.

%--- make a plot of sum of cosines
dt = 1/800;
XX = rand(1,3).*exp(2i*pi*rand(1,3)); %--Random amplitude and phases
freq = 20;
ccsum = zeros(1,500);
for kx = 1:length(XX)
    for kt = 1:500
        t = kt*dt;
        Ak = abs(XX(kx));
        phik = angle(XX(kx));
        ccsum(kt) = ccsum(kt) + Ak*cos(2*pi*freq*t + phik);
        tt(kt) = t;
    end
end
plot(tt,ccsum, 'b-') %-- Plot the sum sinusoid
title('Non-Vectorized Inner Loop')
grid on; zoom on; shg; hold on
%%
% Here starts the code with the inner loop vectorized
% Please run previous section first

ccsum = zeros(1,500);
for kx = 1:length(XX)
%Your code starts here
    kt=1:500
    ccsum = ccsum + abs(XX(kx))*cos(2*pi*freq*kt*dt + angle(XX(kx)));
end
plot(tt,ccsum, 'r--') %-- Plot the sum sinusoid
title('Vectorized Inner Loop')
legend('Non-Vectorized', 'Vectorized')
grid on; zoom on; shg; hold off

%% 3.3 M-File to Generate One Sinusoid

% Please finish the makeCosVals.m first

% Testing the function 
mySig.freq = 3; %-- (in hertz)
mySig.complexAmp = 4*exp(1i*pi/6);
dur = 3;
start = -1;
dt = 1/(32*mySig.freq);
mySigWithVals = makeCosVals( mySig, dur, start, dt);
%plotting code goes here


%% 3.4  Sinusoidal Synthesis with an M-file: Different Frequencies

% 3.4.1

% Please finish the addCosVals.m first

% Testing the function
ss(1).freq = 21; ss(1).complexAmp = exp(1i*pi/4);
ss(2).freq = 15; ss(2).complexAmp = 2i;
ss(3).freq = 9; ss(3).complexAmp = -4;
dur = 1;
tstart = -0.5;
dt = 1/(21*32); %-- use the highest frequency to define delta_t
ssOut = addCosVals(ss, dur, tstart, dt);
%plotting code goes here
plot(ssOut.times, ssOut.values) %Comment out this line if you meet error running previous sections




