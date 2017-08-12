% Lists the first 15 primes with at least difference 40
% from next largest prime.
n = 15;
r = 40;
k = 2;
v = 0;
    while v ~= n;
            t = nextprime(k) - k;
                if t >= r
                   disp(k)
                   v = v+1;         % keeps track of # primes
                end
                k = nextprime(k);
    end