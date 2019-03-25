function v = Skal_prod_pol( p,q,a,b,ro)
% Opis:
%   Skal_prod_pol  izra?una skalarni produkt p in q z ute?jo ro,
%   kjer zahtevamo da je ro polinom
%
%       p1 = \intgral_a^b p(x)*q(x)*ro(x) dx
%
%
%   POMEMBNO: metoda deluje le ce je utez polinom!!!
%
% Definicija:
%   p1 = Skal_prod_pol( p,q,ro,a,b)
%
% Vhodni podatki:
%   p  polinom podan s koeficienti
%   q  polinom podan s koeficienti
%   ro  polinom podan s koeficienti ce ni podan se privzame da je ro
%       identi?no enak 1
%   a  kraji??e intervala
%   b  kraji??e intervala
%
% Izhodni  podatek:
%   v  vrednost skalarnega produkta

if nargin < 5
    ro = [1];
end

p1 = polyint(conv(conv(p,q),ro));
v = diff(polyval(p1,[a,b]));


end

