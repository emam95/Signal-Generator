function [ t,x ] = ramp(ts,tstep,tf,s,c)
t=ts:tstep:tf;
x=s*t+c;
end