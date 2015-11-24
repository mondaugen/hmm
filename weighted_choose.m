function [s] = weighted_choose(f)
% WEIGHTED_CHOOSE
%
% Using probability function f (an array of values summing to 1), generate a
% random number u according to a uniform distribution on [0,1] and return s
% s.t., F(s) = u

F=cumsum(f);
u=rand(1,1);
s=find(F > u,1);
