function [residual, g1, g2] = dynamic_resid_g1_g2(T, y, x, params, steady_state, it_, T_flag)
% function [residual, g1, g2] = dynamic_resid_g1_g2(T, y, x, params, steady_state, it_, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = assignment1_3bcd.dynamic_g2_tt(T, y, x, params, steady_state, it_);
    end
    [residual, g1] = assignment1_3bcd.dynamic_resid_g1(T, y, x, params, steady_state, it_, false);
    g2       = assignment1_3bcd.dynamic_g2(T, y, x, params, steady_state, it_, false);

end
