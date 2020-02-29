function sigBeatSum = sum2BeatStruct(sigBeatIn)
%
%--- Assume the five basic fields are present, plus the starting and ending times
tt = sigBeatIn.t1:1/8000:sigBeatIn.t2;
sum = zeros(1,length(tt));
for n=1:length(sigBeatIn)
    sum = sum + sigBeatIn.Amp*cos(2*pi*sigBeatIn.fDelt*tt+sigBeatIn.phiDelt).*cos(2*pi*sigBeatIn.fc*tt+sigBeatIn.phic);
end
%--- Add the four fields for the parameters in Equation (4)
sigBeatSum.f1 = (sigBeatIn.fDelt-sigBeatIn.fc);
sigBeatSum.f2 = (sigBeatIn.fDelt+sigBeatIn.fc);
sigBeatSum.X1 = sigBeatIn.Amp/2;
sigBeatSum.X2 = sigBeatIn.Amp/2;

sigBeatSum.values = sum %-- vector of signal values
sigBeatSum.times = tt %-- vector of corresponding times

end