function [s]=lagrang(x,y) 
s=0; 
n=length(x); 
z=linspace(x(1),x(n),100); 
% p=1; 
for k=1:n 
	p=1; 

for i=[1:k-1,k+1:n] 
p=p.*(z-x(i))/(x(k)-x(i)); 
end 
s=s+y(k).*p; 
end 
plot(x,y,'*r') 
hold on 
grid on 
plot(z,s)