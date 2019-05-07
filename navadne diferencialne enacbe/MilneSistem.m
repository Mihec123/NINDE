function res = MilneSistem (fun, a, b, y0, h)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
stevilo = (b-a)/h;
k = 4;

M = [0 0 0 0 0; 1/2 1/2 0 0 0; 1/2 0 1/2 0 0; 1 0 0 1 0; 0 1/6 2/6 2/6 1/6];
res = zeros(length(y0),stevilo+1);
res(:,1:k) = RungeKutaEksplicitnaEnoclenska( fun,a,a+(k-1)*h,y0,h,M );

for i =k+1:stevilo+1
    %prediktor
    x_n1 = a+(i-1-1)*h;
    ypred = res(:,i-4) + h/3*(8*fun(x_n1,res(:,i-1))'-4*fun(x_n1-h,res(:,i-2))'+8*fun(x_n1-2*h,res(:,i-3))');
    
    %korektor
    res(:,i) = res(:,i-2) + h/3*(fun(x_n1+h,ypred)'+4*fun(x_n1,res(:,i-1))'+fun(x_n1-h,res(:,i-2))');
end

end

