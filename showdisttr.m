function x = showdisttr(N, n)

distr = [];

for l = n:N
    distr = [distr nchoosek(l-1,n-1)];
end

distr = distr/nchoosek(N, n);

plot([n:N], distr);