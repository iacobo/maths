function twin(N1,N2)
% Finds all the twin primes for which N1 <= n <= N2 and counts how many
% such twin primes there are.
k = N1:N2;
p = k(isprime(k) & isprime(k+2))
count = length(p)