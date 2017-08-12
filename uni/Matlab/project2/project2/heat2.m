N = 16;
dx = 1/N;
x1d = (0:dx:(1-dx))';   % note, we left off "1"
y1d = x1d;              % same for y
[x,y] = meshgrid(x1d,y1d);

dt = 0.0005;            % time-step
tf = 0.1;               % final time
numsteps = ceil(tf/dt)  % if not integer then
dt = tf/numsteps        % adjust dt slightly

L1 = lap1d_matrix(N,dx);
I = speye(size(L1));
L = kron(L1,I) + kron(I,L1);

u0 = sin(2*pi*x) .* cos(4*pi*y);     % note: .*
u = u0;
surf(x,y,u);                      
size(u)

figure(1); clf; hold on;

for n = 1:numsteps
    figure(1); clf; hold on;
    u = u(:);                       % straightens out u
    ut = L*u;
    unew = u + dt.*ut;
    u = unew;
    uplot = reshape(u, size(x));
    surf(x, y, uplot);
    view(3);
end