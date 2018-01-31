clc;clf;clear all;
RGB = imread('mm.jpg');
I = rgb2gray(RGB);
J = dct2(I);

figure(1),
imshow(RGB);
figure(2),
imshow(J);
figure(3),imshow(log(abs(J)),[]), colormap(jet), colorbar;

J(abs(J)<10) = 0;
K = idct2(J);

figure(4),
imshow(K);
figure,imshow(I);
%colormap(jet(64));        %显示为64级灰度
%colorbar;                 %显示颜色条，显示变换后的系数分布
%C(abs(C)<10)=0;           %将DCT变换后的系数值小于10的元素设为0
%D=idct2(C)./255;           %对DCT变换值归一化，进行余弦反变换
%figure;
%imshow(D) ;