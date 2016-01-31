function [t,x] = expo(start,step,ennd,ampl,expp)
t=start:step:ennd;
x=ampl.*exp(expp*t);
end
