function [ t,x ] = plotcos(ts,tf,tstep,A,w,ps)

t=ts:tstep:tf;
x=A*cos(w*t+ps);


end

