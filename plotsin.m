function [ t,x ] = plotsin(ts,tf,tstep,A,ps,w)

t=ts:tstep:tf;
x=A*sin(w*t+ps);


end

