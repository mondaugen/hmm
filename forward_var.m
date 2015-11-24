function [p,a] = forward_var(O,A,B,P)
% FORWARD_VAR
%
% Given the sequence of observations O and HMM parameters A, B, P where A is
% the state transition matrix, B is the observation matrix and P is a
% vector of initial state probabilities, compute the probability that O was
% generated from the model parameters.
%
% p is the probability
% a is the sequence of forward variable values
N=size(A,2);
a=zeros(N,length(O));
a(:,1)=P(:).*(B(:,O(1))(:));
T=length(O);
for t=(2:T)
    a(:,t)=(A.'*a(:,t-1)).*B(:,O(t));
end
p=sum(a(:,end));
