%1.domaca naloga

%1.naloga

f = @(x) 1/sqrt(x+10^(-6));
a =0;
b =1;
napaka = 1/1000;
[I,napaka,tocke] = Adaptive_Simpson( f,a,b,napaka);
plot(tocke,zeros(1,length(tocke)),'ro')