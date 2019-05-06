addpath('..\navadne diferencialne enacbe')

%naloga 1

% k = 2*1e-8;
% y0=100;
% m=8*1e6;
% fun = @(x,y) k.*(m-y).*y;
% h = 0.1;
% 
% cas = [10,20,30];
% 
% %Heunova metoda(je runge kutta) bucarjeva tabela [0 0 0;1 1 0; 0 1/2 1/2];
% 
% M = [0 0 0;1 1 0; 0 1/2 1/2];
% 
% for i =1:length(cas)
%     a = 0; %zacnemo merit v dnevu 0
%     b = cas(i);%koncamo v dnevu cas(i)
%     x = [0:h:cas(i)];
%     y1 = EulerImplicitna( fun, a, b, y0, h );
%     y2 = EulerIzboljsana (fun, a, b, y0, h);
%     y3 = RungeKutaEksplicitnaEnoclenska( fun,a,b,y0,h,M );
%     figure;
%     plot(x,y1,'r');
%     plot(x,y2,'b');
%     plot(x,y3,'g');
% end



%naloga 2

fun = @(x,y) 40-20*y;
y0 = 3;
a = 0;
b = 2;
h = 1/20;

y = EulerEksplicitna( fun, a, b, y0, h );
y1 = BDF (fun, a, b, y0, h);