%%
%2.1 string reversal
% You are asked to write the functionality into a function 
% and test the function with your full name. 
my_name = input("What's your name? ",'s');     %fill in your name
disp(revstring(my_name));       %finish the revstring function below

%%
function y = revstring(x)
% a function that reverses the input string
% x: input string
% disp(split(x,""))
% y: output string
% Write your command below:
y = x(length(x):-1:1);


end
