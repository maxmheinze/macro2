function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = assignment1_3bcd.static_g1_tt(T, y, x, params);
end
g1 = zeros(8, 8);
g1(1,2)=T(8)-T(5)*params(2)*T(8);
g1(1,4)=(-(T(1)*params(2)*T(4)*T(3)*params(1)*exp(y(7))*params(20)*exp(y(4))*getPowerDeriv(params(20)*exp(y(4)),params(1)-1,1)));
g1(1,5)=(-(T(1)*params(2)*T(4)*T(2)*T(9)));
g1(1,6)=(-(T(1)*params(2)*T(2)*T(3)*T(10)));
g1(1,7)=(-(T(1)*params(2)*T(2)*T(3)*T(4)));
g1(2,1)=params(18)*exp(y(1))/(params(17)*exp(y(5)));
g1(2,2)=(-(params(6)*params(19)*exp(y(2))*getPowerDeriv(params(19)*exp(y(2)),params(4),1)/(params(5)*(1-params(17)*exp(y(5))))));
g1(2,5)=(-(params(17)*exp(y(5))*params(18)*exp(y(1))))/(params(17)*exp(y(5))*params(17)*exp(y(5)))-(-(T(6)*params(5)*(-(params(17)*exp(y(5))))))/(params(5)*(1-params(17)*exp(y(5)))*params(5)*(1-params(17)*exp(y(5))));
g1(3,1)=exp(y(1))*(1-params(1)-params(5))*params(18);
g1(3,6)=(-(params(16)*exp(y(6))*exp(y(8))));
g1(3,8)=(-(params(16)*exp(y(6))*exp(y(8))));
g1(4,1)=params(18)*exp(y(1));
g1(4,2)=(-(params(19)*exp(y(2))));
g1(4,3)=(-(params(21)*exp(y(3))));
g1(4,6)=(-(params(16)*exp(y(6))*exp(y(8))));
g1(4,8)=(-(params(16)*exp(y(6))*exp(y(8))));
g1(5,7)=1-params(7);
g1(6,8)=1-params(8);
g1(7,1)=params(18)*exp(y(1));
g1(7,4)=(-(T(4)*T(3)*exp(y(7))*params(20)*exp(y(4))*getPowerDeriv(params(20)*exp(y(4)),params(1),1)));
g1(7,5)=(-(T(4)*T(7)*T(9)));
g1(7,6)=(-(T(3)*T(7)*T(10)));
g1(7,7)=(-(T(4)*T(3)*T(7)));
g1(8,3)=(-(params(21)*exp(y(3))));
g1(8,4)=params(20)*exp(y(4))-(1-params(3))*params(20)*exp(y(4));
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
