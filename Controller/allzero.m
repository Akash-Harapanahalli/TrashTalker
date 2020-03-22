motors = [' D2';' D4';' D6';' D7';' D9';'D11';'D12';'D13'];

for i = 1:8
    writePWMVoltage(a, strip(motors(i,:)), 0);
end