function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = assignment1_3bcd.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(8, 17);
g1(1,5)=params(19)*exp(y(5))*getPowerDeriv(params(19)*exp(y(5)),(-params(4)),1);
g1(1,12)=(-(T(5)*params(2)*params(19)*exp(y(12))*getPowerDeriv(params(19)*exp(y(12)),(-params(4)),1)));
g1(1,7)=(-(T(1)*T(4)*T(3)*params(1)*exp(y(15))*params(20)*exp(y(7))*getPowerDeriv(params(20)*exp(y(7)),params(1)-1,1)));
g1(1,13)=(-(T(1)*T(4)*T(2)*params(17)*exp(y(13))*getPowerDeriv(params(17)*exp(y(13)),params(5),1)));
g1(1,14)=(-(T(1)*T(2)*T(3)*params(16)*exp(y(14))*getPowerDeriv(params(16)*exp(y(14)),1-params(1)-params(5),1)));
g1(1,15)=(-(T(1)*T(2)*T(3)*T(4)));
g1(2,4)=params(18)*exp(y(4))/(params(17)*exp(y(8)));
g1(2,5)=(-(params(6)*params(19)*exp(y(5))*getPowerDeriv(params(19)*exp(y(5)),params(4),1)/(params(5)*(1-params(17)*exp(y(8))))));
g1(2,8)=(-(params(18)*exp(y(4))*params(17)*exp(y(8))))/(params(17)*exp(y(8))*params(17)*exp(y(8)))-(-(T(6)*params(5)*(-(params(17)*exp(y(8))))))/(params(5)*(1-params(17)*exp(y(8)))*params(5)*(1-params(17)*exp(y(8))));
g1(3,4)=exp(y(4))*(1-params(1)-params(5))*params(18);
g1(3,9)=(-(exp(y(11))*params(16)*exp(y(9))));
g1(3,11)=(-(exp(y(11))*params(16)*exp(y(9))));
g1(4,4)=params(18)*exp(y(4));
g1(4,5)=(-(params(19)*exp(y(5))));
g1(4,6)=(-(params(21)*exp(y(6))));
g1(4,9)=(-(exp(y(11))*params(16)*exp(y(9))));
g1(4,11)=(-(exp(y(11))*params(16)*exp(y(9))));
g1(5,2)=(-params(7));
g1(5,10)=1;
g1(5,16)=(-1);
g1(6,3)=(-params(8));
g1(6,11)=1;
g1(6,17)=(-1);
g1(7,4)=params(18)*exp(y(4));
g1(7,1)=(-(T(9)*T(8)*exp(y(10))*params(20)*exp(y(1))*getPowerDeriv(params(20)*exp(y(1)),params(1),1)));
g1(7,8)=(-(T(9)*T(7)*params(17)*exp(y(8))*getPowerDeriv(params(17)*exp(y(8)),params(5),1)));
g1(7,9)=(-(T(7)*T(8)*params(16)*exp(y(9))*getPowerDeriv(params(16)*exp(y(9)),1-params(1)-params(5),1)));
g1(7,10)=(-(T(7)*T(8)*T(9)));
g1(8,6)=(-(params(21)*exp(y(6))));
g1(8,1)=(-((1-params(3))*params(20)*exp(y(1))));
g1(8,7)=params(20)*exp(y(7));

end
