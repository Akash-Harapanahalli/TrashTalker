function [xx,tt] = goodcos(ff,dur)
    tt = 0:1/(100*ff):dur; %-- gives 100 samples per period
    xx = real(exp(2i*pi*ff*tt));
end