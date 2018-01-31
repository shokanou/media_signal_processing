function demo_dct_idct_transformation
% A demo to show how to call matlab dct and idct function.
% fyf

close all;
clc;

%% Create a 1D sine signal
t = -2*pi:0.1:2*pi;
x = sin(t);  %clean
x = x + rand(size(x));

figure; 
subplot(4,1,1), plot(t, x,'g-*');
title('The original signal x');

%% Call 1D DCT
y = dct(x);
subplot(4,1,2), plot(t, y);
title('The dct result y');
% % Call fixed length dct
% ty = dct(x, 8);
% figure, plot(ty);

%% Call 1D IDCT
y(10:end) = 0;

vx = idct(y);
subplot(4,1,3), plot(t,vx, 'b-*');
title('The idct result x');


% subplot(4,1,4), plot(t, x,'g*'), hold on; 
% plot(t,vx, 'b-');
subplot(4,1,4),plot(t,x,'gx', t, vx, 'b-');
title('x and vx');

%% Call 2D dct and idct
orgImg = imread('test.jpg');
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

end


function rB = remove_less_important_entry(B, N)

[H, W] = size(B);

%copy
rB = B;

rB(N+1:end,:) = 0;
rB(:,N+1:end) = 0;

for i = 1:N
    for j = 1:N
       if (j > N-i)
           rB(i,j) = 0;
       end
    end
end

end
