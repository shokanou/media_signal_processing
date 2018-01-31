clc;clf;clear all;

t = -2*pi:0.1:2*pi;
x = sin(t);
x = x + rand(size(x));

figure;
subplot(4,1,1),plot(t,x);
title('original signal');

y = dct(x);
subplot(4,1,2), plot(t, y);
title('The dct result y');



y(10:end)=0;



vx = idct(y);
subplot(4,1,3), plot(t,vx);
title('The idct result x');



subplot(4,1,4),plot(t,x,'gx', t, vx, 'b-');
title('x and vx');
