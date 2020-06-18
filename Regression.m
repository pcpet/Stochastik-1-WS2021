
%%%% Grillenzirpen vs Temperatur

Grillenzirpen = [20.0000   31.4444
   16.0000   22.0000
   19.8000   34.0556
   18.4000   29.0556
   17.1000   27.0000
   15.5000   24.0000
   14.7000   20.9444
   17.1000   27.7778
   15.4000   20.7778
   16.2000   28.5000
   15.0000   26.4444
   17.2000   28.1111
   16.0000   27.0000
   17.0000   28.6111
   14.4000   24.6111];

figure; 
scatter(Grillenzirpen(:,1),Grillenzirpen(:,2))

%%%% Regressionsgerade finden:

N = 15;
gamma0 = mean(Grillenzirpen(:,2)) - mean(Grillenzirpen(:,1))/var(Grillenzirpen(:,1)) * (Grillenzirpen(:,1)'*Grillenzirpen(:,2)/N - mean(Grillenzirpen(:,1))*mean(Grillenzirpen(:,2)));
gamma1 = (Grillenzirpen(:,1)'*Grillenzirpen(:,2)/N - mean(Grillenzirpen(:,1))*mean(Grillenzirpen(:,2)))/var(Grillenzirpen(:,1));

hold on 

plot([14:21], gamma0 + gamma1*[14:21]);

hold off
pause(0.1)

%%%% Alter, Cholesterinspiegel vs Blutdruck 
%% die 2. Spalte ist das gewicht in lbs, wurde hier aber nicht verwendet

Blutdruck = [40 225 302 115
44 190 254 124
43 216 241 111
34 178 278 114
57 227 342 149
31 150 283 100
60 183 313 159
62 185 350 130
48 155 273 130
43 161 298 130
57 173 384 121
53 144 310 120
51 130 337 122
51 162 367 130
42 173 273 120
35 154 314 120
37 150 243 115
63 167 341 140
28 185 245 118
51 247 302 148
47 205 317 135
37 210 333 128
46 222 297 121
48 232 362 141
56 235 357 153
];

figure; 
scatter3(Blutdruck(:,1),Blutdruck(:,3), Blutdruck(:,4), 50,'filled', 'MarkerFaceColor',[0.75 .1 .1])

A = ones(25, 3);
A(:,2) = Blutdruck(:,1);
A(:,3) = Blutdruck(:,3);

gamma = (A'*A)\(A'*Blutdruck(:,4));

[X,Y] = meshgrid(20:5:65,240:5:350);


Z = gamma(1) + gamma(2)*X + gamma(3)*Y;


hold on

surf(X,Y,Z);

