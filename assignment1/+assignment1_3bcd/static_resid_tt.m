function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 7);

T(1) = (params(19)*exp(y(2)))^(-params(4));
T(2) = params(1)*exp(y(7))*(params(20)*exp(y(4)))^(params(1)-1);
T(3) = (params(17)*exp(y(5)))^params(5);
T(4) = (params(16)*exp(y(6)))^(1-params(1)-params(5));
T(5) = 1-params(3)+T(2)*T(3)*T(4);
T(6) = (params(19)*exp(y(2)))^params(4)*params(6);
T(7) = exp(y(7))*(params(20)*exp(y(4)))^params(1);

end
