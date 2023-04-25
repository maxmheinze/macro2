%% Advanced Macroeconomics 2 Assignment 
%%
%% Question 3
%%
%% Max Heinze and Tim Koenders
%%
%% B: Solving the RMC-model with Dynare, model in log-linear terms (using HAT variables)

var y c inve k n en a p;

varexo ea ep;

parameters alpha beta delta sigma gamma theta rho_a rho_p sigma_a sigma_p ass pss ky_ratioss eny_ratioss cy_ratioss enss nss yss css kss iss;

alpha = 0.3;
beta = 0.99;
sigma = 1;
theta = 3.48;
delta = 0.025;
gamma = 0.65;
rho_a = 0.95;
rho_p = 0.5;
sigma_a = 0.007;
sigma_p = 0.00001;
ass = 1;
pss = 1; 
ky_ratioss = alpha / (1/beta - (1-delta)) ;
eny_ratioss = 1 - alpha - gamma ;
cy_ratioss = 1 - delta*(ky_ratioss) - eny_ratioss;
nss = 1 / (1 + cy_ratioss*(theta/gamma));
yss = ky_ratioss^(alpha/gamma) * (nss) * eny_ratioss^((1-alpha-gamma)/gamma);
kss = ky_ratioss * yss;
enss = eny_ratioss * yss;
css = cy_ratioss * yss;
iss = yss - css - pss * enss;

model;
    (css*exp(c))^(-sigma) = beta * (css*exp(c(+1)))^(-sigma) * (1-delta + alpha *exp(a(+1)) * (kss*exp(k))^(alpha-1) * (nss*exp(n(+1)))^(gamma) * (enss*exp(en(+1)))^(1-alpha-gamma));
    (yss*exp(y))/(nss*exp(n)) = (((css*exp(c))^sigma)*theta)/(gamma*(1-(nss*exp(n))));
    (1-alpha-gamma) * yss*exp(y) = exp(p) * (enss*exp(en));
    (yss*exp(y)) = (css*exp(c)) + (iss*exp(inve)) + exp(p) * (enss*exp(en));
    (a) = rho_a * (a(-1)) + ea;
    (p) = rho_p * (p(-1)) + ep;
    (yss*exp(y)) = exp(a) * (kss*exp(k(-1)))^(alpha) * (nss*exp(n))^(gamma) * (enss*exp(en))^(1-alpha-gamma);
    (kss*exp(k)) = (iss*exp(inve)) + (1-delta) * (kss*exp(k(-1)));
end;

%% We switched the sign before ea in the equation (a) = rho_a * (a(-1)) - ea to construct and plot impulse responses to a 1% productivity decrease;
 
initval;
    k = 0;
    c = 0;
    a = 0;
    y = 0;
    n = 0;
    en = 0;
    inve = 0;
    p = 0;
end;

steady;

check;

shocks;
var ep; stderr 0.1;
end;

stoch_simul(periods=2100, irf =20, order=1); 

%% the following command lines can be used to plot the impulse response functions to a 1% decrease in TFP. 

%shocks;
%var ea; stderr 0.01;
%end;

%stoch_simul(periods=2100, irf =20, order=1); 

%% note: one would need to switch the sign of the shock in the (a) equations (i.e. (a) = rho_a * (a(-1)) + ea becomes (a) = rho_a * (a(-1)) - ea)



