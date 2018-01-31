img=double(rgb2gray(imread('lena1.jpg')));
Img = imread('lena1.jpg');
%% histep
J = histeq(img,256,1);
%% denoise
[sh,sw,sc] = size(img);
img = double(img);
nimg = img + double(20*randn(size(img)));
[thr,sorh,keepapp] = ddencmp('den','wv',nimg);
d = wdencmp('gbl',nimg,'sym4',2,thr,sorh,keepapp);
figure(2),
subplot(1,3,1); imshow(mat2gray(wcodemat(img,sh*sw))); 
title('Original Image');
subplot(1,3,2); imshow(mat2gray(wcodemat(nimg,sh*sw)));
title('Noisy Image');

%denoise
xd = wdencmp('gbl',nimg,'sym4',2,thr,sorh,keepapp);
subplot(1,3,3); 
% imshow(mat2gray(wcodemat(xd,sh*sw*0.2)));
tmp = wcodemat(xd,sh*sw*0.2);
tmp = tmp./max(256, max(tmp(:)));
imshow(tmp);
title('De-noiszed Image');
%% average filtering and median filtering
avefilt_medfilt;
%% double guassian
double_gaussian;