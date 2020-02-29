function [xx,tt] = coscos( f1, f2, fs, dur )
% COSCOS multiply two sinusoids
%
    t1 = 0:(1/fs):dur;
%     t2 = 0:(1/fs):dur; % error is caused here. Should be t2 = 0:(1/fs):dur;
    t2 = 0:(1/f2):dur; % error is caused here. Should be t2 = 0:(1/fs):dur;
    
    cos1 = cos(2*pi*f1*t1);
    cos2 = cos(2*pi*f2*t2);
%     xx = cos1 .* cos2; % error is caught here
    xx = cos1 .* cos2; % error is caught here
    tt = t1;
end