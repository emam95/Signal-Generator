function [ t,x ] = DC(ts,tstep,tf,a)
t=ts:tstep:tf;
x=a*ones(1,length(t));
end