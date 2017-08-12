%% Project 3 Number Theory


%% Exercise 1

type nextprime.m

%% Exercise 2
% Lists the first 15 primes with at least difference 40 from next largest
% prime.

k = 2;
v = 0;
    while v ~= 15;
            t = nextprime(k) - k;
                if t >= 40
                   disp(k)
                   v = v+1;       % keeps track of # primes
                end
                k = nextprime(k);
    end



%% Exercise 3
% Finds all prime numbers _n1_ <= 1000 such that _n1_ + _n2_ + _n3_ is
% divisable by 19.

for k = 1:1000;
    if isprime(k);
        t = k + nextprime(k) + nextprime(nextprime(k));
                if mod(t,19)==0
                   disp(k)
                end
    end
end


%% Exercise 4

type twin.m


%% Exercise 5
% Counts how many twin primes are there for _n_ between 5 and 500.

twin(5,500)
%% Exercise 6
% Estimates Brun's constant using at most first 10000 twin primes.

n = 9999;
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

%% Exercise 7

type td_list.m

%%
% Finds the list associated with a starting integer of 789:
td_list(789) 


%% Exercise 8

type td_period.m

%%
% Finds the period of 789:
td_period(789) 


%% Exercise 9
% Determines the period of each three digit number from 001 to 999 and
% lists all unique periods determined.

A = NaN(999,1);
for j = 1:999;
    A(j,1) = td_period(j);
end
P = unique(A)

% Yes this is a proof that the period of all three digit numbers is either
% 1 or 5 because it exhaustively tests each 3 digit number from 001 to
% 999. It is not an elegant proof because it relies on a 'brute force'
% approach, and not a general falsifiable statement descriptive of all
% three digit possibilities.



