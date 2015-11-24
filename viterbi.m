function [Q,Y,D,p] = viterbi(O,A,B,P)
% VITERBI
%
% Given observation sequence O and HMM parameters A, B, P, find the most likely
% state sequence Q that generated O.

% Length of observation vector
T=length(O);
% Number of states
N=size(A,1);
% State vector
Q=zeros(1,length(O));
% Maxima of D
Y=zeros(N,T);
% Path scores
D=zeros(N,T);
% Initialize
D(:,1)=P(:).*B(:,O(1));
Y(:,1)=zeros(N,1);
for t=(2:T)
    [D(:,t),Y(:,t)]=max((D(:,t-1).*A).',[],2);
    D(:,t).*=B(:,O(t));
end
[p,Q(T)]=max(D(:,T));
for t=fliplr(1:(T-1))
    Q(t)=Y(Q(t+1),t+1);
end
