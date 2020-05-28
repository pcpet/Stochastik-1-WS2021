function x = SimulateMarkovChain2(n)

    
     A = double(sprand(n^2,n^2, 0.005) ~= 0);
     p = zeros(n^2, 1);
     p(1) = 1;
     
     %% normalize
     
     for k = 1:n^2
        A(k,:) = A(k,:)/norm(A(k,:), 1); 
     end

     figure;
     ind = 0;
     pause (0.5);
     
     breaker = 0;
     
     for jij = 1:50
        q = A'*p;
        if (norm(p-q)<0.001)
            p =  double(rand(n^2, 1)>0.95); 
            p = p /norm(p,1);
            pause (2);
            ind = mod(ind+1, 4);
            breaker = breaker + 1;
        end    
        p = A'*p; 
        
        subplot(2,2,ind+1);
        imagesc(reshape(p, n, n)); 
        pause (0.5);
        if (breaker >=8)
            break;
        end
     
     end
    %title('Distribution of 2D Markov chains for various initial conditions')
    pause(0.1)
end