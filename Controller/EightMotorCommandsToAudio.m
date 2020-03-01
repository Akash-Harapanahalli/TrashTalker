function EightMotorCommandsToAudio(motor_commands)
motorKeys = [49,50,52,54,56,57,59,61];
fs = 8000;
T = 0.25;
s = size(motor_commands);
flen = length(key2sinus(motorKeys(1),10,0,fs,T));
f = zeros(1,flen * s(1));
for j = 1:s(1)
    curr = motor_commands(j,:);
    for i = 1:8
        if(curr(i) == 1)
            f((j-1)*flen+1:(j)*flen) = f((j-1)*flen+1:(j)*flen) + key2sinus(motorKeys(i),10,0,fs,T);
        end
    end
end
soundsc(f,fs);
figure;
plot(f);
figure;
plotspec(f,fs,1024);
end