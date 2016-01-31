function [ t , x ] = Impulse_Continuous( tstart, tstep, tend, location)
t1 = tstart: tstep: (location);
t2 = location;
t3 = (location): tstep: tend;
x1 = 0*t1;
x2 = 1;
x3 = 0*t3;
t = [t1 t2 t3];
x = [x1 x2 x3];
end

