function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = assignment1_3bcd.static_resid_tt(T, y, x, params);
end
residual = zeros(8, 1);
lhs = T(1);
rhs = T(1)*params(2)*T(5);
residual(1) = lhs - rhs;
lhs = params(18)*exp(y(1))/(params(17)*exp(y(5)));
rhs = T(6)/(params(5)*(1-params(17)*exp(y(5))));
residual(2) = lhs - rhs;
lhs = exp(y(1))*(1-params(1)-params(5))*params(18);
rhs = params(16)*exp(y(6))*exp(y(8));
residual(3) = lhs - rhs;
lhs = params(18)*exp(y(1));
rhs = params(16)*exp(y(6))*exp(y(8))+params(19)*exp(y(2))+params(21)*exp(y(3));
residual(4) = lhs - rhs;
lhs = y(7);
rhs = y(7)*params(7)+x(1);
residual(5) = lhs - rhs;
lhs = y(8);
rhs = y(8)*params(8)+x(2);
residual(6) = lhs - rhs;
lhs = params(18)*exp(y(1));
rhs = T(4)*T(3)*T(7);
residual(7) = lhs - rhs;
lhs = params(20)*exp(y(4));
rhs = params(21)*exp(y(3))+(1-params(3))*params(20)*exp(y(4));
residual(8) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
