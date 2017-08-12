%% Project 2 Pattern Formation



%% Question 1
% Here we find a steady state solution to
%%
% $u_t = -uv^2 + F(1 - u)$
%%
% $v_t = uv^2 - (c + F)v$

%%
% By inspection it is:
% u = 1,
% v = 0


%% Question 2
% Here we use the 'Forward Euler' method to approximate a numerical
% solution to the two ODEs which advances step-by-step in time.

type fe.m

%%
% 
% By trying various initial conditions the steady state solution
% appears to correspond to our initial inspection, u = 1, v = 0.
% By testing other values in the range (0,1) the ODE system appears
% to be very stable, resorting to the stable concentrations as t increases.

%%
% Initial conditions of
% $u_0 = 0, v_0 = 1$
%%
%
% <<fepic.png>>
% 

%%
% Initial conditions of
% $u_0 = v_0 = 0.5$
%%
%
% <<fepicnew.png>>
% 


%% Question 3
% Small changes in dt do not affect the stability of the system to any
% great degree. Large changes cause it to 'blow up' producing very
% large, divergent solution values.


dt = 14.286;   % critical time below which solutions are stable



%% Question 4
% Now we will model the heat equation.
% Similarly to how we dealt with time, we will discretization
% space into a vector of discrete values $x_i= i\bigtriangleup x, i = 0,1,...,N$. We then
% approximate the second derivative on those points with a matrix.

type lap1d_matrix.m




%% Question 5
% Here we write a script heat1.m which approximately solves the 1-D heat
% equation $u_t= u_{xx}$ with periodic boundary conditions on the domain
% $x \in$ [0,1) by combining the forward Euler code with the matrix L above.

type heat1.m

%%
% 
% <<heat1soln.png>>
% 




%% Question 6
% Our original ODE code had a time-step restriction to avoid numerical
% instability. heat1.m (discovered by running the code with various
% $\bigtriangleup t$ and $\bigtriangleup x$) has a critical value of
% $\bigtriangleup t$, below which we have numerical stability. It is:
% dt < 0.8*dx



%% Question 7
% Here we write a script heat2.m which approximately solves the 2-D heat
% equation $u_t= u_{xx} + u_{yy}$ with periodic boundary conditions on the domain
% $x \in$ [0,1)^2 by combining the forward Euler code with the matrix L
% using initial condition of:
% u = sin(2*pi*x) .* cos(4*pi*y)
% and a final time of 0.1

type heat2.m

%%
% Plot of initial conditions.
%
% <<heat2ini.png>>
% 

%%
% Plot of solution at _t_ = 0.1
%
% <<heat2fin.png>>
% 




%% Question 8
% Script called grayscott2.m which computes numerical solutions
% of the Gray–Scott equations
%%
% $u_t = \varepsilon u\bigtriangleup u - uv^2 + F(1 - u)$
%%
% $v_t = \varepsilon v\bigtriangleup v + uv^2 - (c + F)v$
%
% on the square periodic domain [0,1)^2
% using a final time of 3000 and initial conditions of

%
% u0 = min(1, 10*sqrt((x-.2).^2 + (y-.2).^2) );
% v0 = max(0, 1 - 10*sqrt((x-.3).^2 + 2*(y-.3).^2) );

type grayscott2.m

%%
% For spots we set _c_ = .065 and _F_ = .03
%
% <<spots40.gif>>
% 

%%
% For stripes we set _c_ = .065 and _F_ = .06
%
% <<stripes40.gif>>
% 




%% Question 9
% Setting the $\varepsilon$ diffusion coefficients constants to 0 leads to
% the system 'dying' as the initial concentration of colour disappears.
% A similar 'disappearance' happens when the $\varepsilon$ constants are
% nonzero but equal, but jsut at a different rate.

eu = 0
ev = eu

%%
% 
% <<euev0.gif>>
% 

eu = 5*(10^-5)
ev = eu

%%
% 
% <<euevsame.gif>>
% 



