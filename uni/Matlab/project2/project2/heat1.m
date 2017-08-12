N = 16;
dx = 1/N;
L = lap1d_matrix(N,dx);
% make a grid
x = (0:dx:(1-dx))';     % note, stop before 1
u0 = sin(2*pi*x);       % initial conditions
dt = 0.0005;            % time-step
tf = 0.1;               % final time
numsteps = ceil(tf/dt)  % if not integer then
dt = tf/numsteps        % adjust dt slightly

figure(1); clf; hold on;

u = u0;
for n = 1:numsteps
    figure(1); clf; hold on;
    u = u(:);       % straightens out u
    ut = L*u;
    unew = u + dt*ut;
    u = unew;
    plot(x, u, 'mx');
end

hold on;

exact = exp((-4)*(pi^2)*0.1)*sin(2*pi*x);
plot(x, exact, 'c--');

xlabel('x');    legend('Approx Soln', 'Exact Soln')
