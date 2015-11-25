% Given HMM and observation sequence, compute 
% most probable state sequence and compare it with actual state sequence

T=10000;

% Transition probabilities
A=[ 0.75 0.25;
    0.25 0.75; ];
% Observation probabilities
B=[ 0.1 0.2 0.7;
    0.6 0.3 0.1 ];
% Initial state probabilities
P= [0.2 0.8];

% Example sequence
[O,Q]=synth_from_hmm(A,B,P,T);

% Most probable sequence
[Q_,Y_,D_,l_p_]=viterbi(O,A,B,P);

'log probability of proposed state sequence'
l_p_

% Compute percentage error
'% error'
sum(Q != Q_) / length(Q)

% Compare with random variable
R=randi(length(P),1,length(Q));
'% error with uniformly distributed states'
sum(Q != R) /length(Q)
