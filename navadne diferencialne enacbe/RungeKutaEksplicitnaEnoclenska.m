function y = RungeKutaEksplicitnaEnoclenska( fun,a,b,y0,h,M )
% Opis:
%   RungeKutaEksplicitnaEnoclenska  vrne  vrednost resitve diferencialne enacbe z
%   runge kutta metodo podano z bucarjevo tabelo M
%
% Definicija:
%   y = RungeKutaEksplicitnaEnoclenska( fun,a,b,y0,h,M )
%
% Vhodni podatki:
%   fun   funkcija diferencialne enacbe podana v obliki @(x,y)...
%   a  levo kraji??e intervala
%   b  desno kraji??e intervala
%   y0 zacetna vrednost za dan problem
%   h  velikost koraka
%   M  bucarjeva tabela za metodo oblike [[alfe,0]',[bete;game]]
%
% Izhodni  podatek:
%   y  matrika velikosti 1 x ((b-a)/h +1) vrednosti diferencialne enacbe v
%      x(a+i*h)



stevilo = (b-a)/h;
y = zeros(length(y0),stevilo+1);
y(:,1) = y0;

for i=2:stevilo+1 %za ena zamaknen k mamo se zacetno vrednost pr x=0 not
    k = zeros(length(y0),length(M)-1);
    for j =1:length(M)-1
        x_n = a+(i-1-1)*h;
        k(:,j) = fun(x_n + M(j,1)*h,y(:,i-1) + h*sum(k.*repmat(M(j,2:end)',1,length(y0))',2));
    end
    y(:,i) = y(:,i-1) +h*(sum(k.*repmat(M(end,2:end)',1,length(y0))',2));
end

end

