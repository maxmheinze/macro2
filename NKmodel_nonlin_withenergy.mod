// NKmodel_nonlin.mod
//
// Solving the non-linear energy-extended NK model, model variables specified in log-linear terms
//


var PI PE R V A Y C N MC EN W Rreal;

varexo ev ea ep;

parameters phi betta sigma varphi mu xsi theta alpha lambda kappa phi_p phi_x rho_a rho_v rho_p sigma_a sigma_v sigma_p
           Ass PIss Yss Css Nss Wss PEss ENss MCss Rss Yflexss Rrealss GAPss;

// households 
betta  = 0.99;                                                        // this value implies a riskless annual return of about 4% 
sigma  = 2;                                                           // relative risk aversion coefficient 
varphi = 5;                                                           // inverse of the labour supply elasticity
mu     = 4;                                                           // interest semi-elasticity of money demand

// firms
xsi    = 0.75;                                                        // firms not adjusting the prices in each period 
theta  = 9;                                                           // elasticity of substitution across goods 
alpha  = 0.05;                                                           // when = 0, constant return technology
lambda = (1-betta*xsi)*(1-xsi)/xsi;
kappa  = lambda*((1-alpha)*sigma+varphi+alpha)/(1-alpha+alpha*theta); // slope of log-linear Phillips curve 
phi    = ((theta-1)*xsi)/((1-betta*xsi)*(1-xsi));                     // relation between Calvo coeff (xsi) and Rotemberg coeff (phi) when alpha=0

// monetary policy
phi_p  = 1.5;
phi_x  = 0.5/4;

// exogenous processes
rho_a   = 0.9; 
rho_v   = 0.5; 
rho_p   = 0.5;
sigma_a = 0.007;  //1; 
sigma_v = 0.0025; //1; 
sigma_p = 0.0025; //1; 

Ass  = 1;
Vss  = 1;
PIss = 1;
PEss = 1;
Yss  = ( ((theta-1)/theta) * Ass^(1+varphi) )^(1/(varphi+sigma));
ENss = Yss;
Css  = Yss;
Nss  = Yss;
Wss  = ((theta-1)/theta);
MCss = Wss/Ass;
Rss  = PIss/betta;
Yflexss = Yss;
Rrealss = Rss/PIss;
GAPss   = Yss/Yflexss;

model;

    // labor supply: 
    exp(N)^varphi * exp(C)^sigma = exp(W);

    // Marginal costs:
    exp(MC) = exp(A)^-1 * (1-alpha)^(alpha-1) * alpha^-alpha * exp(W)^1-alpha * exp(PE)^-alpha;

    // optimal pricing: 
    theta*exp(MC) - (theta-1) = phi*(exp(PI)-1)*exp(PI) - betta*phi*(exp(C(+1))/exp(C))^(-sigma)*(exp(PI(+1))-1)*exp(PI(+1))*(exp(Y(+1))/exp(Y));

    // optimal labor-energy ratio
    exp(N)/exp(EN) = ((1-alpha)/alpha) * (exp(PE)/exp(W));

    // Euler equation
    1 = betta* (exp(C(+1))/exp(C))^(-sigma) * (exp(R)/exp(PI(+1)));

    // resource constraint
    exp(C) + exp(PE) * exp(EN) + phi/2 * (exp(PI)-1)^2 * exp(Y) = exp(Y); 

    //production function
    exp(Y) = exp(A) * exp(N);

    // Monetary Policy: Taylor Rule 
    //exp(R)/Rss =  exp(PI)^phi_p * (exp(Y)/exp(Yflex))^phi_x * exp(V);
    //exp(R)/Rss =  exp(PI)^phi_p * (exp(Y)/Yss)^phi_x * exp(V);
    exp(R)/Rss =  exp(PI)^phi_p * exp(V);

    // Definition of Yflex:
    //exp(Yflex) = ( ((theta-1)/theta) * exp(A)^(1+varphi) )^(1/(varphi+sigma));

    // Exogenous Process for Monetary Shock
    V = rho_v * V(-1) + ev; 

    // Exogenous Process for TFP Shock
    A = rho_a * A(-1) + ea;
    
    // Exogenous Process for P shock
    PE = rho_p * PE(-1) + ep; 
    
    // Other variables carried in the system (not required to obtain solution)
    
    // output under sticky prices
    //exp(GAP) = exp(Y) / exp(Yflex);
    
    // real interest rate
    exp(Rreal) = exp(R) / exp(PI(+1));

end;

initval;
  //GAP  =  log(GAPss);
  PI   =  log(PIss);
  PE   =  log(PEss); 
  R    =  log(Rss);
  V    =  log(Vss);
  A    =  log(Ass);
  Y    =  log(Yss);
  C    =  log(Css);
  N    =  log(Nss);
  MC   =  log(MCss);
  W    =  log(Wss);
  //Yflex=  log(Yflexss);
  Rreal=  log(Rrealss);
end;

steady;

check;

shocks;
//var ea = sigma_a^2;
//var ev = sigma_v^2;
var ea = 1^2; // unit shock to technology; CAREFUL: do not use if order ~=1
var ev = 1^2; //
var ep = 1^2; //  
end;


stoch_simul(irf=20, order=1);      



