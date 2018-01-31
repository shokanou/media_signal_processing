%demo2_compress_image
clc;
close all;

img = imread('bird.jpg');
figure, imshow(img); 

level = 5;  %decomposition level
basis = 'sym8';
[c, l] = wavedec2(img, level, basis);

opt = 'gbl';  %use the global threshold
thr = 10; %threshold value;
sorh = 'h';  % Hard thresholding
keepapp = 1; % Approximation coefficients cannot be thresholded
[xd,cxd,lxd,perf0,perfl2] = wdencmp(opt,c,l,basis,level,thr,sorh,keepapp);
subplot(1,2,1), subimage(img)
title('Original Image')
subplot(1,2,2), image(mat2gray(xd))
title(['Compressed Image - Global Threshold = ' num2str(thr)])



