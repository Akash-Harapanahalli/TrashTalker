function EightMotorCommandsToArduino(motor_commands)
a = arduino();
photodiodes = ['D22';'D24';'D26';'D28';'D30';'D32';'D34';'D36'];
motors      = ['D23';'D25';'D27';'D29';'D31';'D33';'D35';'D37'];

mask        = [0,0,0,0,0,0,0,0];

for i = 1:size(photodiodes)
    configurePin(a,photodiodes(i,:),'DigitalInput');
end
for i = 1:size(motors)
    configurePin(a,motors     (i,:),'DigitalOutput');
end

T = 0.25;
s = size(motor_commands);

for j = 1:s(1)
    tic
    motor_flags = motor_commands(j,:);

    for i = 1:8
        if(motor_flags(i) == 1)
            mask(i) = 1;
            writePWMVoltage(a, motors(i,:), 2);
        end
    end
    pause(0.1);

    while(sum(mask) > 0)
        for i = 1:8
            if(motor_flags(i) == 1 && readDigitalPin(a,photodiodes(i)))
                mask(i) = 0;
                writePWMVoltage(a, motors(i,:), 2);
            end
        end
    end

    while(toc < T)
        pause(0.001);
    end
end
end
