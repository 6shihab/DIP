clc;
close all;
clear all;
X=imread('peppers.png');
figure(1);
subplot(1,2,1);
imshow(X);
title('Original Image');
 
X= double(X);
i=imresize(X,[512 512]);
subplot(1,2,2);
imshow(i);
title('Resize Image');
 
sX=size(X);
[LL,LH,HL,HH]= dwt2(X,'db1');
 
figure(2)
subplot(2,2,1);imshow(LL);title('LL band of image');
subplot(2,2,2);imshow(LH);title('LH band of image');
subplot(2,2,3);imshow(HL);title('HL band of image');
subplot(2,2,4);imshow(HH);title('HH band of image');
