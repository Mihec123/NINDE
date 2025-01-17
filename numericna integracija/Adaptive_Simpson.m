function [I,error,tocke] = Adaptive_Simpson( f,a,b,napaka,max_globina,prejsne_tocke,globina)
% Opis:
%   Adaptive_Simpson  vrne  vrednost integrala funkcije f na intervalu
%   (a,b) preko rekurzivne adaptivne metode
%
% Definicija:
%   I = Adaptive_Simpson( f,a,b,napaka,max_globina)
%
% Vhodni podatki:
%   f   funkcija podana v obliki @(x)...
%   a  levo kraji??e intervala
%   b  desno kraji??e intervala
%   napaka  pove do kaksne razlike primerjamo vrednosti integralov I_1 in
%           I_2 na posameznih korakih (glej opis v doma?i nalogi). ?e parameter ni
%           podan je nastavljen na 1e-6
%   
%   max_globina  kako globoko gremo v delitvi ce ni podan je privzeta vrednost
%             10
%   prejsne_tocke   delilne tocke intervala jih ne podajamo kot argument (namenjene rekurzivnim klicom same funkcije)
%   globina  pove na kateri globini smo ne podajamo kot argument (namenjene rekurzivnim klicom same funkcije)
%
% Izhodni  podatek:
%   I   vrednost integrala funkcije f na intervalu (a,b)
%   error   ocena napake integrala
%   tocke   deline tocke intervala

if nargin < 4
    napaka = 1e-6;
end
if nargin < 5
    max_globina = 10;
end
if nargin <6
    prejsne_tocke = [];
end
if nargin <7
    globina = 0;
end



I1 = Simpson_fun(f,a,b);
polovica = (a+b)/2;

I2 = Simpson_fun(f,a,polovica) + Simpson_fun(f,polovica,b);

tocke = [prejsne_tocke, a,b,polovica];
error = abs(I1-I2);

if error > napaka && globina < max_globina
    [I_tmp1,err1,tocke1] = Adaptive_Simpson( f,a,polovica,napaka/2,max_globina,tocke,globina+1);
    [I_tmp2,err2,tocke2] = Adaptive_Simpson( f,polovica,b,napaka/2,max_globina,tocke,globina+1);
    I = I_tmp1 + I_tmp2;
    %error = max(err1,err2);
    error = err1+err2;
    tocke = [tocke1, tocke2];
    tocke = unique(tocke);
    
else
    %nevem cist kako richardsonova esktrapolacija mislena
    I = (16*I2-I1)/15;
    error = abs(I2-I);
    
    
end



end

