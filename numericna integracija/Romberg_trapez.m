function M = Romberg_trapez(f,a,b,n,k)
% Opis:
%   Romberg_trapez  vrne  matriko vrednosti integrala funkcije f na intervalu (a,b)
%   dobljeno z rombergovo integracijo za trapezno pravilo
%
% Definicija:
%   M = Romberg_trapez(f,a,b,n)
%
% Vhodni podatki:
%   f   funkcija podana v obliki @(x)...
%   a   levo kraji??e intervala
%   b   desno kraji??e intervala
%   n   za?etno ?tevilo odsekov na katere razdelimo interval (h = (b-a)/n)
%   k   ?tevilo korakov v rombergovem postopku
%
% Izhodni  podatek:
%   M   matrika vrednosti integrala funkcije f na intervalu (a,b) na
%   posameznem postopku romberga

h = (b-a)/2;
M =zeros(k+1);
M(1,1) = Sestavljen_trapez(f,a,b,n);
for i = 2:k+1
    M(i,1)=Sestavljen_trapez(f,a,b,2^(i-1)*n); %fajn bi blo bl ucinkovito nardit
end

for j=2:k+1
    for l= j:k+1
        M(l,j) = (4^(j-1)*M(l,j-1) - M(l-1,j-1))/(4^(j-1)-1);
    end
end


end

