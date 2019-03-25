%1.domaca naloga
addpath('..\numericna integracija')
%1.naloga

f = @(x) 1/sqrt(x+10^(-6));
a =0;
b =1;
napaka = 1/1000;
[I,err,tocke] = Adaptive_Simpson( f,a,b,napaka);
plot(tocke,zeros(1,length(tocke)),'ro')

%2.naloga
a = 0;
b = 4;
utez = conv(conv([4, 0,0],[-1,4]),[-1,4]);
seznam = [1,2,3,5,10]; %seznam n-jev za katere ra?unamo ute?i
vrednosti = zeros(1,length(seznam));
f = @(x) x.*exp(-x);
for i=1:length(seznam)
    n = seznam(i);
    M = generiraj_matriko_Gauss(n,[a,b],utez);
    
    [V,D] = eig(M);
    vozli = diag(D)';
    utezi = zeros(1,n+1);
    for j=0:n
        temp = V(:,j+1)/norm(V(:,j+1)); %normiran lastni vekotr
        utezi(j+1) = temp(1)^2*diff(polyval(polyint(utez),[a b]));
    end
    vrednost = sum(utezi.*f(vozli));
    vrednosti(i) = vrednost;
    
end

fun = @(x) (x.*exp(-x)).*(4*x.^2).*((4-x).^2);
matlab = quad(fun,0,4,1e-16);

razlike = abs(vrednosti-matlab); %razlika med ugrajeno matlabovo metodo in gaussovimi pravili za posamezne n

