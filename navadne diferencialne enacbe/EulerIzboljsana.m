function y = EulerIzboljsana (fun, a, b, y0, h)
% Opis:
%   EulerIzboljsana  vrne  vrednost resitve diferencialne enacbe z
%   izboljsano eulerjevo metodo
%   x_{n-1/2} = x_{n-1}+1/2*h, y_{n-1/2} = y_{n-1}+h/2*fun(x_{n-1},y_{n-1})
%   y_n = y_{n-1}+h*fun(x_{n-1/2},y_{n-1/2})
%
% Definicija:
%   y = EulerIzboljsana( fun, a, b, y0, h )
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
    xipol = a+(i-1-1)*h+0.5*h;
    yipol = y(:,i-1) + h/2.*fun(a+(i-1-1)*h,y(:,i-1))';
    y(:,i) = y(:,i-1) +h*fun(xipol,yipol)';
end

end

