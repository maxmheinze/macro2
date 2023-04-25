%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'assignment1_3bcd';
M_.dynare_version = '5.4';
oo_.dynare_version = '5.4';
options_.dynare_version = '5.4';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'ea'};
M_.exo_names_tex(1) = {'ea'};
M_.exo_names_long(1) = {'ea'};
M_.exo_names(2) = {'ep'};
M_.exo_names_tex(2) = {'ep'};
M_.exo_names_long(2) = {'ep'};
M_.endo_names = cell(8,1);
M_.endo_names_tex = cell(8,1);
M_.endo_names_long = cell(8,1);
M_.endo_names(1) = {'y'};
M_.endo_names_tex(1) = {'y'};
M_.endo_names_long(1) = {'y'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'c'};
M_.endo_names_long(2) = {'c'};
M_.endo_names(3) = {'inve'};
M_.endo_names_tex(3) = {'inve'};
M_.endo_names_long(3) = {'inve'};
M_.endo_names(4) = {'k'};
M_.endo_names_tex(4) = {'k'};
M_.endo_names_long(4) = {'k'};
M_.endo_names(5) = {'n'};
M_.endo_names_tex(5) = {'n'};
M_.endo_names_long(5) = {'n'};
M_.endo_names(6) = {'en'};
M_.endo_names_tex(6) = {'en'};
M_.endo_names_long(6) = {'en'};
M_.endo_names(7) = {'a'};
M_.endo_names_tex(7) = {'a'};
M_.endo_names_long(7) = {'a'};
M_.endo_names(8) = {'p'};
M_.endo_names_tex(8) = {'p'};
M_.endo_names_long(8) = {'p'};
M_.endo_partitions = struct();
M_.param_names = cell(21,1);
M_.param_names_tex = cell(21,1);
M_.param_names_long = cell(21,1);
M_.param_names(1) = {'alpha'};
M_.param_names_tex(1) = {'alpha'};
M_.param_names_long(1) = {'alpha'};
M_.param_names(2) = {'beta'};
M_.param_names_tex(2) = {'beta'};
M_.param_names_long(2) = {'beta'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'delta'};
M_.param_names_long(3) = {'delta'};
M_.param_names(4) = {'sigma'};
M_.param_names_tex(4) = {'sigma'};
M_.param_names_long(4) = {'sigma'};
M_.param_names(5) = {'gamma'};
M_.param_names_tex(5) = {'gamma'};
M_.param_names_long(5) = {'gamma'};
M_.param_names(6) = {'theta'};
M_.param_names_tex(6) = {'theta'};
M_.param_names_long(6) = {'theta'};
M_.param_names(7) = {'rho_a'};
M_.param_names_tex(7) = {'rho\_a'};
M_.param_names_long(7) = {'rho_a'};
M_.param_names(8) = {'rho_p'};
M_.param_names_tex(8) = {'rho\_p'};
M_.param_names_long(8) = {'rho_p'};
M_.param_names(9) = {'sigma_a'};
M_.param_names_tex(9) = {'sigma\_a'};
M_.param_names_long(9) = {'sigma_a'};
M_.param_names(10) = {'sigma_p'};
M_.param_names_tex(10) = {'sigma\_p'};
M_.param_names_long(10) = {'sigma_p'};
M_.param_names(11) = {'ass'};
M_.param_names_tex(11) = {'ass'};
M_.param_names_long(11) = {'ass'};
M_.param_names(12) = {'pss'};
M_.param_names_tex(12) = {'pss'};
M_.param_names_long(12) = {'pss'};
M_.param_names(13) = {'ky_ratioss'};
M_.param_names_tex(13) = {'ky\_ratioss'};
M_.param_names_long(13) = {'ky_ratioss'};
M_.param_names(14) = {'eny_ratioss'};
M_.param_names_tex(14) = {'eny\_ratioss'};
M_.param_names_long(14) = {'eny_ratioss'};
M_.param_names(15) = {'cy_ratioss'};
M_.param_names_tex(15) = {'cy\_ratioss'};
M_.param_names_long(15) = {'cy_ratioss'};
M_.param_names(16) = {'enss'};
M_.param_names_tex(16) = {'enss'};
M_.param_names_long(16) = {'enss'};
M_.param_names(17) = {'nss'};
M_.param_names_tex(17) = {'nss'};
M_.param_names_long(17) = {'nss'};
M_.param_names(18) = {'yss'};
M_.param_names_tex(18) = {'yss'};
M_.param_names_long(18) = {'yss'};
M_.param_names(19) = {'css'};
M_.param_names_tex(19) = {'css'};
M_.param_names_long(19) = {'css'};
M_.param_names(20) = {'kss'};
M_.param_names_tex(20) = {'kss'};
M_.param_names_long(20) = {'kss'};
M_.param_names(21) = {'iss'};
M_.param_names_tex(21) = {'iss'};
M_.param_names_long(21) = {'iss'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 8;
M_.param_nbr = 21;
M_.orig_endo_nbr = 8;
M_.aux_vars = [];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.orig_eq_nbr = 8;
M_.eq_nbr = 8;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 4 0;
 0 5 12;
 0 6 0;
 1 7 0;
 0 8 13;
 0 9 14;
 2 10 15;
 3 11 0;]';
M_.nstatic = 2;
M_.nfwrd   = 3;
M_.npred   = 2;
M_.nboth   = 1;
M_.nsfwrd   = 4;
M_.nspred   = 3;
M_.ndynamic   = 6;
M_.dynamic_tmp_nbr = [9; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , '4' ;
  5 , 'name' , 'a' ;
  6 , 'name' , 'p' ;
  7 , 'name' , '7' ;
  8 , 'name' , '8' ;
};
M_.mapping.y.eqidx = [2 3 4 7 ];
M_.mapping.c.eqidx = [1 2 4 ];
M_.mapping.inve.eqidx = [4 8 ];
M_.mapping.k.eqidx = [1 7 8 ];
M_.mapping.n.eqidx = [1 2 7 ];
M_.mapping.en.eqidx = [1 3 4 7 ];
M_.mapping.a.eqidx = [1 5 7 ];
M_.mapping.p.eqidx = [3 4 6 ];
M_.mapping.ea.eqidx = [5 ];
M_.mapping.ep.eqidx = [6 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [4 7 8 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(8, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(21, 1);
M_.endo_trends = struct('deflator', cell(8, 1), 'log_deflator', cell(8, 1), 'growth_factor', cell(8, 1), 'log_growth_factor', cell(8, 1));
M_.NNZDerivatives = [31; -1; -1; ];
M_.static_tmp_nbr = [7; 3; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.3;
alpha = M_.params(1);
M_.params(2) = 0.99;
beta = M_.params(2);
M_.params(4) = 1;
sigma = M_.params(4);
M_.params(6) = 3.48;
theta = M_.params(6);
M_.params(3) = 0.025;
delta = M_.params(3);
M_.params(5) = 0.65;
gamma = M_.params(5);
M_.params(7) = 0.95;
rho_a = M_.params(7);
M_.params(8) = 0.5;
rho_p = M_.params(8);
M_.params(9) = 0.007;
sigma_a = M_.params(9);
M_.params(10) = 0.00001;
sigma_p = M_.params(10);
M_.params(11) = 1;
ass = M_.params(11);
M_.params(12) = 1;
pss = M_.params(12);
M_.params(13) = M_.params(1)/(1/M_.params(2)-(1-M_.params(3)));
ky_ratioss = M_.params(13);
M_.params(14) = 1-M_.params(1)-M_.params(5);
eny_ratioss = M_.params(14);
M_.params(15) = 1-M_.params(3)*M_.params(13)-M_.params(14);
cy_ratioss = M_.params(15);
M_.params(17) = 1/(1+M_.params(15)*M_.params(6)/M_.params(5));
nss = M_.params(17);
M_.params(18) = M_.params(13)^(M_.params(1)/M_.params(5))*M_.params(17)*M_.params(14)^((1-M_.params(1)-M_.params(5))/M_.params(5));
yss = M_.params(18);
M_.params(20) = M_.params(13)*M_.params(18);
kss = M_.params(20);
M_.params(16) = M_.params(14)*M_.params(18);
enss = M_.params(16);
M_.params(19) = M_.params(15)*M_.params(18);
css = M_.params(19);
M_.params(21) = M_.params(18)-M_.params(19)-M_.params(12)*M_.params(16);
iss = M_.params(21);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(4) = 0;
oo_.steady_state(2) = 0;
oo_.steady_state(7) = 0;
oo_.steady_state(1) = 0;
oo_.steady_state(5) = 0;
oo_.steady_state(6) = 0;
oo_.steady_state(3) = 0;
oo_.steady_state(8) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(2, 2) = (0.1)^2;
options_.irf = 20;
options_.order = 1;
options_.periods = 2100;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'assignment1_3bcd_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'assignment1_3bcd_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'assignment1_3bcd_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'assignment1_3bcd_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'assignment1_3bcd_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'assignment1_3bcd_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'assignment1_3bcd_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
