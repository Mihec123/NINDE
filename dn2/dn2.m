addpath('..\navadne diferencialne enacbe')
format long
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% naloga 1

% k = 2*1e-8;
% y0=100;
% m=8*1e6;
% fun = @(x,y) k.*(m-y).*y;
% h = 0.1;
% 
% cas = 30; %dni
% 
% %Heunova metoda(je runge kutta) bucarjeva tabela [0 0 0;1 1 0; 0 1/2 1/2];
% 
% M = [0 0 0;1 1 0; 0 1/2 1/2];
% 
% a = 0; %zacnemo merit v dnevu 0
% b = cas;%koncamo v dnevu cas
% x = [0:h:cas];
% y1 = EulerImplicitna( fun, a, b, y0, h );
% y2 = EulerIzboljsana (fun, a, b, y0, h);
% y3 = RungeKutaEksplicitnaEnoclenska( fun,a,b,y0,h,M );
% figure;
% plot(x,y1,'r');
% plot(x,y2,'b');
% plot(x,y3,'g');
% %resitve za vsak dan
% y1 = y1(1:1/h:end);
% y2 = y2(1:1/h:end);
% y3 = y3(1:1/h:end);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%naloga 2

% fun = @(x,y) 40-20*y;
% y0 = 3;
% a = 0;
% b = 2;
% tocna = @(x) 2+ exp(-20*x); %tocna resitev
% hji = [1/10,1/15,1/20,1/25];
% 
% 
% for i = 1:length(hji)
%     h = hji(i);
%     x = [a:h:b];
%     y = EulerEksplicitna( fun, a, b, y0, h );
%     y1 = BDF (fun, a, b, y0, h);
%     razlikaEuler = abs(tocna(x)-y)
%     razlikaBDF = abs(tocna(x)-y1)
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%naloga 3

a = 0;
b = 10;
hji = [0.1,0.05];
y0 = [0,1];
fun = @(x,y) [y(2),1/3*y(1)^2*y(2)-3*x*y(1)];

for i = 1:length(hji)
    h = hji(i);
    x = [a:h:b];
    res = MilneSistem (fun, a, b, y0, h);
    figure;
    plot(x,res(1,:))
    yb = res(1,end) %y(b)
end