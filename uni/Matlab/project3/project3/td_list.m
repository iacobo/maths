function A = td_list(N)
% Creates a list starting with a 3 digit integer N, and generating each
% subsequent number by reversing the digits of the former, and subtracting
% the smaller from the larger such that the last number in the list
% contains the first repeated number.
p = N;
A = NaN(1,10);
for i = 1:100
    A(1,i) = p;
        if p > 99, a = 1;
        elseif p <= 99 && p > 9, a = 10;
        else a = 100;
        end
                    q = a*(str2double(fliplr(num2str(p))));
                    t = abs(p - q);
                    if t ~= A(1,:);
                        p=t;
                    else A(1,i+1) = t;
                        break
                    end

end
A(isnan(A)) = [];
% Remove superfluous entries