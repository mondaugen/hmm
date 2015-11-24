function [A,B,P,l_p]=baum_welch(O,A,B,P,e=0.01)
% BAUM_WELCH
%
% Given observation O and initial HMM parameters A, B, P, estimate more optimal
% parameters A, B, P increasing the likelihood of observing O.
% Scaling is applied in this implementation to avoid numerical precision
% problems.

% number of states
N=size(A,1);
% number of different observations
K=size(B,2);
% length of observation vector
T=length(O);
% forward-backward variable: the probability of state i occuring at time t and
% transitioning to state j at time t+1, given the observation and the parameters
X=zeros(N,N,T);
% the probability of being in state i at time t
G=zeros(N,T);
% The forward and backward variables
a=zeros(1,T);
b=zeros(1,T);
% the probability of the observation of sub-sequences O(1)..O(T), O(2)..O(T),
% etc.
p=ones(1,T);
% the previous probability (initialized to the smallest representable number
% greater than 0)
l_p_prev=log(realmin());
while (1)
    [a_,c]=scaled_forward_var(O,A,B,P);
    [b_]=scaled_backward_var(O,A,B,P,c);
    for t=fliplr(1:(T-1))
        p(t)=a_(:,t).'*(A*(B(:,O(t+1)).*b_(:,t+1)));
        X(:,:,t)=(a_(:,t).*(A.*(B(:,O(t+1)).*b_(:,t+1)).'))./p(t);
        G(:,t)=sum(X(:,:,t),2);
    end
    P=G(:,1);
    A=sum(X(:,:,1:(end-1)),3)./sum(G(:,1:(end-1)),2);
    B=(G*(O==((1:K).')).')./sum(G,2);
    l_p=-sum(log(c));
    if (l_p - l_p_prev) < e
        break;
    end
    l_p_prev=l_p;
end
