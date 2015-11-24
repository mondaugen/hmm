% Given HMM and observation sequence, compute 
% most probable state sequence and compare it with actual state sequence
clear;
T=5000;
N=2;
K=3;

% Transition probabilities
A_=[ 0. 1.;
    1. 0.; ];
% Observation probabilities
B_=[ 0. 1. 0.;
    0. 0. 1. ];
% Initial state probabilities
P_= [1. 0.];

% Example sequence
[O,Q]=synth_from_hmm(A_,B_,P_,T);

%% Compute parameters
% Initialze randomly
A_=rand(N,N)
%B_=rand(N,K); %Use better estimate for B
B_.+=randn(N,K)*0.1
P_=rand(1,N);
% normalize to make valid probabilities
A_./=sum(A_,2);
B_./=sum(B_,2);
P_./=sum(P_,2);

[A,B,P,l_p]=baum_welch(O,A_,B_,P_,eps(0));
A
B
P
l_p
