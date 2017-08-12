function L = lap1d_matrix(N,dx);

% make differentiation matrix
e = ones(N,1);
L = spdiags([e -2*e e], [-1 0 1], N, N);
L(1,N) = 1;   % this gives periodic BCs
L(N,1) = 1;
L = L/dx^2;

end