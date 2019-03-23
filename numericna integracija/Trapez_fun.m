function I = Trapez_fun(f,a,b)
% Opis:
%   Trapez_fun  vrne  vrednost integrala funkcije f na intervalu (a,b)
%   dobljeno s trapeznim pravilom
%
% Definicija:
%   I = Trapez_fun(f,a,b)
%
% Vhodni podatki:
%   f   funkcija podana v obliki @(x)...
%   a  levo kraji??e intervala
%   b  desno kraji??e intervala
%
% Izhodni  podatek:
%   I   vrednost integrala funkcije f na intervalu (a,b)


I = (b-a)*(f(a)+f(b))/2;

end
