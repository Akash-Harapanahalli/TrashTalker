fs = 8000;
myLFMsig.f1 = 200;
myLFMsig.t1 = 0; 
myLFMsig.t2 = 1.5;
myLFMsig.slope = 1800;
myLFMsig.complexAmp = 10*exp(1i*0.3*pi);
dt = 1/8000; % 8000 samples per sec is the sample rate
outLFMsig = makeLFMvals(myLFMsig, dt);
soundsc(outLFMsig.values, fs);