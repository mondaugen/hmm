% Given HMM and observation sequence, compute 
% most probable state sequence and compare it with actual state sequence

T=5000;
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
A_=rand(N,N);
B_=rand(N,K); %Use better estimate for B
P_=rand(1,N);
% normalize to make valid probabilities
A_./=sum(A,2);
B_./=sum(B,2);
P_./=sum(P,2);

[A1,B1,P1,l_p1]=baum_welch_ns(O,A_,B_,P_,0.01);
A1
B1
P1
l_p1

[A2,B2,P2,l_p2]=baum_welch(O,A_,B_,P_,0.01);
A2
B2
P2
l_p2
