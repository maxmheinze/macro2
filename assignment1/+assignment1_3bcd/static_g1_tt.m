function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
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

assert(length(T) >= 10);

T = assignment1_3bcd.static_resid_tt(T, y, x, params);

T(8) = params(19)*exp(y(2))*getPowerDeriv(params(19)*exp(y(2)),(-params(4)),1);
T(9) = params(17)*exp(y(5))*getPowerDeriv(params(17)*exp(y(5)),params(5),1);
T(10) = params(16)*exp(y(6))*getPowerDeriv(params(16)*exp(y(6)),1-params(1)-params(5),1);

end
