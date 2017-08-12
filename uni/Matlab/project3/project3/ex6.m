n = 9999;
% Estimates Brun's constant using at most first 10000 twin primes.
B = (1/3 + 1/5);
for m = 5:2:n;
% Uses next 10,000 odd numbers starting from 3, thus does
% not use any more than 10,000 twin primes.
    if (isprime(m) & isprime(m+2)) == 1
        t = (1/(m) + 1/(m+2));
        B = B + t;
    end
end
brun = B