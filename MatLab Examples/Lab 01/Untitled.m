eq = exp(j*(1/5)*pi)-2*exp(j*(2/5)*pi)

a = real(eq);
b = imag(eq);
z = sqrt(a^2+b^2)


%in terms of pi
phase = atan2(b,a)/pi 

disp([num2str(z) 'e^' num2str(phase)])