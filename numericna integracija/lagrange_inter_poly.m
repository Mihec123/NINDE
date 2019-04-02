function p = lagrange_inter_poly( n,i,x )
% Opis:
%   lagrange_inter_poly  vrne  lagrangev bazni polinom l_{n,i} podan z
%   delilnimi tockami x
%
% Definicija:
%   p = lagrange_inter_poly( n,i,x )
%
% Vhodni podatki:
%   n  doloca lagrangev bazni polinom l_{n,i}
%   i  kateri bazni polinom gledamo 0<= i <= n
%   x  matrika velikosti 1 x n+1 delilnih tock za bazni polinom
% Izhodni  podatek:
%   p  lagrangev bazni polinom

if n < 0
    error('n mora biti pozitiven');
end

if i>n || i<0
    error('veljati mora 0<= i <= n');
end

if length(x) ~= n+1
    error('matrika x ni pravilne dolzine');
end

p = [1];
for j=0:n
    if j ~= i
        p = conv(p,[1, -x(j+1)]);
    end
end

for j =0:n
    if j~=i
        p = p./(x(i+1)-x(j+1));
    end
end

end

