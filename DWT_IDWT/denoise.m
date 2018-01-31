%demo_denoise
clc;

% %# for 1D signal
% sqrt_snr = 4;      % Set signal to noise ratio
% init = 2012; % Set rand seed
% [xref,x] = wnoise(1,11,sqrt_snr,init);
% 
% scal = 'one'; % Use model assuming standard Gaussian white noise.
% xd = wden(x,'heursure','s',scal,3,'sym8');
% Nx = length(x);
% subplot(3,1,1),plot(xref), xlim([1 Nx]);
% title('Original Signal');
% subplot(3,1,2),plot(x), xlim([1 Nx]);
% title('Noisy Signal');
% subplot(3,1,3),plot(xd), xlim([1 Nx]);
% title('De-noised Signal - Signal to noise ratio = 4');


%# for 2D image
img = imread('bird.jpg');
[sh,sw,sc] = size(img);
img = double(img);
nimg = img + double(20*randn(size(img)));
[thr,sorh,keepapp] = ddencmp('den','wv',nimg);
d = wdencmp('gbl',nimg,'sym4',2,thr,sorh,keepapp);
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