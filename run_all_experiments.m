

%%%% Poisson Verteilung

p = 0.001; % Wkeit der Erkrankung einer Person
stud_one_room= 110; % Zahl der Studierenden in einem Hörsahl.
stud_uniWien= 90000; % Zahl der Studierenden an der Uni Wien.
lambda1 = stud_one_room*p;
lambda2 = stud_uniWien*p;

givepoisson(12, lambda1);
givepoisson(150, lambda2);


%%%% Polya Verteilung

UniWien = 90000;
TUWien = 30000;

ComputePolya(5000, UniWien, TUWien, 50);

%%%% Random Walk 

showRandomWalk;

%%%% Simulate 1d Markov Chain.

SimulateMarkovChain(10);


%%%% Simulate 2d Markov Chain.

SimulateMarkovChain2(50);


%%% SIR Modell:

number_of_days = 365;
infectionRate = 0.08;
population = 8800000;
infected_at_start = 1600;
removed_at_start = 15000;

simpleSIR(number_of_days, infectionRate, population, infected_at_start, removed_at_start);

%%% Maxmimum Schätzer:

true_maximum = 10000;

estimateMax(true_maximum);

%%% Maximum Likelihood Estimate of centers of sums of normal distributions.

number_of_centers = 3; %% should be below 100

estimateCenters( number_of_centers );



