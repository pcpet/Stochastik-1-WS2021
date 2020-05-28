function x = SimulateMarkovChain(n)

    
     A = double(sprand(n,n ,0.5) ~= 0);
     p = zeros(n, 1);
     p(1) = 1;
     
    
     %% normalize
     
     for k = 1:n
        A(k,:) = A(k,:)/norm(A(k,:), 1); 
     end


     %figure; 
     %imagesc(A);
     %pause(0.1);
     
     figure;
     breaker = 0;
     ind = 0;
     for k = 1:50
        q = A'*p;
        if (norm(p-q)<0.001)
            p =  double(rand(n, 1)>0.6); 
            p = p /norm(p,1);
            pause (2);
            ind = mod(ind+1, 4);
            breaker = breaker + 1;
        end    
        p = A'*p; 
        
        subplot(2,2,ind+1);
        bar(p); 
        pause (0.5);
        if (breaker >=8)
            break;
        end
        
     end

     
     %title('Distribution of Markov chains for various initial conditions')
     pause(0.1)
end

