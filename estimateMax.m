function x = estimateMax(N)

rdp = N*rand(5*N,1);

figure;

for k = 1:500
    
    t1(k) = 2*sum(rdp(1:k))/k;
    t2(k) = max(rdp(1:k));
    t3(k) = (k+1)*max(rdp(1:k))/k;
    true(k) = N;
    
    t1_er(k) = (N-t1(k))^2;
    t2_er(k) = (N-t2(k))^2;
    t3_er(k) = (N-t3(k))^2;
    
    
    plot([1:k], t1, [1:k], t2, [1:k], t3, [1:k], true)
    legend('T1', 'T2', 'T3', strcat('N= ', num2str(N)) ,'Location', 'southeast')
    %hold on 
    %plot([1:k], t1_er, [1:k], t2_er, [1:k], t3_er)
    %hold off 
    pause(0.1);
end


end