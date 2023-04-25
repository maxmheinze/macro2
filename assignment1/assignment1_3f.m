
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 format compact;
 clc; clear all; close all;
 
 % Parameter values
 alfa   = 0.3;
 betta  = 0.99;
 delta  = 0.025;
 gam    = 0.65;
 theta  = 3.48;
 sigma  = 1;
 rhoA   = 0.95;
 Ass    = 1;
 rhoP   = 0.5;
 Pss    = 1;

 % Steady state values
 Nss    = 0.2023;
 Yss    = 0.4326;
 Kss    = 3.6971;
 ENss   = 0.0216;
 Css    = 0.3185;
 Iss    = 0.0924;
 

 % Constructing matrices A and B:
 A  = zeros(8,8); 
 B  = zeros(8,8);
 
 ik = 1; 
 ia = 2;
 ip = 3;
 ic = 4; 
 in = 5; 
 iy = 6;
 ii = 7;
 ien = 8;
 
 
 % Equation 1
 A(1,ik) = (alfa-1)*(1-betta*(1-delta));
 A(1,ia) = (1-betta*(1-delta));
 A(1,ic) = -sigma;
 A(1,in) = gam*(1-betta*(1-delta));
 A(1,ien) = (1-alfa-gam)*(1-betta*(1-delta));
 B(1,ic) = -sigma;

 % Equation 2
 B(2,ic) = (theta/gam)*Nss*Css;
 B(2,in) = (theta/gam)*Nss*Css+Nss*Yss;
 B(2,iy) = -Yss+(Nss*Yss);

 % Equation 3
 B(3,ik) = alfa;
 B(3,ia) = 1;
 B(3,in) = gam;
 B(3,iy) = -1;
 B(3,ien) = 1-alfa-gam;

 % Equation 4
 B(4,ip) = Pss*ENss;
 B(4,iy) = -(1-alfa-gam)*Yss;
 B(4,ien) = Pss*ENss;

 % Equation 5
 A(5,ik) = Kss;
 B(5,ik) = (1-delta)*Kss;
 B(5,ii) = Iss;

 % Equation 6
 B(6,ip) = (Pss*ENss)/Yss;
 B(6,ic) = Css/Yss;
 B(6,iy) = -1;
 B(6,ii) = Iss/Yss;
 B(6,ien) = (Pss*ENss)/Yss;

 % Equation 7
 A(7,ia) = 1;
 B(7,ia) = rhoA;

 % Equation 8
 A(8,ip) = 1;
 B(8,ip) = rhoP;


 % Solving the System
 [G,H]=solab(A,B,3)



