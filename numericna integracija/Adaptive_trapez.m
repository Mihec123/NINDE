function [I,error,tocke] = Adaptive_trapez( f,a,b,napaka,max_globina,prejsne_tocke,globina)
% Opis:
%   Adaptive_Simpson  vrne  vrednost integrala funkcije f na intervalu
%   (a,b) preko rekurzivne adaptivne metode
%
% Definicija:
%   I = Adaptive_trapez( f,a,b,napaka,max_step)
%
% Vhodni podatki:
%   f   funkcija podana v obliki @(x)...
%   a  levo kraji??e intervala
%   b  desno kraji??e intervala
%   napaka  pove do kaksne razlike primerjamo vrednosti integralov I_1 in
%           I_2 na posameznih korakih (glej opis v doma?i nalogi). ?e parameter ni
%           podan je nastavljen na 1e-6
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
if nargin < 7
    globina = 0;
end



I1 = Trapez_fun(f,a,b);
tretina = (b-a)/3;

I2 = Trapez_fun(f,a,a+tretina) + Trapez_fun(f,a+tretina,a+2*tretina)+Trapez_fun(f,a+2*tretina,b);

tocke = [prejsne_tocke, a,b,a+tretina,a+2*tretina];
error = abs(I1-I2);

if (error > napaka) && (globina < max_globina)
    [I_tmp1,err1,tocke1] = Adaptive_trapez( f,a,a+tretina,napaka/3,max_globina,tocke,globina+1);
    [I_tmp2,err2,tocke2] = Adaptive_trapez( f,a+tretina,a+2*tretina,napaka/3,max_globina,tocke,globina+1);
    [I_tmp3,err3,tocke3] = Adaptive_trapez( f,a+2*tretina,b,napaka/3,max_globina,tocke,globina+1);
    I = I_tmp1 + I_tmp2 + I_tmp3;
    %error = max([err1,err2,err3]);
    error = err1+err2+err3;
    tocke = [tocke1, tocke2,tocke3];
    tocke = unique(tocke);
    
else
    I = I2;
    
    
end



end


