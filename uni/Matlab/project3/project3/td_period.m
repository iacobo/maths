function period = td_period(N)
l = td_list(N);
m = length(l);
for i = 1:m;
    if l(i) == l(m);
        period = m-i;
        break
    end
end