% Given HMM and observation sequence, compute 
% most probable state sequence and compare it with actual state sequence

T=20;
N=2;
K=3;

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

%% Compute parameters
% Initialze randomly
A=rand(N,N);
B=rand(N,K);
P=rand(1,N);
% normalize to make valid probabilities
A./=sum(A,2);
B./=sum(B,2);
P./=sum(P,2);

[A,B,P,p]=baum_welch(O,A,B,P,realmin());
A
B
P
p
