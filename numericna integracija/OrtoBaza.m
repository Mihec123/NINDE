function [Q,a,b] = OrtoBaza(skalarni_produkt,k)
% Opis:
%   OrtoBaza  pora?una bazo ortogonalnih polinomov, ter koeficiente v 3 clenski rekurzivni formuli
%   glede na nek skalarni produkt skalarni_produkt
%
% Definicija:
%   [Q,a,b] = OrtoBaza(skalarni_produkt,k)
%
% Vhodni podatki:
%   skalarni_produkt   funkcija podana v obliki @(f,g)... sprejme dve
%                      funkciji in vrne skalarni produkt teh dveh funkcij
%   k   dolzina baze
%
% Izhodni  podatek:
%   Q   celica z ortonormiranimi polinomi
%   a   matrika koeficientov v rekurzivni zvezi velikosti k+2 x 1
%   b   matrika koeficientov v rekurzivni zvezi velikosti k+2 x 1
%
%
%Zgled:
% aproksimacija skalarnega produkta integral f(x)*g(x)*ro(x) dx na 0,4 z
% diskretnim skalarnim produktom
%
%   ro = @(x) (4*x.^2).*((4-x).^2);
%   %interval = [0,4]
%   x = linspace(0,4,200); 
%   skal_prod = @(f,g) 4/200 .* sum(f(x).*g(x).*ro(x));
%   [Q,a,b] = OrtoBaza(skal_prod,5)
%
a = zeros(k+2,1);
b = zeros(k+2,1);
Q = {};
b(1) =0;
a(1) = 0;
Q_temp = @(x) ones(size(x)); 
for i = 2:k+2
    b(i) = sqrt(skalarni_produkt(Q_temp,Q_temp));
    Q{i-1} = @(x) Q_temp(x)./b(i);
    a(i) = skalarni_produkt(@(x) x.*Q{i-1}(x),@(x) Q{i-1}(x));
    if i >2
        Q_temp = @(x) (x-a(i)).*Q{i-1}(x) - b(i).*Q{i-2}(x);
    else
        Q_temp = @(x) (x-a(i)).*Q{i-1}(x);
    end
end



end

