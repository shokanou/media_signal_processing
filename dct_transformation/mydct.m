clc;clf;clear all;

t = -4*pi:pi:3*pi;
x = sin(t);
x = x + rand(size(x));

B = zeros(8,8);

for i = 1:8
    B(:,i) = dct_basis(i-1)
end



figure;
subplot(4,1,1),plot(t,x);
title('original signal');

y1 = dct(x);
y2 = x*B;

subplot(4,1,2), plot(t, y1);
title('The dct result y1');





subplot(4,1,3), plot(t,y2);
title('The dct result y2 using my function');



subplot(4,1,4),plot(t,y1,'gx', t, y2, 'b-');
title('y1 and y2');
