

x = [0,0];
figure;
pause(0.1)
for k = 1:100
    
    
   scatter(x(1),x(2));
   title('Random Walk')
   set(gca, 'xlim',[-10, 10])
   set(gca, 'ylim',[-10, 10])
   pause(0.1)
   
   a = floor(4*rand);
   
   x(1) = x(1) - (a==0) + (a==1); 
   x(2) = x(2) - (a==2) + (a==3);  

   

    
end