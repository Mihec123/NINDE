function y = EulerEksplicitna( fun, a, b, y0, h )
% Opis:
%   EulerEksplicitna  vrne  vrednost resitve diferencialne enacbe z
%   eksplicitno eulerjevo metodo. Z njo lahko resujemo tudi sisteme
%   y_n = y_{n-1}+h*fun(x_{n-1},y_{n-1})
%
%   Zgled sistema:(y'' = y'y^2-y, y(0)=1,y'(0)=0)
%      fun = @(x,y) [y(2),y(2).*y(1).^2-y(1)];
%      y = EulerEksplicitna( fun, 0, 0.2, [1,0], 0.1)
%
% Definicija:
%   y = EulerEksplicitna( fun, a, b, y0, h )
%
% Vhodni podatki:
%   fun   funkcija diferencialne enacbe podana v obliki @(x,y)...
%   a  levo kraji??e intervala
%   b  desno kraji??e intervala
%   y0 zacetna vrednost za dan problem
%   h  velikost koraka
%
% Izhodni  podatek:
%   y  matrika velikosti length(y0) x ((b-a)/h +1) vrednosti diferencialne enacbe v
%      x(a+i*h)


stevilo = (b-a)/h;
y = zeros(length(y0),stevilo+1);
y(:,1) = y0;
for i=2:stevilo+1 %za ena zamaknen k mamo se zacetno vrednost pr x=0 not
    y(:,i) = y(:,i-1) +h*fun(a+(i-1-1)*h,y(:,i-1))';%isto k prejsna vrstica zato -1 -1
end

end

