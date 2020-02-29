mySig.freq = 3; %-- (in hertz)
mySig.complexAmp = 4*exp(j*pi/6);
dur = 3;
start = -1;
dt = 1/(32*mySig.freq);
mySigWithVals = makeCosVals( mySig, dur, start, dt );
%- Plot the values in sigWithVals

plot(mySigWithVals.times, mySigWithVals.values)

