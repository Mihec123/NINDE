function y = EulerImplicitna( fun, a, b, y0, h )
% Opis:
%   EulerImplicitna  vrne  vrednost resitve diferencialne enacbe z
%   implicitno eulerjevo metodo
%   y_n = y_{n-1}+h*fun(x_{n},y_{n})
%
% Definicija:
%   y = EulerImplicitna( fun, a, b, y0, h )
%
% Vhodni podatki:
%   fun   funkcija diferencialne enacbe podana v obliki @(x,y)...
%   a  levo kraji??e intervala
%   b  desno kraji??e intervala
%   y0 zacetna vrednost za dan problem
%   h  velikost koraka
%
% Izhodni  podatek:
%   y  matrika velikosti 1 x ((b-a)/h +1) vrednosti diferencialne enacbe v
%      x(a+i*h)


stevilo = (b-a)/h;
y = zeros(length(y0),stevilo+1);
y(:,1) = y0;
for i=2:stevilo+1 %za ena zamaknen k mamo se zacetno vrednost pr x=0 not
    ytemp = y(:,i-1) +h*fun(a+(i-1-1)*h,y(:,i-1))'; %zacetni priblizek za implicitno resitev eksplicitna eulerjeva metoda
    fun1 = @(x) y(:,i-1) + h*fun(a+(i-1-1)*h,x)';
    y(:,i) = navadnaIteracija(fun1,ytemp,5,1e-6);
    %y(i) = y(i-1) +h*fun(a+(stevilo-1-1)*h,y(i-1));%isto k prejsna vrstica zato -1 -1
end

end


function y = navadnaIteracija(fun,y0,k,napaka)


yprejsn = y0;
for i = 1:k
    y = fun(yprejsn);
    if abs(y-yprejsn) < napaka
        break;
    else
        yprejsn = y;
    end

    
    
end






end

