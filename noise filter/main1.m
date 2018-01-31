Img=double(rgb2gray(imread('lena1.jpg')));
imagesc(Img);
colormap gray;
axis off;
axis image;

%% Gaussian
DoG=fspecial('gaussian',15,1.5);
imagesc(DoG)
surf(DoG)
ImageDog=imfilter(Img,DoG,'symmetric','conv');
figure(1),
imagesc(ImageDog);
axis off;
axis image;