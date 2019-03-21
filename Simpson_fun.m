function I = Simpson_fun(f,x0,x2)
% Opis:
%   Simpson_fun  vrne  vrednost integrala funkcije f na intervalu (x0,x2)
%
% Definicija:
%   I = Simpson_fun(f,x0,x2)
%
% Vhodni podatki:
%   f   funkcija podana v obliki @(x)...
%   x0  levo kraji??e intervala
%   x2  desno kraji??e intervala
%
% Izhodni  podatek:
%   I   vrednost integrala funkcije f na intervalu (x0,x2)

h = (x2-x0)/2;

I = 1/3*h*(f(x0)+4*f(x0+h)+f(x2));



end

