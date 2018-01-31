function double_gaussian
OrgImg =imread('lena1.jpg');
OrgImg=double(OrgImg);
if max(OrgImg(:))>1
    OrgImg(:)=OrgImg(:)/255.0;
end
 
w=5;
sigma=10;
%B=bfilter2(img,w,sigma);
B=bfltGray(rgb2gray(OrgImg),w,sigma,sigma);
FilteredImg=uint8(B*255.0);
figure(5),
subplot(1,2,1),imshow(rgb2gray(OrgImg));title('original image');
subplot(1,2,2),imshow(FilteredImg);title('filtered image');
end