% In-Lab Exercise 3.2: ECE 2026 
% This script is for performing 1-D FIR filtering on a 
% row from an image. Please finish the code below:

% a) 
load echart.mat

m = 65;
figure(1)
imshow(echart(m,:))

figure(2)
subplot(2,1,1)
stem(echart(m,:))

bdiffh = [1, -1];
yy1 = conv(echart(m,:), bdiffh);


subplot(2,1,2)
stem(yy1)

find(yy1)












