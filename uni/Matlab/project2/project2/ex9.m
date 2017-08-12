N = 100;
dx = 1/N;
x1d = (0:dx:(1-dx))';   % note, we left off "1"
y1d = x1d;              % same for y
[x,y] = meshgrid(x1d,y1d);

dt = 40*dx;   % time-step
tf = 3000;   % final time
numsteps = ceil(tf/dt)    % if not integer then
dt = tf/numsteps          % adjust dt slightly

L1 = lap1d_matrix(N,dx);
I = speye(size(L1));
L = kron(L1,I) + kron(I,L1);

c = 0.065;
F = 0.03;
eu = 5*(10^-5)
ev = eu
u0 = min(1, 10*sqrt((x-.2).^2 + (y-.2).^2) );
v0 = max(0, 1 - 10*sqrt((x-.3).^2 + 2*(y-.3).^2) );

figure(1); clf; hold on;

xlim([0,N]); ylim([0,N]);  % static limits

u = u0;
v = v0;
for n = 1:numsteps
    figure(1); hold on;
    u = u(:);
    v = v(:);
    ut = (eu)*L*u - u.*(v.^2) + F.*(1.-u);
    vt = (ev)*L*v + u.*(v.^2) - (c+F).*v;
    unew = u + dt*ut;
    vnew = v + dt*vt;
    u = unew;
    v = vnew;
    if mod(n,100) == 0
    uplot = reshape(u, size(x));
    vplot = reshape(v, size(x));
    h = pcolor(uplot);
    set(h, 'EdgeColor', 'none');
    g = pcolor(vplot);
    set(g, 'EdgeColor', 'none');
    frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
if n == 100;
imwrite(imind,cm,'euevsame.gif','gif', 'Loopcount',inf);
else
imwrite(imind,cm,'euevsame.gif','gif','WriteMode','append');
end
    end
end