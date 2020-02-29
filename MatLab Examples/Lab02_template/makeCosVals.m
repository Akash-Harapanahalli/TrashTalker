function sigOut = makeCosVals(sigIn, dur, tstart, dt)
    freq = sigIn.freq;
    X = sigIn.complexAmp;
    tt = tstart: dt : (dur+tstart); %-- Create the vector of times
 
    xx = abs(X)*cos(2*pi*freq*tt+angle(X)); %-- Vectorize the cosine evaluation
    sigOut.times = tt; %-- Put vector of times into the output structure
    sigOut.values = xx; %-- Put values into the output structure
end

