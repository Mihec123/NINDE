function res = MilneSistem (fun, a, b, y0, h)
% Opis:
%   MilneSistem  vrne  vrednost resitve sistema diferencialnih enacb
%   vecclenske metode tipa prediktor korektor reda 4
%   Zgled: (y''-1/3y^2y'+3xy=0, y(0)=0,y'(0)=1)
%       a = 0;b = 10;h = 0.05;y0 = [0,1];
%       fun = @(x,y) [y(2),1/3*y(1)^2*y(2)-3*x*y(1)];
%       res = MilneSistem (fun, a, b, y0, h);     
%
% Definicija:
%   res = MilneSistem (fun, a, b, y0, h)
%
% Vhodni podatki:
%   fun   funkcija diferencialne enacbe podana v obliki @(x,y)...
%   a  levo kraji??e intervala
%   b  desno kraji??e intervala
%   y0 zacetna vrednost za dan problem
%   h  velikost koraka
%
% Izhodni  podatek:
%   res  matrika velikosti length(y0) x ((b-a)/h +1) vrednosti diferencialne enacbe v
%        x(a+i*h)

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

