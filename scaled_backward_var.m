function [b_]=scaled_backward_var(O,A,B,P,c)
N=size(A,1);
T=length(O);
b=zeros(N,T);
b_=zeros(N,T);
b(:,T)=ones(N,1);
b_(:,T)=b(:,T)*c(T);
for t=fliplr(1:(T-1))
    b(:,t)=A*(B(:,O(t+1)).*b_(:,t+1));
    b_(:,t)=b(:,t)*c(t);
end
