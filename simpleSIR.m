function timeline = simpleSIR( Time, infectionRate, poluation, infected, removed)





figure;

runs = 200;

for l = 1:runs
    
S = poluation - infected- removed;
I = infected;
R = removed;    

timelineS(1) = S;
timelineI(1) = I;
timelineR(1) = R;
res(l, 1, 1) = S;
res(l, 1, 2) = I;
res(l, 1, 3) = R;

for k = 2:Time
    
   newRemoved = floor(I*rand/10);
   newInfected = floor(min(max(S*I/poluation*normrnd(infectionRate, infectionRate/2), 0), S));
   
   I = max(I + newInfected - newRemoved,0);
   S = max(S - newInfected, 0);
   R = max(R + newRemoved, 0);   
   
   timelineS(k) = S;
   timelineI(k) = I;
   timelineR(k) = R;

   res(l, k, 1) = S;
   res(l, k, 2) = I;
   res(l, k, 3) = R;
   
end


subplot(2,2,1)
plot([1:Time], timelineS, '-.b', [1:Time], timelineI, '-.r', [1:Time], timelineR, '-g');
%plot([1:Time], timelineI, '-.r', [1:Time], timelineR, '-g');
legend('Susceptible','Infected', 'Removed')
title('Simulation')
pause(0.1)
hold on
end

pause(0.1)
hold off


for l = 1:runs-1
  timelineS = timelineS + res(l, :, 1);
  timelineI = timelineI+ res(l, :, 2);
  timelineR = timelineR + res(l, :, 3);
end
    
subplot(2,2,2)
plot([1:Time], timelineS/runs, '-.b', [1:Time], timelineI/runs, '-.r', [1:Time], timelineR/runs, '-g');
%plot([1:Time], timelineI, '-.r', [1:Time], timelineR, '-g');
legend('Susceptible','Infected', 'Removed')
title('Expected Value')

pause(0.1)
subplot(2,2,3)
h = histogram(res(:,end,1), 20);
h.FaceColor = 'blue';
hold on
w = histogram(res(:,end, 2), 20);
w.FaceColor = 'red';
hold on
v =histogram(res(:,end, 3), 20);
v.FaceColor = 'green';
set(gca, 'xscale' , 'log')
legend('Susceptible','Infected', 'Removed')
title(strcat('n = ', num2str(Time)))
pause(0.1)
hold off


%while true
   for k = 1:Time
       subplot(2,2,4)
     h = histogram(res(:,k,1), 20);
        h.FaceColor = 'blue';
        hold on
        w = histogram(res(:,k, 2), 20);
        w.FaceColor = 'red';
        hold on
        v =histogram(res(:,k, 3), 20);
        v.FaceColor = 'green';
        set(gca, 'xscale' , 'log')
        title(strcat('n = ', num2str(k)))
        legend('Susceptible','Infected', 'Removed')
        pause (0.1);
        hold off
   end  
    pause(2)
%end

end