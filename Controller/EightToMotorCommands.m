function motorCommands = EightToMotorCommands(data_file)
b = dlmread(data_file);
c = num2str(b(:,1))-'0';
data = c(:,2:end);
if(is_filter)
    s = size(data);
    motorCommands = zeros(s(1)+1,s(2));
    for i = 1:8
        motorCommands(:,i) = conv([1,-1], data(:,i));
    end
else
    motorCommands = data;
end
end