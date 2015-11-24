function [p,b] = backward_var(O,A,B,P)
N=size(A,1);
T=length(O);
b=zeros(N,T);
b(:,T)=ones(N,1);
for t=fliplr(1:(T-1))
    b(:,t)=A*(B(:,O(t+1)).*b(:,t+1));
end
p=sum(b(:,1));
