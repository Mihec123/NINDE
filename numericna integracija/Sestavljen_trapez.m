function I = Sestavljen_trapez(f,a,b,n)
% Opis:
%   Sestavljen_trapez  vrne  vrednost integrala funkcije f na intervalu (a,b)
%   dobljeno s sestavljenim trapeznim pravilom
%
% Definicija:
%   I = Sestavljen_trapez(f,a,b,n)
%
% Vhodni podatki:
%   f   funkcija podana v obliki @(x)...
%   a   levo kraji??e intervala
%   b   desno kraji??e intervala
%   n   ?tevilo odsekov na katere razdelimo interval
%
% Izhodni  podatek:
%   I   vrednost integrala funkcije f na intervalu (a,b)

h = (b-a)/n;

I = f(a);
for i=1:n-1
    I = I+2*f(a+i*h);
end
I = I+f(b);
I = (h/2)*I;
    
end

