function avefilt_medfilt
% Image denoising demo


% % disk filter
orgImg = imread('lena1.jpg');
orgImg1 = rgb2gray(orgImg);
h = fspecial('disk',4);
filteredImg = imfilter(orgImg1, h);
figure(3),
subplot(1,2,1), imshow(orgImg1);title('original image');
subplot(1,2,2), imshow(filteredImg);title('avefilt image');

% medfilt2

%mdFImg = medfilt2(orgImg, [3,3]);
mdFImg = medfilt2(orgImg1);
figure(4),
subplot(1,2,1), imshow(orgImg1);title('original image');
subplot(1,2,2), imshow(mdFImg);title('medfilt image');

end