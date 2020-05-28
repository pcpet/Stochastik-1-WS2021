function out = givepoisson( k, lambda )
%GIVEPOISSON Summary of this function goes here
%   Detailed explanation goes here

out = zeros(1,k+1);

for l = 0:k
    
    out(l+1) = lambda^l/factorial(l) * exp(-lambda);

end
figure;
plot([0:k], out);
xlabel('k')
ylabel('Wkeit von k Erkrankten')

pause(0.1);
figure;
plot([0:k], cumsum(out));
xlabel('k')
ylabel('Wkeit von mind. k Erkrankten')
pause(0.1);
end

