clc;
clear all;
close all;
 
rgb_img=imread('trailer.jpg');
rgb_img=im2double(rgb_img);
figure(1)
subplot(221);
imshow(rgb_img);
title('Original RGB image');
 
% Separating RGB components
R=rgb_img; R(:,:,2)=0; R(:,:,3)=0;
G=rgb_img; G(:,:,1)=0; G(:,:,3)=0;
B=rgb_img; B(:,:,1)=0; B(:,:,2)=0;
 
subplot(222);
imshow(R);
title('Red component');
 
subplot(223);
imshow(G);
title('Green component');
 
subplot(224);
imshow(B);
title('Blue component');
 
figure(2)
subplot(221);
imshow(rgb_img);
title('RGB image');
 
hsi_img=rgb2hsv(rgb_img);
% Separating HSI components
H=hsi_img; H(:,:,2)=0; H(:,:,3)=0;
S=hsi_img; S(:,:,1)=0; S(:,:,3)=0;
I=hsi_img; I(:,:,1)=0; I(:,:,2)=0;
 
subplot(222);
imshow(H);
title('Hue component');
 
subplot(223);
imshow(S);
title('Saturation component');
 
subplot(224);
imshow(I);
title('Intensity component');
