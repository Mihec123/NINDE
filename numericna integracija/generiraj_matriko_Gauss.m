function M = generiraj_matriko_Gauss(n,interval,ro)
% Opis:
%   generiraj_matriko_Gauss poveze funkcijo Koeficienti_orto_poly z
%   matriko, s pomo?jo kater dolo?imo ute?i in vozle Gaussovih kvadraturnih
%   pravil za dru?ino ortonormiranih polinomov z ute?jo ro
%
%
%   POMEMBNO: metoda deluje le ce je utez ro polinom!!!
%
% Definicija:
%   M = generiraj_matriko_Gauss(n,interval,ro)
%
% Vhodni podatki:
%   n  doloca velikost matrike, ki bo v primeru da vzamemo m velikosti
%       m+1 x m+1 (na ta na?in dobimo n+1 vozlov in ute?i, n+1 zato ker se ?tevil?enje za?ne z 0)
%   interval  matrika oblike [a,b], kjer je a levo kraji??e intervala, b pa
%             desno kraji??e intervala
%   ro   koeficienti polinoma(matlab oblika) s katerim je spremenjen
%          skalarni produkt, ce ni podan argument se za utez uzame polinom
%          [1], kar pomeni da dobimo navadni skalarni produkt z integralom
%
% Izhodni  podatek:
%   M matrika velikosti n+1 x n+1 s pomo?jo kater dolo?imo ute?i in vozle Gaussovih kvadraturnih
%   pravil za dru?ino ortonormiranih polinomov z ute?jo ro

if nargin < 3
    ro = [1];
end
a = interval(1);
b = interval(2);
%alfa se zacnejo stevilcit z 1 in gredo do n ,beta pa se zacnejo z 1 in gredo do n+1 mi rabmo alfa do n+1
%zato argument n+1 (gledano glede na nalogo je zamaknen in gredo koeficienti
%od 0 do n-1)
[alfa,beta] = Koeficienti_orto_poly( n+1,a,b,ro);

%v matriko gre alfa od 0 do n beta pa od beta pa od 1 do n
%pr beta odsekamo tazadnga ker je dolzine n+2
M = diag(alfa(1:end),0) + diag(beta(2:end-1),1)+ diag(beta(2:end-1),-1);

end

