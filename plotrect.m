function[t,x]=rectt(tstart,tstep,tend,A,w,c)
t1=c-(w/2.0):tstep:c+(w/2.0);
x1=A*ones(1,length(t1));
t2=tstart:tstep:c-(w/2.0);
x2=zeros(1,length(t2));
t3=c+(w/2.0):tstep:tend;
x3=zeros(1,length(t3));
x=[x2 x1 x3];
t=[t2 t1 t3];
end
