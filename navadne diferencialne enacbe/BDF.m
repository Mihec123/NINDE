function res = BDF (fun, a, b, y0, h,k)
% Opis:
%   BDF  vrne  vrednost resitve diferencialne enacbe preko implicitne
%   k-clenske BDF metode
%
% Definicija:
%   res = BDF (fun, a, b, y0, h,k)
%
% Vhodni podatki:
%   fun   funkcija diferencialne enacbe podana v obliki @(x,y)...
%   a  levo kraji??e intervala
%   b  desno kraji??e intervala
%   y0 zacetna vrednost za dan problem
%   h  velikost koraka
%   k  koliko ?lenov nazaj gledamo metodo, ce ni podan je privzeta vrednost
%       4
%
% Izhodni  podatek:
%   res  matrika velikosti length(y0) x ((b-a)/h +1) vrednosti diferencialne enacbe v
%        x(a+i*h)

if nargin < 6
    k = 4;
end
stevilo = 1+(b-a)/h;
res = zeros(1,stevilo);

M = [0 0 0 0 0; 1/2 1/2 0 0 0; 1/2 0 1/2 0 0; 1 0 0 1 0; 0 1/6 2/6 2/6 1/6];
res(1:k) =  RungeKutaEksplicitnaEnoclenska( fun,a,a+(k-1)*h,y0,h,M );

koef = zeros(1,k+1);
temp = 0;
for l = 1:k
    temp = temp + nchoosek(l,0)*1/l;
end
koef(0+1) = temp;
for j=1:k
    temp = 0;
    for l = j:k
        temp = temp + nchoosek(l,j)*1/l;
    end
    koef(j+1) = (-1)^j*temp;
end

for i = k+1:stevilo
    xkord = a+(i-1-1)*h;
    fun1 = @(x) 1/koef(1)*h*fun(xkord+h,x) - sum((koef(2:end)/koef(1)).*flip(res(i-k:i-1)));
    
    zac = res(i-1) +h*fun(xkord,res(:,i-1)); %kaj vzet za zacetn priblizek
    res(i) = navadnaIteracija(fun1,zac,5,1e-6);
    

end

end


function y = navadnaIteracija(fun,y0,k,napaka)


yprejsn = y0;
for i = 1:k
    y = fun(yprejsn);
    if abs(y-yprejsn) < napaka
        break;
    else
        yprejsn = y;
    end

    
    
end






end

