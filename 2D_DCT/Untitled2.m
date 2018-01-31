orgImg = imread('mm.jpg');
figure, subplot(2,2,1), imshow(orgImg);
title('The original image');
%add noise
noiseImg = imnoise(orgImg, 'salt & pepper', 0.05);
imwrite(noiseImg, 'noiseImage.jpg');

noiseImg = imread('noiseImage.jpg');
subplot(2,2,2), imshow(noiseImg);
title('The noise image');

% % noise = noiseImg - orgImg;
% % nB = dct2(rgb2gray(noise));
% % oB = dct2(rgb2gray(orgImg));

theta = 100;  %a threshold value
[h, w, c] = size(noiseImg);
%r-channel
B1 = dct2(noiseImg(:,:,1));
B1 = remove_less_important_entry(B1, theta);
reImg1 = idct2(B1);

%g-channel
B2 = dct2(noiseImg(:,:,2));
B2 = remove_less_important_entry(B2, theta);
reImg2 = idct2(B2);
%b-channel

B3 = dct2(noiseImg(:,:,3));
B3 = remove_less_important_entry(B3, theta);
reImg3 = idct2(B3);

recoveredImg = cat(3, mat2gray(reImg1), mat2gray(reImg2), mat2gray(reImg3));
% recoveredImg(:,:,1) = uint8(reImg1);
% recoveredImg(:,:,2) = uint8(reImg2);
% recoveredImg(:,:,3) = uint8(reImg3);
subplot(2,2,3), imshow(recoveredImg);
title('The recovered image via dct');


% grayOrgImg = rgb2gray(noiseImg);
% B = dct2(grayOrgImg);
% B = remove_less_important_entry(B, theta);
% reImg = idct2(B);
% subplot(2,2,4), imshow(mat2gray(reImg));

% pause();

% %% medfilt
B1 = medfilt2(noiseImg(:,:,1));
B2 = medfilt2(noiseImg(:,:,2));
B3 = medfilt2(noiseImg(:,:,3));

medReImg = cat(3, B1, B2, B3);
% figure, imshow(medReImg);
subplot(2,2,4), imshow(medReImg);
title('The recovered image via medfilt');


