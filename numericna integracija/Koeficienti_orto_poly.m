function [alfa,beta] = Koeficienti_orto_poly( n,a,b,utez)
% Opis:
%   Koeficienti_orto_poly  izra?una koeficiente tri?lenske rekurzivne
%   formule ortonormiranih polinomov po formuli iz predmeta aproksimacija
%
%   \hat{Q_k} = (x-\alpha_k)Q_{k-1} - \beta_k Q_{k-2}
%   Q_k = \hat{Q_k}/\beta_{k+1}
%   \beta_k = || \hat{Q_{k-1}} ||
%   \alpha_k = <xQ_{k-1},Q_{k-1}>
%
%   POMEMBNO: metoda deluje le ce je utez polinom!!!
%
% Definicija:
%   [alfa,beta] = Koeficienti_orto_poly( n,a,b,utez)
%
% Vhodni podatki:
%   n  do katerega polnimoa ra?unamo koeficiente (gre od 0 do n)
%   a  levo kraji??e intervala na katrem zelimo ortogonalnost
%   b  desno kraji??e intervala na katrem zelimo ortogonalnost
%   utez   koeficienti polinoma(matlab olbika) s katerim je spremenjen
%          skalarni produkt, ce ni podan argument se za utez uzame polinom
%          [1], kar pomeni da dobimo navadni skalarni produkt z integralom
%
% Izhodni  podatek:
%   alfa    koeficienti tri?lenske rekurzivne formule v matriki oblike 1 x n
%   beta    koeficienti tri?lenske rekurzivne formule v matriki oblike
%           1 x n+1

if nargin < 4
    utez = [1];
end

alfa = zeros(1,n);
beta=zeros(1,n+1);

predprejsn = [0];

prejsn = [1]; %konstanten polinom 1.
%conv je mno?enje dveh polinomov

beta(1) = sqrt(diff(polyval(polyint(conv(conv(utez,prejsn),prejsn)),[a b])));
prejsn = prejsn/beta(1);

for i = 1:n
    alfa(i) =  diff(polyval(polyint(conv(conv(conv([1,0],prejsn),prejsn),utez)),[a,b]));
    temp = [1,0]-[0,alfa(i)]; %(x-a_i) polinom
    
    %nardimo enotno dolzino prejsnih
    %[prejsn,predprejsn] = enotnadolzina(prejsn,predprejsn);

        
        
    zdejsntemp = conv(temp,prejsn);
    [zdejsntemp,predprejsn] = enotnadolzina(zdejsntemp,predprejsn);
    zdejsn = zdejsntemp - beta(i)*predprejsn;
    
    
    beta(i+1) = sqrt(diff(polyval(polyint(conv(conv(utez,zdejsn),zdejsn)),[a,b])));
    zdejsn = zdejsn/beta(i+1);
    
    predprejsn = prejsn;
    prejsn = zdejsn;
end
    
    
    




end


function [p,q] = enotnadolzina(p,q)
% Opis:
%   enotnadolzina  sprejme dve matriki(koeficiente polinomov) in jih naredi
%   enako dolge
%   npr. x^2 = [1,0,0], x^4 = [1,0,0,0,0] funkcija potem vrne
%   x^2 = [0,0,1,0,0], x^4 = [1,0,0,0,0]
%
% Definicija:
%   [p,q] = enotnadolzina(p,q)
%
% Vhodni podatki:
%   p  matrika velikosti 1 x m
%   q  matrika velikosti 1 x n
%
% Izhodni  podatek:
%   p    matrika velikosti 1 x max(m,n)
%   q    matrika velikosti 1 x max(m,n)
        
    if length(p) > length(q)
        dol = length(q);
        temp1 = zeros(1,length(p)-dol);
        q = [temp1,q];
    elseif length(p) < length(q)
        dol = length(p);
        temp1 = zeros(1,length(q)-dol);
        p = [temp1,p];
    
    
    end
end

