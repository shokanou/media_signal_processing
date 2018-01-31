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
%colormap(jet(64));        %��ʾΪ64���Ҷ�
%colorbar;                 %��ʾ��ɫ������ʾ�任���ϵ���ֲ�
%C(abs(C)<10)=0;           %��DCT�任���ϵ��ֵС��10��Ԫ����Ϊ0
%D=idct2(C)./255;           %��DCT�任ֵ��һ�����������ҷ��任
%figure;
%imshow(D) ;