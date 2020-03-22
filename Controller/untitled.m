while(1)
    writePWMVoltage(a,'D2',0);
    pause(5);
    writePWMVoltage(a,'D2',2);
    pause(0.19);
    writePWMVoltage(a,'D2',0);
end