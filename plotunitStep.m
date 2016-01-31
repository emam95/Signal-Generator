function[t,x]=unitStepp(tstart,tstep,tend,A,shift)
t2=tstart:tstep:shift;
x2=zeros(1,length(t2));
t1=shift:tstep:tend;
x1=A*ones(1,length(t1));
x=[x2 x1];
t=[t2 t1];
end