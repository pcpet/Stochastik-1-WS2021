function cents = estimateCenters( num_of_center )

%%% This function generates points based on a Gaussian mixture model and
%%% then estimates the centers.


%% First we generate a set of means and variances.
normal_distributions = zeros(100,3);

for k =1:length(normal_distributions)
    
    normal_distributions(k,1) = 5*rand;
    normal_distributions(k,2) = 5*rand;
    normal_distributions(k,3) = 0.1;    
end

%% the sum of the last "num_of_center" entries of normal_distributions are the "real" distribution that we seek to find.

true_centers = normal_distributions(end-num_of_center+1:end, :);

%% start simulation:

points = [];
figure;

for ell = 1:10000

%% We generate points by randomly choosing one of the clusters and then picking one point normally distributed according to the mean and variance of the cluster:   
    
ctr = randi(num_of_center);  
x = normal_distributions(end-ctr+1,1);
y = normal_distributions(end-ctr+1,2);
sigma = normal_distributions(end-ctr+1,3);
newpoint = sqrt(2*sigma)*[randn randn] + [x y];
points = [points; newpoint];


%%% We plot the points and the estimated and true means below:

scatter(points(:,1), points(:,2), [], 'blue');
if ell > 30
hold off;
scatter(points(:,1), points(:,2), [], 'blue');
    
hold on;
    scatter(cents(:,1),cents(:,2),80,'MarkerEdgeColor',[.8 .1 .1],...
              'MarkerFaceColor',[.8 .1 .1],...
              'LineWidth',1.5)
       scatter(true_centers(:,1),true_centers(:,2),40,'MarkerEdgeColor',[.1 .8 .1],...
              'MarkerFaceColor',[.1 .8 .1],...
              'LineWidth',1.5)       
end
pause(0.1);


%%% The computation of the maximum likely estimator is below:
if mod(ell,15)==0
    %% buildMatrix
    A = zeros(ell, 100);
    
    for j =1:ell
        for distr = 1:100
            x = normal_distributions(distr,1);
            y = normal_distributions(distr,2);
            sigma = normal_distributions(distr,3);
            A(j,distr) = 1/(2 * pi * sigma^2) * exp(-(points(j, 1)-x)^2/(2*sigma^2))*exp(-(points(j, 2)-y)^2/(2*sigma^2));
        end
    end
    rhs = ones(ell, 1);
    sol = OMP( A,rhs, num_of_center); %%% this solver is not optimal here. Of course we are only looking for vectors sol that have non-negative entries and sum up to 1. 
    % ideally one would solve a linearly constrained sparse regression problem here. But since the
    % number of rows is quite large, we want real-time results, and the full sparse regression problem is NP hard, I just used the very fast orthogonal
    % matching pursuit algorithm here.
    cents = normal_distributions(sol ~=0,1:2);

end

end