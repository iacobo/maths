c = 0.065;
F = 0.03;
u0 = 0.5;     % initial conditions
v0 = 0.5;
dt = 0.1;   % time-step
tf = 100;   % final time
numsteps = ceil(tf/dt)    % if not integer then
dt = tf/numsteps          % adjust dt slightly

figure(1); clf; hold on;

u = u0;
v = v0;
for n = 1:numsteps
    ut = (-u).*(v.^2) + F.*(1.-u);
    vt = u.*(v.^2) - (c+F).*v;
    unew = u + dt*ut;
    vnew = v + dt*vt;
    u = unew;
    v = vnew;
    plot(n*dt, u, 'r*');
    plot(n*dt, v, 'b*');
end