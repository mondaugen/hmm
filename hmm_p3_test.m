% Given HMM and observation sequence, compute probability that sequence was
% generated from the model parameters.

T=100;

% Transition probabilities
A=[ 0.75 0.25;
    0.25 0.75; ];
% Observation probabilities
B=[ 0.1 0.2 0.7;
    0.6 0.3 0.1 ];
% Initial state probabilities
P= [0.2 0.8];

% do N trials to see how they compare
N=10;
p=zeros(3,N);
for n=(1:N)
    % Example sequence
    [O,Q]=synth_from_hmm(A,B,P,T);
    % Compute forward probability
    p(1,n)=forward_var(O,A,B,P);
    % Compute backward probability
    p(2,n)=backward_var(O,A,B,P);
    % Compare with random variable
    R=randi(size(B,2),1,T);
    p(3,n)=forward_var(R,A,B,P);
end
'forward'
mean(p(1,:))
'backward'
mean(p(2,:))
'random'
mean(p(3,:))
