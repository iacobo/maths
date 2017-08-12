% Finds all prime numbers n1 <= 1000 such that n1 + n2 + n3 is divisable
% by 19.
n = 1000;
r = 19;
for k = 1:n;
    if isprime(k);
        t = k + nextprime(k) + nextprime(nextprime(k));
                if mod(t,r)==0
                   disp(k)
                end
    end
end