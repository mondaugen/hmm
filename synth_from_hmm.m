function [O,Q]=synth_from_hmm(A,B,P,T)
% SYNTH_FROM_HMM
%
% Synthesize a sequence O of length T with hidden states Q from the HMM
% parameters A, B and P where
%
% A(i,j) is the probability of transition from state i to state j
% B(i,k) is the probability of observation k, given state i
% P is the probability of initial states
Q=zeros(1,T);
O=zeros(1,T);
Q(1)=weighted_choose(P);
O(1)=weighted_choose(B(Q(1),:));
for t=(2:T)
    Q(t)=weighted_choose(A(Q(t-1),:));
    O(t)=weighted_choose(B(Q(t),:));
end
