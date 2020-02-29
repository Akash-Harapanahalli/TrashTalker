%equation that you wish to convert to polar form
eq = sqrt(3)*(exp(j*0)+exp(j*pi/3)+exp(-j*pi/3)+exp(j*2*pi/3)+exp(-j*2*pi/3))

a = real(eq);
b = imag(eq);
z = sqrt(a^2+b^2);
phase = atan2(b,a)/pi; 

disp([num2str(z) 'e^(' num2str(phase) 'pi)'])