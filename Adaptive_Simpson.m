function [I,error,tocke] = Adaptive_Simpson( f,a,b,napaka,prejsne_tocke)
% Opis:
%   Adaptive_Simpson  vrne  vrednost integrala funkcije f na intervalu
%   (a,b) preko rekurzivne adaptivne metode
%
% Definicija:
%   I = Adaptive_Simpson( f,a,b,napaka)
%
% Vhodni podatki:
%   f   funkcija podana v obliki @(x)...
%   a  levo kraji??e intervala
%   b  desno kraji??e intervala
%   napaka  pove do kaksne razlike primerjamo vrednosti integralov I_1 in
%           I_2 na posameznih korakih (glej opis v doma?i nalogi). ?e parameter ni
%           podan je nastavljen na 1e-6
%   prejsne_tocke   delilne tocke intervala jih ne podajamo kot argument
%
% Izhodni  podatek:
%   I   vrednost integrala funkcije f na intervalu (a,b)
%   error   ocena napake integrala
%   tocke   deline tocke intervala

if nargin < 4
    napaka = 1e-6;
    prejsne_tocke = [];
elseif nargin <5
    prejsne_tocke = [];
end



I1 = Simpson_fun(f,a,b);
polovica = (a+b)/2;

I2 = Simpson_fun(f,a,polovica) + Simpson_fun(f,polovica,b);

tocke = [prejsne_tocke, a,b,polovica];
error = abs(I1-I2);

if error > napaka
    [I_tmp1,err1,tocke1] = Adaptive_Simpson( f,a,polovica,napaka,tocke);
    [I_tmp2,err2,tocke2] = Adaptive_Simpson( f,polovica,b,napaka,tocke);
    I = I_tmp1 + I_tmp2;
    error = max(err1,err2);
    tocke = [tocke1, tocke2];
    tocke = unique(tocke);
    
else
    %nevem cist kako richardsonova esktrapolacija mislena
    I = (16*I2-I1)/15;
    
    
end



end

