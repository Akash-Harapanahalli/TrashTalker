%%
%2.4.1 Time reversal 
% Here we reverse the decaying sinusoid from 2.2
% Please finish 2.2 first
load('Lab_1_decay.mat');
len = length(xDecay_new); %length of decaying sin
xDecayReverse = xDecay_new(length(xDecay_new):-1:1);; %reverse decaying sin
figure;
plot(tt,xDecayReverse); 
title('xDecayReversed for time 2 seconds'); xlabel('Time (sec)');
