function [ output_args ] = ComputePolya( increment, red, blue , maxN)
%COMPUTEPOLYA Summary of this function goes here
%   Detailed explanation goes here

figure;
out = [0:maxN-1];

for k = 1:maxN
    out(k) = nchoosek(maxN, k);
    
    for ell = 0:k-1
         out(k) = out(k)* (red + ell *increment)/(red + blue + ell*increment);        
    end
    for ell = k:maxN-1
         out(k)= out(k)/(red + blue + ell*increment);       
    end
    for ell = 0:maxN - k - 1
         out(k)= out(k)* (blue + ell * increment);        
    end    
end

increment = 0;
out2 = [0:maxN-1];
for k = 1:maxN
    out2(k) = nchoosek(maxN, k);
    
    for ell = 0:k-1
         out2(k) = out2(k)* (red + ell *increment)/(red + blue + ell*increment);        
    end
    for ell = k:maxN-1
         out2(k)= out2(k)/(red + blue + ell*increment);       
    end
    for ell = 0:maxN - k - 1
         out2(k)= out2(k)* (blue + ell * increment);        
    end    
end

figure;
plot([0:maxN-1], out, [0:maxN-1], out2);
title('Polya Distribution mit und ohne Inkrement')
pause(0.1)

end

