% function EightMotorCommandsToArduino(motor_commands)
% clear all;
% a = arduino();
motors = ['D13';'D12';'D11';' D9';' D7';' D6';' D4';' D2'];
 %[' D2';' D4';' D6';' D7';' D9';'D11';'D12';'D13'];
motor_commands = upTheme;

for i = 1:size(motors)
    configurePin(a,strip(motors(i,:)),'DigitalOutput');
end

T = 0.5;
s = size(motor_commands);

for j = 1:s(1)
    tic
    motor_flags = motor_commands(j,:);

    for i = 1:8
        if(motor_flags(i) == 1)
            writePWMVoltage(a, strip(motors(i,:)), 2);
        end
    end
    while(toc < 0.2)
        pause(0.001);
    end
    for i = 1:8
        writePWMVoltage(a, strip(motors(i,:)), 0);
    end
    while(toc < T)
        pause(0.001);
    end
end

% end
