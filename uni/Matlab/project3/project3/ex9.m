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