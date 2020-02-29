function motorCommands = DataToMotorCommands(data)
s = size(data);
motorCommands = zeros(s(1)+1,s(2));
for i = 1:8
    motorCommands(:,i) = conv([1,-1], c(:,i));
end
end