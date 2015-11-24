function [a_,c]=scaled_forward_var(O,A,B,P)
N=size(A,1);
T=length(O);
a=zeros(N,T);
a_=zeros(N,T);
a(:,1)=P(:).*B(:,O(1));
c(1)=1/sum(a(:,1));
a_(:,1)=a(:,1)*c(1);
for t=(2:T)
    a(:,t)=A.'*a_(:,t-1).*B(:,O(t));
    c(t)=1/sum(a(:,t),1);
    a_(:,t)=a(:,t)*c(t);
end
