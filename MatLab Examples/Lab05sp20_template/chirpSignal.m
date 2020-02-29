function [cc, tt] = chirpSignal(fSamp, tStart, tStop, f1, f2)
tt = tStart:1/fSamp:tStop;
mu = (f2-f1)/(tStop-tStart)/2;
slope = 2*mu;
f0 = f1-slope*tStart;
psi = 2*pi*( f0*tt + mu*tt.*tt);
cc = real(exp(1i*psi));




end