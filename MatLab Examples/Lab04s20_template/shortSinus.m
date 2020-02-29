function xs = shortSinus(amp, freq, pha, fs, tstart, dur)
% amp = amplitude
% freq = frequency in cycle per second
% pha = phase, time offset for the first peak
% fs = number of sample values per second
% dur = duration in sec
%
tt = 0 : 1/fs : dur % time indices for all the values
xs.start = round(fs*tstart)
xs.end = round(fs*(tstart+dur))
xs.wave = amp * cos(freq*2*pi*tt + pha)
end
