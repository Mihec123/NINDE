function I = Sestavljen_Simpson( f,a,b,n)
% Opis:
%   Sestavljen_Simpson  vrne  vrednost integrala funkcije f na intervalu (a,b)
%   preko sestavljenega simpsonovega pravila
%
% Definicija:
%   I = Sestavljen_Simpson( f,a,b,n)
%
% Vhodni podatki:
%   f   funkcija podana v obliki @(x)...
%   a  levo kraji??e intervala
%   b  desno kraji??e intervala
%   n  ?tevilo delitev intervala 
%
% Izhodni  podatek:
%   I   vrednost integrala funkcije f na intervalu (a,b)


interval = (b-a)/n;
h = interval/2;
I=0;
for i=0:2*n
    if i==0 || i == 2*n
        I = I+f(a+i*h);
    elseif mod(i,2) == 0
        I = I+2*f(a+i*h);
    else
        I = I+4*f(a+i*h);
    end
end
    
I = (h/3)*I;

end

