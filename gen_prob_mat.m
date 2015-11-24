function [X] = gen_prob_mat(M,N)
% GEN_PROB_MAT
%
% Generate probability matrix of M rows and N columns s.t., each row adds up
% to 1.
X=randn(M,N);
X./=sum(X,2);
