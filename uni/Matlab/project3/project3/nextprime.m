function p = nextprime(n)
%  Takes input argument N and returns the next largest prime p with p > N
if n<0 || isreal(n) == 0
    error('Project3:NegArg', 'Input must be a positive real number.')
elseif n > 2^32
    error('Project3:BigArg', 'The maximum value of n allowed is 2^32.')
else
    n = floor(n);
    if isprime(n) == 1
        p = n + 1;
    else p = n;
    end
        while isprime(p)==0
            p = p + 1;
        end
end